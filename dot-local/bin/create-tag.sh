#!/usr/bin/env bash
#
# usage: create-tag.sh [-M|-m|-p][-d]
# defaults to -m
# -M creates new major version
# -m creates new minor version
# -p creates new patch version
# -d dry run
#
last_tag=$(git for-each-ref \
    --sort=creatordate \
    --format '%(refname:lstrip=2)' refs/tags | tail -1)

# if no tags where found assume v0.0.0
last_tag=${last_tag:-"v0.0.0"}

major=$(echo "${last_tag}" | cut -d'.' -f1 | sed -e 's/v//' | xargs echo -n)
minor=$(echo "${last_tag}" | cut -d'.' -f2 | xargs echo -n)
patch=$(echo "${last_tag}" | cut -d'.' -f3 | xargs echo -n)

increment() {
    echo "${1}"+1 | bc
}

while getopts "Mmpd" opt; do
    case $opt in
        m)
            minor=$(increment "$minor")
            patch=0
            ;;
        M)
            major=$(increment "$major")
            minor=0
            patch=0
            ;;
        p)
            patch=$(increment "$patch")
            ;;
        d)
            dry_run=1
            ;;
        *)
            echo Invalid option: "$opt" >&2
            exit 2
            ;;
    esac
done
if [[ "$OPTIND" = "1" ||
    ("$OPTIND" = "2" && "$dry_run" = "1") ]]; then # Means no option was given
    minor=$(increment "$minor")
    patch=0
fi

new_tag=v${major}.${minor}.${patch}
new_desc=${new_tag//v/version /}

if [ "$dry_run" = "1" ]; then
    echo "$new_tag"
else
    git tag -m "$new_desc" "$new_tag"
fi

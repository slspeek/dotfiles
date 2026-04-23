shfiles := shell("fdfind --glob \"*.sh\"|tr '\n' ' '")
dotfiles := ".bashrc .profile .bash_aliases .bash_logout"
scripts := shfiles + " dot-bashrc dot-profile dot-bash_aliases dot-bash_logout"

all: shebangline bashsyntax dotshellcheck shellcheck shfmt maxlinelength

fix: shellcheckfix shfmtfix

shebangline:
	set -e; \
	for SCRIPT in {{shfiles}}; do \
		awk 'NR == 1 { \
			if ($0 != "#!/usr/bin/env bash") { \
				print(FILENAME, " does not have a good shebang line"); \
				exit 2 \
			} \
		     }'  $SCRIPT;\
	done

bashsyntax:
	set -e; \
	for SCRIPT in {{scripts}}; do \
		bash -n $SCRIPT;\
	done

dotshellcheck:
	cd $HOME && shellcheck --shell=bash {{dotfiles}} 

shellcheck:
	set -e; \
	for SCRIPT in {{shfiles}}; do \
		shellcheck --shell=bash $SCRIPT;\
	done

shellcheckfix:
	for SCRIPT in {{scripts}}; do \
		shellcheck  --format diff $SCRIPT|git apply --allow-empty;\
	done

shfmt:
	set -e; \
	for SCRIPT in {{scripts}}; do \
		shfmt --space-redirects \
		--case-indent \
		--indent 2 \
		--diff \
		$SCRIPT;\
	done

shfmtfix:
	for SCRIPT in {{scripts}}; do \
		shfmt --space-redirects \
		--case-indent \
		--indent 2 \
		--write $SCRIPT;\
	done

maxlinelength:
	set -e; \
	for SCRIPT in {{scripts}}; do \
		awk 'length($0) > 80 { \
		  long_lines[++i]=NR; \
		  print FILENAME,NR, "is te lang" \
		} \
		END { \
		  if (length(long_lines)> 0) exit 2 \
		}' $SCRIPT; \
	done

shfiles := shell("fdfind --glob \"*.sh\"|tr '\n' ' '")
dotfiles := ".bashrc .profile .bash_aliases .bash_logout"
maxcol := "80"
ts := "4"
scripts := shfiles + " dot-bashrc dot-profile dot-bash_aliases dot-bash_logout"

all: shebangline bashsyntax dotshellcheck shellcheck shfmt maxlinelength

fix: shellcheckfix shfmtfix

shebangline:
    #!/usr/bin/env bash
    echo "Checking shebang lines"
    set -e; 
    for SCRIPT in {{ shfiles }}; do 
    	awk 'NR == 1 { 
    		if ($0 != "#!/usr/bin/env bash") { 
    			print(FILENAME, " does not have a good shebang line"); 
    			exit 2 
    		} 
    	     }'  $SCRIPT;
    done

bashsyntax:
    #!/usr/bin/env bash
    echo "Checking BASH syntax"
    set -e 
    for SCRIPT in {{ scripts }}; do 
    	bash -n $SCRIPT;
    done

dotshellcheck:
    #!/usr/bin/env bash
    echo "Shellcheck on {{ dotfiles }}"
    cd $HOME && shellcheck --shell=bash {{ dotfiles }} 

shellcheck:
    #!/usr/bin/env bash
    echo "Shellcheck"
    set -e 
    for SCRIPT in {{ shfiles }}; do 
    	shellcheck --shell=bash $SCRIPT
    done

shellcheckfix:
    #!/usr/bin/env bash
    echo "Shellcheck fix"
    for SCRIPT in {{ scripts }}; do 
    	shellcheck  --format diff $SCRIPT|git apply --allow-empty
    done

shfmt:
    #!/usr/bin/env bash
    echo "Shfmt"
    set -e 
    for SCRIPT in {{ scripts }}; do 
    	shfmt --space-redirects \
    	--case-indent \
    	--indent {{ts}} \
    	--diff \
    	$SCRIPT
    done

shfmtfix:
    #!/usr/bin/env bash
    echo "Shfmt fix"
    for SCRIPT in {{ scripts }}; do 
    	shfmt --space-redirects \
    	--case-indent \
    	--indent {{ts}} \
    	--write $SCRIPT
    done

maxlinelength:
    #!/usr/bin/env bash
    echo "Checking maxline length of {{ maxcol }}" 
    set -e
    for SCRIPT in {{ scripts }}; do 
    	awk -vmaxcol={{ maxcol }} -e 'length($0) > maxcol {
    	  long_lines[++i]=NR
    	  print FILENAME,NR, "is te lang"
    	} 
    	END {
    	  if (length(long_lines)> 0) exit 2
    	}' $SCRIPT
    done

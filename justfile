all: bashsyntax shellcheck shfmt

fix: shellcheckfix shfmtfix

bashsyntax:
	for SCRIPT in $(fdfind --glob "*.sh"); do \
		bash -n $SCRIPT;\
	done

shellcheck:
	for SCRIPT in $(fdfind --glob "*.sh"); do \
		shellcheck $SCRIPT;\
	done

shellcheckfix:
	for SCRIPT in $(fdfind --glob "*.sh"); do \
		shellcheck  --format diff $SCRIPT|git apply --allow-empty;\
	done

shfmt:
	for SCRIPT in $(fdfind --glob "*.sh"); do \
		shfmt --space-redirects \
		--case-indent \
		--indent 2 \
		--diff \
		$SCRIPT;\
	done

shfmtfix:
	for SCRIPT in $(fdfind --glob "*.sh"); do \
		shfmt --space-redirects \
		--case-indent \
		--indent 2 \
		--write $SCRIPT;\
	done


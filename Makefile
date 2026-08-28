.PHONY: create-log-folder log-styles print-styles

print-styles:
	@echo ""
	@echo -e "\x1b[33m=== Print styles ===\x1b[0m"
	runghc -isrc examples/PrintAllStyles.hs

create-log-folder:
	mkdir -p log

log-styles: create-log-folder
	@echo ""
	@echo -e "\x1b[33m=== Log styles ===\x1b[0m"
	bash -c 'script -c "runghc -isrc examples/PrintAllStyles.hs" log/PrintAllStyles.log'

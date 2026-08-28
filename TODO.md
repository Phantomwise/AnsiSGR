# TODO

- [ ] Add # to Hex codes so VS Code extensions can show a preview of the color
- [ ] Find a better name
- [ ] Rename github repo
- [ ] Use two namespaces, one for String and one for Text, so the module doesn't break when Text support is added
- [ ] Check organization of files follow guidelines
- [ ] Figure out how to use Cabal
	- [ ] Add license file
	- [ ] Add version bounds on dependencies
- [ ] Add README
	- Disclaimer about some codes being untested-on-real-terminal codes (though tested by capturing terminal output)
- [ ] Add CHANGELOG
- [ ] Add a shell.nix
- [ ] Make an automated test that tries all the functions and run it with something to capture the output like `script`
	- `Test.hs` imports TerminalSGR, calls every function, prints results normally
	- Then is run from a terminal and the actual real output is captured:
		- `bash -c 'script -c "runghc -i. -isrc Test.hs" test.log'`
		- `bash -c 'script -c "cabal run test-sgr" test.log'`

## Later

- [ ] Figure out how to support Text without duplicating everything (check how text-ansi does it)
	- Leaning towards: just duplicate the code for better performance, and make sure everything can be imported separately

## Remaining unsupported SGR:

- FontPrimary             = 10      -- Primary (default) font                 —
- FontAlt<Nb>             = 11–19   -- Alternative font                       Select alternative font n − 10
- FontAlt1                = 11      -- Alternative font                       —
- FontAlt2                = 12      -- Alternative font                       —
- FontAlt3                = 13      -- Alternative font                       —
- FontAlt4                = 14      -- Alternative font                       —
- FontAlt5                = 15      -- Alternative font                       —
- FontAlt6                = 16      -- Alternative font                       —
- FontAlt7                = 17      -- Alternative font                       —
- FontAlt8                = 18      -- Alternative font                       —
- FontAlt9                = 19      -- Alternative font                       —

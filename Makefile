build:
	stack build --fast

build-watch:
	stack build --file-watch

docs:
	cabal haddock --hyperlink-source

ghci:
	stack ghci

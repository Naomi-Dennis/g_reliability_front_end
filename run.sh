#!/bin/sh
if $1 == "dev"
then
	rm -rf src/prod
else
	rm -rf src/dev
fi

elm make src/Main.elm --output=js/vega_graph.js --optimize


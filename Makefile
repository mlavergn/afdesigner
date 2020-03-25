###############################################
#
# Makefile
#
###############################################

# Default is to run a clean build and test
.DEFAULT_GOAL := build

open:
	open -a "Script Editor" afexport.applescript

run:
	osascript afexport.applescript Demo app

pack:
	git clean -xffd
	git submodule foreach --recursive git clean -xffd
	./external/cctools/build-for-rolf.sh
	dotnet pack
	unzip -l ./bin/Release/RolfKvinge.StripReplacement.0.1.0.nupkg

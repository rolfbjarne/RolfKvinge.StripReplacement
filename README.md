# RolfKvinge.StripReplacement

This is a NuGet that provides a strip tool with a fix for https://github.com/xamarin/xamarin-macios/issues/19157.

# To build

1. Presumably you have Xcode installed already, otherwise you wouldn't have reached this place. This was tested with Xcode 16.1.

2. Clone this repository

	```shell
	$ git clone --recurse-submodules https://github.com/rolfbjarne/RolfKvinge.StripReplacement
	```

3. Build.

	```shell
	$ make
	```

4. If support for Xcode 16.1 has not been released for the iOS workload (which has not happened at the time of this writing):

	a. Replace the `strip` binary in Xcode with the one built here.

		```shell
		$ echo "Will overwrite this file: $(xcrun -f strip)"
		$ cp external/cctools/build/Release/strip "$(xcrun -f strip)"
		```

	b. Now build your project.

5. If support for Xcode 16.1 has been released [^1], you can use the NuGet instead, by:

	a. Add a `NuGet.config` to your project with a feed that points to the directory where the `nupkg` is located:

		```xml
		<?xml version="1.0" encoding="utf-8"?>
		<configuration>
			<packageSources>
				<add key="local-tests-feed" value="/absolute/path/to/RolfKvinge.StripReplacement/bin/Release" />
			</packageSources>
		</configuration>
		```

	b. Reference the NuGet in your csproj:

		```xml
		<ItemGroup>
			<PackageReference Include="RolfKvinge.StripReplacement" Version="0.1.0" />
		</ItemGroup>
		```

	c. Now build your project.

I might at some point put the package on NuGet.org after support for Xcode 16.1 has been released.

[^1]: This is because the release with support Xcode 16.1 has this change: https://github.com/xamarin/xamarin-macios/pull/21581

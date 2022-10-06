# Swift command line build variable example

This example project demonstrates taking a build-time string argument, such as from your build pipeline, and making it available in Swift code.

You might want this when you have to build more than one way, but a build flag isn't sufficient because you need a string value, and you prefer that string to be embedded in the binary, not bundled with the app in a data file.

Keys built into a published app by this method are still discoverable by those who would exploit them. Still, this is a bit more private than Info.plist.

This method relies on Objective-C interop and preprocessor macros.

## See it work

First build the example app and run it. It should show that the setting is not set.

```sh
$ xcodebuild
$ build/Release/CommandLineBuildVariableExample
someSetting is nil
```

Now clean, and build again with our preprocessor definition set. The value is used by the compiler and becomes available to code when we run.

```sh
$ xcodebuild clean
$ xcodebuild "GCC_PREPROCESSOR_DEFINITIONS='$GCC_PREPROCESSOR_DEFINITIONS SOME_SETTING=HelloWorld'"
$ build/Release/CommandLineBuildVariableExample
someSetting: HelloWorld
```

## How it works

`BuildVariables.m` uses the C preprocessor to read the setting into in a string property, in a class with a shared instance property. If the setting isn't provided, the macro resolves to the empty string, so we treat that case as `nil`. We could also choose to fail the build in this case, if specifying the setting was required.

`CommandLineBuildVariableExample-Bridging-Header.h` exposes the BuildVariables class to Swift.

`main.swift` gets the shared instance of BuildVariables and reads the setting property. It then branches on the presence of the setting and uses the value if it's present.

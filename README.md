# Private Properties in Protocols
How to make types that confirm to protocols have private fields:

The slides are attached in pdf format [here](PrivatePropertiesInProtocols.pdf)

## How to use this project:

1. clone this repo
2. In terminal, at root of this directory, run `pod install` 
3. run `xed .` in terminal to open the workspace
4. compile the program and witness the magic!

In Swift, the types which can confirm to a `Protocol` are:

`Class`  `Struct`  `Enum` as well as another `Protocol` which is called Protocol Inheritance.

#### Protocols can contain
- Properties
- Methods
- Class properties and Methods: For Protocols which apply to only a class
- Static properties and methods: For all types
- Initializers: Required and Optional
- @Attributes : eg. `@objc`  `@DiscardableResult`  `@State`  `@Inlinable` `@IBAction`, etc

Once you define these fields, you can only choose them to be either of `internal`  `public` or `open`.

However, the Swift compiler does not allow to mark a field in Protocol as `private` or `fileprivate`.


## Solution:

### Step 1: Make the fields you want `Private` as `Public` (or `Internal`)

### Step 2: Write the Protocol Extension on it's Methods, utilizing those fields which you made public in Step 1

Protocol Extensions are default implementation for Types confirming to that Protocol

### Step 3: Program a meta programming tool to copy-paste this implementation to every conforming type

Here, I am using Sourcery as Meta programming tool, and it's setup requires a Configuration file, and a Template file.

#### The [Config file](.sourcery.yml): `<ProjectRoot>/.sourcery.yml`:

This file contains the commands to pass to Sourcery

#### The [Template file](/PrivatePropertiesInProtocols/SourceryTemplates/LabelSettable.stencil): `<ProjectRoot>/<ProjectName>/SourceryTemplate/LabelSettable.stencil`:

This file contains behaviour for the templating tool. Here is where the instruction is to copy particular piece of code to  every type implementing / confirming to a Protocol


#### Optional: Build configuration in Xcode

This command calls `sourcery --config`, as added in [this commit](https://github.com/Viranchee/PrivatePropertiesInProtocols/commit/b5b95fc70389c34686f8e4a3b6470b1d58403560)

### Step 4: Revert steps 1 and 2:

Remove the field requirement altogether from the Protocol

Since the field does not exist in the protocol, the protocol extension will complain of undefined field. 
Hence to satisfy the compiler, remove that protocol extension.

Mark that field in it's implementing type as `private`

### Step 5: There is no step 5

You have successfully implemented Private properties inside of protocols. If ever you change the field name, there will be compile time errors, which you will be forced to fix.

## Practical Usage:

#### Code sharing across multiple UIViews and UIViewControllers:

To have shared code to be at single place, I had to either:
- Make fields public
- Have a derived class with those implementation and use that derived class

The 2nd option had a limitation, It was not composable.

The 1st option had a limitation, since there were code reviews in the project I was working on, I was not allowed to expose UIViews outside of a class.
Hence I had to come up with scalable and intuitive approach. 
I quickly figured out that Extensions of a Type have same access control where the Extension is declared in. 
I could not access the properties outside of the file.
This led to me coming up with a good use of Sourcery to Copy Paste the implementation in every file confirming to that Protocol.

## Thank You:
- [Yogesh Singh](https://twitter.com/_yogeshsingh), for mentoring and providing a platform to showcase my ideas
- [Pointfree.co](https://pointfree.co), for improving my understanding of Programming, Composition, Functional Programming, Thinking about in terms of Software. 
- [Krzysztof Zablocki](https://twitter.com/merowing_), for building [Sourcery](https://github.com/krzysztofzablocki/Sourcery), a library to automate swift code generation and encouraging Meta-programming 
- Peer reviewers for not allowing me to expose UIViews. It is because of that I am able to come up with this research and write this blog post :)

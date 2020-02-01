# Private Properties in Protocols
How to make types that confirm to protocols have private fields:

In Swift, the types which can confirm to a `Protocol` are:
`Class`  `Struct`  `Enum` as well as another `Protocol` which is Protocol Inheritance.

#### Protocols can contain
- Properties
- Methods
- Class properties and Methods: For Protocols which apply to only a class
- Static properties and methods: For all types
- Initializers: Required and Optional
- @Attributes : eg. `@objc`  `@DiscardableResult`  `@State`  `@Inlinable`, etc

Once you define these fields, you can only choose them to be either of `internal`  `public` or `open`.
However, the Swift compiler does not allow to mark a field in Protocol as `private` or `fileprivate`.




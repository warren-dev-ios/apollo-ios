/// An protocol for a struct that represents a GraphQL Input Object.
///
/// - See: [GraphQLSpec - Input Objects](https://spec.graphql.org/draft/#sec-Input-Objects)
@dynamicMemberLookup
public protocol InputObject: GraphQLOperationVariableValue {
  associatedtype Fields

  var dict: InputDict { get set }
  static var fields: Fields { get }

  subscript<T: GraphQLOperationVariableValue>(
    dynamicMember field: KeyPath<Self.Fields, InputField<T>>
  ) -> T { get set }
}

extension InputObject {
  public var jsonEncodableValue: JSONEncodable? { dict.jsonEncodableValue }

  public subscript<T: GraphQLOperationVariableValue>(
    dynamicMember field: KeyPath<Self.Fields, InputField<T>>
  ) -> T {
    get {
      let key = Self.fields[keyPath: field]
      return dict[key.key] as T
    }
    set {
      let key = Self.fields[keyPath: field]
      dict[key.key] = newValue
    }
  }
}

/// A structure that wraps the underlying data dictionary used by `InputObject`s.
public struct InputDict: GraphQLOperationVariableValue {

  private var data: [String: GraphQLOperationVariableValue]

  public init(_ data: [String: GraphQLOperationVariableValue] = [:]) {
    self.data = data
  }

  public var jsonEncodableValue: JSONEncodable? { data.jsonEncodableObject }

  subscript<T: GraphQLOperationVariableValue>(_ key: StaticString) -> T {
    get { data[key.description] as! T }
    set { data[key.description] = newValue }
  }

}

public struct InputField<T> {
  public init(_ key: StaticString) {
    self.key = key
  }
  
  let key: StaticString
}

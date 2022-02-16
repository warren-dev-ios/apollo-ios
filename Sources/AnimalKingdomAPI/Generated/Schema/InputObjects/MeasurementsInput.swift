// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct MeasurementsInput: InputObject {
  public var dict: InputDict
  public static let fields: Fields = Fields()

  public struct Fields {}

  init(
    height: Float,
    weight: Float,
    wingspan: GraphQLNullable<Float> = nil
  ) {
    dict = InputDict([
      "height": height,
      "weight": weight,
      "wingspan": wingspan
    ])
  }

}

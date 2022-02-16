// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PetAdoptionInput: InputObject {
  public var dict: InputDict
  public static let fields: Fields = Fields()

  public struct Fields {
    public let ownerID = InputField<ID>("ownerID")
    public let petID = InputField<ID>("petID")
    public let humanName = InputField<GraphQLNullable<String>>("humanName")
    public let favoriteToy = InputField<String>
    public let isSpayedOrNeutered = InputField<Bool?>
    public let measurements = InputField<GraphQLNullable<MeasurementsInput>>("measurements")
  }

  public init(
    ownerID: ID,
    petID: ID,
    humanName: GraphQLNullable<String> = nil,
    favoriteToy: String,
    isSpayedOrNeutered: Bool?,
    measurements: GraphQLNullable<MeasurementsInput> = nil
  ) {
    dict = InputDict([
      "ownerID": ownerID,
      "petID": petID,
      "humanName": humanName,
      "favoriteToy": favoriteToy,
      "isSpayedOrNeutered": isSpayedOrNeutered,
      "measurements": measurements
    ])
  }
}

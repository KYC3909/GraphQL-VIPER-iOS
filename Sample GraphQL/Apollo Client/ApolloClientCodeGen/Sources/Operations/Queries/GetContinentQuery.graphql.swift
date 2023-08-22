// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetContinentQuery: GraphQLQuery {
  public static let operationName: String = "GetContinent"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetContinent {
        continents {
          __typename
          name
          code
        }
      }
      """#
    ))

  public init() {}

  public struct Data: ApolloClientCodeGen.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { ApolloClientCodeGen.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("continents", [Continent].self),
    ] }

    public var continents: [Continent] { __data["continents"] }

    /// Continent
    ///
    /// Parent Type: `Continent`
    public struct Continent: ApolloClientCodeGen.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { ApolloClientCodeGen.Objects.Continent }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("name", String.self),
        .field("code", ApolloClientCodeGen.ID.self),
      ] }

      public var name: String { __data["name"] }
      public var code: ApolloClientCodeGen.ID { __data["code"] }
    }
  }
}

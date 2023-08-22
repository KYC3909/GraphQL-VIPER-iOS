// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCountriesQuery: GraphQLQuery {
  public static let operationName: String = "GetCountries"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetCountries($code: String!) {
        countries(filter: {continent: {eq: $code}}) {
          __typename
          name
          code
          awsRegion
          capital
          emojiU
          emoji
          states {
            __typename
            name
            code
          }
        }
      }
      """#
    ))

  public var code: String

  public init(code: String) {
    self.code = code
  }

  public var __variables: Variables? { ["code": code] }

  public struct Data: ApolloClientCodeGen.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { ApolloClientCodeGen.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("countries", [Country].self, arguments: ["filter": ["continent": ["eq": .variable("code")]]]),
    ] }

    public var countries: [Country] { __data["countries"] }

    /// Country
    ///
    /// Parent Type: `Country`
    public struct Country: ApolloClientCodeGen.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { ApolloClientCodeGen.Objects.Country }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("name", String.self),
        .field("code", ApolloClientCodeGen.ID.self),
        .field("awsRegion", String.self),
        .field("capital", String?.self),
        .field("emojiU", String.self),
        .field("emoji", String.self),
        .field("states", [State].self),
      ] }

      public var name: String { __data["name"] }
      public var code: ApolloClientCodeGen.ID { __data["code"] }
      public var awsRegion: String { __data["awsRegion"] }
      public var capital: String? { __data["capital"] }
      public var emojiU: String { __data["emojiU"] }
      public var emoji: String { __data["emoji"] }
      public var states: [State] { __data["states"] }

      /// Country.State
      ///
      /// Parent Type: `State`
      public struct State: ApolloClientCodeGen.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { ApolloClientCodeGen.Objects.State }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("name", String.self),
          .field("code", String?.self),
        ] }

        public var name: String { __data["name"] }
        public var code: String? { __data["code"] }
      }
    }
  }
}

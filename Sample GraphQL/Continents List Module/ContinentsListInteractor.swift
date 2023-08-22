//
//  ContinentsListInteractor.swift
//  Sample GraphQL
//
//  Created by Krunal on 23/3/2023.
//

import Foundation
import Apollo
import ApolloClientCodeGen
import Combine

struct GQL_Continent {
    let id = UUID()
    let name: String
    let code: String
    
    static func dummy() -> GQL_Continent {
        return GQL_Continent(name: "Africa", code: "AF")
    }
    
    init(name: String, code: String) {
        self.name = name
        self.code = code
    }
    init(_ continent: GetContinentQuery.Data.Continent) {
        self.name = continent.name
        self.code = continent.code
    }
}

extension GQL_Continent: Identifiable { }

class ContinentsListInteractor {
    @Published var continents = [GQL_Continent]()
    
    func loadContinents() -> AnyPublisher<[GQL_Continent], Error> {
        return Future<[GQL_Continent], Error> { [weak self] promise in
            apolloClient.fetch(query: GetContinentQuery()) { result in
                switch result {
                case let .success(response):
                    self?.continents = response.data?.continents.map(GQL_Continent.init) ?? []
                    promise(.success(self?.continents ?? []))
                case let .failure(error):
                    print(error)
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}

//
//  CountriesListInteractor.swift
//  Sample GraphQL
//
//  Created by Krunal on 27/3/2023.
//

import Foundation
import Apollo
import ApolloClientCodeGen
import Combine

struct GQL_State {
    let id = UUID()
    let name: String
    let code: String
    
    init(_ state: GetCountriesQuery.Data.Country.State) {
        self.name = state.name
        self.code = state.code ?? "N/A"
    }
}
struct GQL_Country {
    let id = UUID()
    let name: String
    let code: String
    let awsRegion: String
    let capital: String
    let emoji: String
    let emojiU: String
    let states: String

    init(_ country: GetCountriesQuery.Data.Country) {
        self.name = country.name
        self.code = country.code
        self.awsRegion = country.awsRegion
        self.capital = country.capital ?? "N/A"
        self.emoji = country.emoji
        self.emojiU = country.emojiU
        let states = country.states.map(GQL_State.init)
        
        var strStates = ""
        states.reduce(into: strStates) { partialResult, state in
            strStates += "    \(state.name): \(state.code)\n"
        }
        self.states = strStates
    }
}

extension GQL_Country: Identifiable { }

class CountriesListInteractor {
    @Published var countries = [GQL_Country]()
    private let continent: GQL_Continent
    
    init(continent: GQL_Continent) {
        self.continent = continent
    }
    
    func loadCountries() -> AnyPublisher<[GQL_Country], Error> {
        return Future<[GQL_Country], Error> { promise in
            apolloClient.fetch(query: GetCountriesQuery(code: self.continent.code)) { [weak self] result in
                switch result {
                case let .success(response):
                    self?.countries = response.data?.countries.map(GQL_Country.init) ?? []
                    promise(.success(self?.countries ?? []))
                case let .failure(error):
                    print(error)
                    promise(.failure(error))
                }
            }
        }.receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    deinit {
        debugPrint(#file)
    }
}


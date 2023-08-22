//
//  CountriesListPresenter.swift
//  Sample GraphQL
//
//  Created by Krunal on 27/3/2023.
//

import Foundation
import Combine

class CountriesListPresenter: ObservableObject {
    private let interactor: CountriesListInteractor
    @Published var countries = [GQL_Country]()
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: CountriesListInteractor) {
        self.interactor = interactor
    }

    func onAppearLoadCountries() {
        interactor.loadCountries()
            .sink(receiveCompletion: { result in
                switch result {
                case let .failure(error):
                    print(error)
                default:
                    print("finished with Result:\(result)")
                }
            }, receiveValue: { [weak self] countries in
                self?.countries = countries
            })
            .store(in: &cancellables)
    }
    deinit {
        debugPrint(#file)
    }
}

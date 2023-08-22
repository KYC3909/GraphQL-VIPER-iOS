//
//  ContinentsListPresenter.swift
//  Sample GraphQL
//
//  Created by Krunal on 23/3/2023.
//

import SwiftUI
import Combine

class ContinentsListPresenter: ObservableObject {
    private let interactor: ContinentsListInteractor
    private let router = ContinentsListRouter()

    @Published var continents = [GQL_Continent]()
    private var cancellables = Set<AnyCancellable>()

    init(interactor: ContinentsListInteractor) {
        self.interactor = interactor
    }
    
    func onAppearLoadContinents() {
        interactor.loadContinents()
            .sink(receiveCompletion: { result in
                switch result {
                case let .failure(error):
                    print(error)
                default:
                    print("finished with Result:\(result)")
                }
            }, receiveValue: { [weak self] continents in
                self?.continents = continents
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        for continent: GQL_Continent,
        @ViewBuilder content: () -> Content
      ) -> some View {
        NavigationLink(
          destination: router.makeCountriesListView(
            for: continent)) {
              content()
        }
    }
}

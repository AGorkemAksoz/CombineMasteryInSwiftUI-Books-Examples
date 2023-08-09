//
//  DataTaskPublisherViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import Combine
import Foundation


class DataTaskPublisherViewModel: ObservableObject {
    @Published var dataToView: [CatFact] = []
    @Published var errorForAlert: ErrorForAlert?
    
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://cat-fact.herokuapp.com/facts")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CatFact].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { [unowned self] completion in
                if case .failure(let error) = completion {
                    errorForAlert = ErrorForAlert(message: "Details \(error.localizedDescription)")
                }
            } receiveValue: { [unowned self] catFact in
                dataToView = catFact
            }
            .store(in: &cancellables)

    }
}

//
//  TryContainsWhereViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import Foundation

class TryContainsWhereViewModel: ObservableObject {
    @Published var place = "Neveda"
    @Published var result = ""
    @Published var invalidSelectionError: InvalidSelectionError?
    
    func search() {
        let incomingData = ["Places with Salt Water", "Utah", "California"]
        
        _ = incomingData.publisher
            .dropFirst()
            .tryContains(where: { [unowned self] item -> Bool in
                if place == "Mars" {
                    throw InvalidSelectionError()
                }
                return item == place
            })
            .sink(receiveCompletion: { [unowned self] completion in
                switch completion {
                case .failure(let error):
                    self.invalidSelectionError = error as? InvalidSelectionError
                default:
                    break
                }
            }, receiveValue: { [unowned self] response in
                self.result = response ? "Found" : "Not Found"
            })
    }
}

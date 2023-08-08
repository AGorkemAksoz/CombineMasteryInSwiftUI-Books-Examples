//
//  Future_RunMultipleTimesViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 8.08.2023.
//

import Combine
import Foundation

class Future_RunMultipleTimesViewModel: ObservableObject {
    @Published var firstResult = ""
    @Published var secondResult = ""
    
    let futurePublisher = Deferred {
        Future<String, Never> { promise in
            promise(.success("Future Publisher has run! 🙌🏻"))
            print("Future Publisher has run! 🙌🏻")
        }
    }
    
    func fetch() {
        futurePublisher
            .assign(to: &$firstResult)
    }
    
    func runAgain() {
        futurePublisher
            .assign(to: &$secondResult)
    }
}

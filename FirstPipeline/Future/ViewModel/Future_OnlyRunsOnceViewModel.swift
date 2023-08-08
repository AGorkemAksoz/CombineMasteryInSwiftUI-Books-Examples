//
//  Future_OnlyRunsOnceViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 8.08.2023.
//

import Combine
import Foundation

class Future_OnlyRunsOnceViewModel: ObservableObject {
    @Published var firstResult = ""
    @Published var secondResult = ""
    
    let futurePublisher = Future<String, Never> { promise in
        promise(.success("Futuere Publisher has run! 🙌🏻"))
        print("Future Publisher has run! 🙌🏻")
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

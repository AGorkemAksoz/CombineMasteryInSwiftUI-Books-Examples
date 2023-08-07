//
//  FutureViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import Combine
import Foundation


class FutureViewModel: ObservableObject {
    @Published var hello = ""
    @Published var goodbye = ""
    
    var goodbyeCancellable: AnyCancellable?
    
    func sayHello() {
        Future<String, Never> { promise in
            promise(Result.success("Hello, World!"))
        }
        .assign(to: &$hello)
    }
    
    func sayGoodbye() {
        
        let futurePublisher = Future<String, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                promise(.success("Goodby, my friend 👋🏻"))
            }
        }
        
        goodbyeCancellable = futurePublisher
            .sink(receiveValue: { [unowned self] message in
                self.goodbye = message
            })
    }
}

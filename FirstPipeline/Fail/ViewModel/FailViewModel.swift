//
//  FailViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import Foundation


class FailViewModel: ObservableObject {
    @Published var age = 0
    @Published var error: InvalidAgeError?
    
    func save(for age: Int) {
        _ = Validators.validAgePublisher(age: age)
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { [unowned self] age in
                self.age = age
            })
    }
}

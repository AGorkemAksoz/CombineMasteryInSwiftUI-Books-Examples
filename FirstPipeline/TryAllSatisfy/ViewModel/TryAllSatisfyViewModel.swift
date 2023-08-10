//
//  TryAllSatisfyViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 10.08.2023.
//

import Foundation


class TryAllSatisfyViewModel: ObservableObject {
    @Published var numbers: [Int] = []
    @Published var allFibonacciNumbers = false
    @Published var invalidNumberError: InvalidNumberError?
    
    func allFibonacciCheck()  {
        let fibonacciNumbersTo144 = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
        
        _ = numbers.publisher
            .tryAllSatisfy({ number in
                if number > 144 { throw InvalidNumberError()}
                return fibonacciNumbersTo144.contains(number)
            })
            .sink(receiveCompletion: { [unowned self] completion in
                switch completion {
                case .failure(let error):
                    self.invalidNumberError = error as? InvalidNumberError
                default:
                    break
                }
            }, receiveValue: { [unowned self] response in
                allFibonacciNumbers = response
            })
    }
    
    func add(to number: String) {
        if number.isEmpty { return }
        numbers.append(Int(number) ?? 0)
    }
}

//
//  AllSatisfyViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 10.08.2023.
//

import Foundation


class AllSatisfyViewModel: ObservableObject {
    @Published var numbers: [Int] = []
    @Published var allFibonacciNumbers = false
    
    func allFibonacciCheck() {
        let fibonacciNumbersTo144 = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
        
        numbers.publisher
            .allSatisfy { number in
                fibonacciNumbersTo144.contains(number)
            }
            .assign(to: &$allFibonacciNumbers)
    }
    
    func add(number: String) {
        if number.isEmpty { return }
        numbers.append(Int(number) ?? 0)
    }
}

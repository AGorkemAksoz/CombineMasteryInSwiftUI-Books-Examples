//
//  InvalidAgeError.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import Foundation

enum InvalidAgeError: String, Error, Identifiable {
    var id: UUID {
        get {
        return UUID()
    }
        set {
            
        }
    }
    
    
case lessThanZero
case moreThanOneHundred
}

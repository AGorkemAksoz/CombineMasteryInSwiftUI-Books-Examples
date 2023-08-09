//
//  ErrorForAlert.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import Foundation

struct ErrorForAlert: Error, Identifiable {
    let id = UUID()
    let title = "Error"
    var message = "Please try again later."
}

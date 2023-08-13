//
//  InvalidCountryError.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 13.08.2023.
//

import Foundation

struct InvalidCountryError: Error, Identifiable {
    var id = UUID()
    var country = ""
}

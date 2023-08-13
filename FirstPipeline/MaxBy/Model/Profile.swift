//
//  Profile.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 13.08.2023.
//

import Foundation

struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let city: String
}

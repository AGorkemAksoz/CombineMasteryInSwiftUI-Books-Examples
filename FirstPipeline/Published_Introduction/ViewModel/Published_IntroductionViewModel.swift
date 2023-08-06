//
//  Published_IntroductionViewModel.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 1.08.2023.
//

import Foundation
import SwiftUI

class Published_IntroductionViewModel: ObservableObject {
    var characterLimit = 30
    @Published var data = ""
    @Published var characterCount = 0
    @Published var countColor = Color.gray
    
    init() {
        $data
            .map { data -> Int in
                return data.count
            }
            .assign(to: &$characterCount)
        
        $characterCount
            .map { [unowned self] count -> Color in
                let eightyPercent = Int(Double(characterLimit) * 0.8)
                if (eightyPercent...characterLimit).contains(count) {
                    return Color.yellow
                } else if count > characterLimit {
                    return Color.red
                }
                return Color.gray
            }
            .assign(to: &$countColor)
    }
}

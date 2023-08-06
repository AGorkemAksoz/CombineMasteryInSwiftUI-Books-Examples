//
//  DescView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 29.07.2023.
//

import SwiftUI

struct DescView: View {
    var desc: String = "Use this to..."
    
    init(_ desc: String) {
        self.desc = desc
    }
    
    var body: some View {
        Text(desc)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.yellow)
            .foregroundColor(.white)
    }
}

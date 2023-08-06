//
//  HeaderView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 29.07.2023.
//

import SwiftUI

struct HeaderView: View {
    
    var title = "Title"
    var subtitle = "Subtitle"
    var desc = "Use this to..."
    
    init(_ title: String, subtitle: String, desc: String) {     self.title = title
        self.subtitle = subtitle
        self.desc = desc
    }
    
    var body: some View {
        VStack(spacing: 15) {
            if !title.isEmpty {
                Text(title)
                    .font(.largeTitle)
            }
            
            Text(subtitle)
                .foregroundColor(.gray)
        }
        
        DescView(desc)
    }
}

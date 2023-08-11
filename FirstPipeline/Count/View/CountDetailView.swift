//
//  CountDetailView.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import SwiftUI

struct CountDetailView: View {
    var data: [String]
    
    var body: some View {
        List(data, id: \.self){ datum in
            Text(datum)
        }
        .font(.title)
    }
}

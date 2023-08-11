//
//  ContainsWhereView.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import SwiftUI

struct ContainsWhereView: View {
    @StateObject private var vm = ContainsWhereViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Contains",
                       subtitle: "Where",
                       desc: "The contains(where:) operator will publish a true and finish the pipeline when an item coming through matches the criteria you specify within the closure it provides.")
            
            Group {
                Text(vm.fruitName)
                Toggle("Vitamin A", isOn: $vm.vitaminA)
                Toggle("Vitamin B", isOn: $vm.vitaminB)
                Toggle("Vitamin C", isOn: $vm.vitaminC)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct ContainsWhereView_Previews: PreviewProvider {
    static var previews: some View {
        ContainsWhereView()
    }
}

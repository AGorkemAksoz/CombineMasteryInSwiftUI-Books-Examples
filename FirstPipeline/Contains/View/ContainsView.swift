//
//  ContainsView.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import SwiftUI

struct ContainsView: View {
    @StateObject private var vm = ContainsViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Contains",
                       subtitle: "Introduction",
                       desc: "The contains operator will publish a true and finish the pipeline when an item coming through matches its criteria.")
            
            Text("House Details")
                .fontWeight(.bold)
            
            Group {
                Text(vm.description)
                Toggle("Basement", isOn: $vm.basement)
                Toggle("Air Conditioning", isOn: $vm.airConditioning)
                Toggle("Heating", isOn: $vm.heating)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct ContainsView_Previews: PreviewProvider {
    static var previews: some View {
        ContainsView()
    }
}

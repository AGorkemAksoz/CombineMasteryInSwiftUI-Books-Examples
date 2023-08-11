//
//  MaxView.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import SwiftUI

struct MaxView: View {
    @StateObject private var vm = MaxViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Max",
                       subtitle: "Introduction",
                       desc: "The max operator will publish the maximum value once the upstream publisher is finished.")
            .layoutPriority(1)
            
            List {
                Section(footer: Text("Max: \(vm.maxValue)").bold()) {
                    ForEach(vm.data, id: \.self) { datum in
                        Text(datum)
                    }
                }
            }
            
            List {
                Section(footer: Text("Max: \(vm.maxNumber)").bold()) {
                    ForEach(vm.numbers, id: \.self) { number in
                        Text("\(number)")
                    }
                }
            }
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct MaxView_Previews: PreviewProvider {
    static var previews: some View {
        MaxView()
    }
}

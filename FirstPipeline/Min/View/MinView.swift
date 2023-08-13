//
//  MinView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 13.08.2023.
//

import SwiftUI

struct MinView: View {
    @StateObject private var vm = MinViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Min",
                       subtitle: "Introduction",
                       desc: "The min() operator will publish the minimum value once the upstream publisher is finished.")
            .layoutPriority(1)
            
            List {
                Section(footer: Text("Min: \(vm.minData)").bold()) {
                    ForEach(vm.data, id: \.self) { datum in
                        Text(datum)
                    }
                }
            }
            
            List {
                Section(footer: Text("Min: \(vm.minNumber)").bold()) {
                    ForEach(vm.numbers, id: \.self) { datum in
                        Text("\(datum)")
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

struct MinView_Previews: PreviewProvider {
    static var previews: some View {
        MinView()
    }
}

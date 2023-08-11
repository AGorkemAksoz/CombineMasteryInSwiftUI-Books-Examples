//
//  CountView.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import SwiftUI

struct CountView: View {
    @StateObject private var vm = CountViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("Count",
                           subtitle: "Intoduction",
                           desc: "The count operator simply publishes the total number of items it receives from the upstream publisher.")
                
                Form {
                    NavigationLink {
                        CountDetailView(data: vm.data)
                    } label: {
                        Text(vm.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(vm.count)")
                    }
                }
            }
            .font(.title)
            .navigationTitle("Count")
            .onAppear {
                vm.fetch()
            }
        }
    }
}

struct CountView_Previews: PreviewProvider {
    static var previews: some View {
        CountView()
    }
}

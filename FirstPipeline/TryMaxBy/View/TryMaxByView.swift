//
//  TryMaxByView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 13.08.2023.
//

import SwiftUI

struct TryMaxByView: View {
    @StateObject private var vm = TryMaxByViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("tryMax(by: )",
                       subtitle: "Introduction",
                       desc: "The tryMax(by: ) operator provides a closure so you can specify your own logic to determine which item's the maximum or throw an error")
            
            List(vm.profiles, id: \.id) { profile in
                HStack{
                    Text(profile.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(profile.country)
                        .lineLimit(0)
                        .foregroundColor(.secondary)
                }
            }
            
            Text("Max Value: \(vm.maxValue)")
                .bold()
        }
        .font(.title)
        .alert(item: $vm.invalidCounryError) { alertData in
            Alert(title: Text("Invalid Country"), message: Text(alertData.country))
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct TryMaxByView_Previews: PreviewProvider {
    static var previews: some View {
        TryMaxByView()
    }
}

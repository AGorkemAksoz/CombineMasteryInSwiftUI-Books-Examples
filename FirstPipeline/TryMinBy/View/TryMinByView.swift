//
//  TryMinByView.swift
//  FirstPipeline
//
//  Created by Gorkem on 14.08.2023.
//

import SwiftUI

struct TryMinByView: View {
    @StateObject private var vm = TryMinByViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("tryMin(by: )",
                       subtitle: "Introduction",
                       desc: "The tryMin(by: ) operator provides a closure so you can specify your own login to determine which item is the minimum or throw an error.")
            
            List(vm.profiles) { profile in
                HStack {
                    Text(profile.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(profile.country)
                        .foregroundColor(.secondary)
                }
            }
            
            Text("Min Country: \(vm.minValue)")
                .bold()
        }
        .font(.title)
        .alert(item: $vm.invalidCountryError) { alertData in
            Alert(title: Text("Invalid Country"), message: Text(alertData.country))
        }
        .onAppear {
            vm.fetch()
        }
    }
}

struct TryMinByView_Previews: PreviewProvider {
    static var previews: some View {
        TryMinByView()
    }
}

//
//  TryContainsWhereView.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import SwiftUI

struct TryContainsWhereView: View {
    @StateObject private var vm = TryContainsWhereViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("TryContains",
                       subtitle: "Introduction",
                       desc: "The tryContains(where: ) operator works like contains(where: ) except now the subscriber can also receive an error in addition to a true or false.")
            
            Text("Look for Salt Water in:")
            Picker("Place", selection: $vm.place) {
                Text("Neveda").tag("Neveda")
                Text("Utah").tag("Utah")
                Text("Mars").tag("Mars")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button("Search") {
                vm.search()
            }
            
            Text("Result: \(vm.result)")
        }
        .font(.title)
        .alert(item: $vm.invalidSelectionError) { alertData in
            Alert(title: Text("Invalid Selection"))
        }
    }
}

struct TryContainsWhereView_Previews: PreviewProvider {
    static var previews: some View {
        TryContainsWhereView()
    }
}

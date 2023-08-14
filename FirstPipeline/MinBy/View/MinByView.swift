//
//  MinByView.swift
//  FirstPipeline
//
//  Created by Gorkem on 14.08.2023.
//

import SwiftUI

struct MinByView: View {
    @StateObject private var vm = MinByViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Min(by: )",
                       subtitle: "Introduction",
                       desc: "The min(by: ) operator provides a closure so you can specify your own logic to determine which itme is the minimum.")
            
            List(vm.profiles) { profile in
                HStack {
                    Text(profile.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(profile.city)
                        .foregroundColor(.secondary)
                }
            }
            
            Text("Min City: \(vm.minValue)")
                .bold()
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct MinByView_Previews: PreviewProvider {
    static var previews: some View {
        MinByView()
    }
}

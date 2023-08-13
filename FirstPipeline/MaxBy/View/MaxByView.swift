//
//  MaxByView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 13.08.2023.
//

import SwiftUI

struct MaxByView: View {
    @StateObject private var vm = MaxByViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Max(by:)",
                       subtitle: "Introduction",
                       desc: "The max(by:) operator provides a closure so you can specify your own logic to determine which item is the max")
            List(vm.profiles, id: \.id) { profile in
                HStack {
                    Text(profile.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(profile.city)
                        .foregroundColor(.secondary)
                }
            }
            
            Text("Max City: \(vm.maxValue)")
                .bold()
            
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct MaxByView_Previews: PreviewProvider {
    static var previews: some View {
        MaxByView()
    }
}

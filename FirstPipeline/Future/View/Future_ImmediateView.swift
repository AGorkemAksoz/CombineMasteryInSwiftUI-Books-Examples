//
//  Future_ImmediateView.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import SwiftUI

struct Future_ImmediateView: View {
    @StateObject private var vm = Future_ImmediateViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Future",
                       subtitle: "Immediate Execution",
                       desc: "Future publishers execute immediately, whether they have a subscriber or not. This is different from all other publishers.")
            
            Text(vm.data)
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct Future_ImmediateView_Previews: PreviewProvider {
    static var previews: some View {
        Future_ImmediateView()
    }
}

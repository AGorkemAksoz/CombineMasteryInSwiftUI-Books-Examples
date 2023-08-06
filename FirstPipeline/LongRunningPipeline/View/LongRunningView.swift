//
//  LongRunningView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 31.07.2023.
//

import SwiftUI

struct LongRunningView: View {
    @StateObject private var vm = LongRunningViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Cancellable Pipeline",
                       subtitle: "Long-Running Process",
                       desc: "In this example we pretend we have a long-runnnig process that we can cancel before it finishes.")
            
            Text(vm.data)
            
            Button("Refresh Data") {
                vm.refreshData()
            }
            
            Button("Cancel Subscription") {
                vm.cancel()
            }
            .opacity(vm.status == "Processing..." ? 1 : 0)
            
            Text(vm.status)
        }
        .font(.title)
    }
}

struct LongRunningView_Previews: PreviewProvider {
    static var previews: some View {
        LongRunningView()
    }
}

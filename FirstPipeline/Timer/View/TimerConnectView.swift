//
//  TimerConnectView.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import SwiftUI

struct TimerConnectView: View {
    @StateObject private var vm = TimerConnectViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Timer",
                       subtitle: "Connect",
                       desc: "Instead of using autoconnect, you can manually connect the Timer publisher which is like turnign on the flow of water.")
            HStack {
                Button("Connect") {
                    vm.start()
                }
                .frame(maxWidth: .infinity)
                
                Button("Stop") {
                    vm.stop()
                }
                .frame(maxWidth: .infinity)
            }
            
            List(vm.data, id: \.self) { datum in
                Text(datum)
                    .font(.system(.title, design: .monospaced))
            }
        }
        .font(.title)
    }
}

struct TimerConnectView_Previews: PreviewProvider {
    static var previews: some View {
        TimerConnectView()
    }
}

//
//  TimerView.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var vm = TimerViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Timer",
                       subtitle: "Introduction",
                       desc: "The Timer continually publishes the updated date and time at an interval you specify.")
            Text("Adjust Interval")
            Slider(value: $vm.interval, in: 0.1...1) {
                Text("Interval")
            } minimumValueLabel: {
                Image(systemName: "hare")
            } maximumValueLabel: {
                Image(systemName: "tortoise")
            }
            .padding()
            
            List(vm.data, id: \.self){ datum in
                Text(datum)
                    .font(.system(.title, design: .monospaced))
            }
        }
        .font(.title)
        .onAppear {
            vm.start()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

//
//  SequnceView.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import SwiftUI

struct SequnceView: View {
    @StateObject private var vm = SequenceViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Sequnce",
                       subtitle: "Introduction",
                       desc: "Arrays have a built-in sequnce publisher property. This means a pipeline can be constructed right on the array.")
            
            List(vm.dataToView, id: \.self) { datum in
                Text(datum)
            }
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct SequnceView_Previews: PreviewProvider {
    static var previews: some View {
        SequnceView()
    }
}

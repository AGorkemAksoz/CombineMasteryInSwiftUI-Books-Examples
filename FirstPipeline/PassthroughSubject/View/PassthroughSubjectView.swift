//
//  PassthroughSubjectView.swift
//  FirstPipeline
//
//  Created by Gorkem on 8.08.2023.
//

import SwiftUI

struct PassthroughSubjectView: View {
    @StateObject private var vm = PassthroughSubjectViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("PassthroughSubject",
                       subtitle: "Introduction",
                       desc: "The PassthroughSubject publisher will send a balue through a pipeline but not retain but not retain the value")
            
            HStack {
                TextField("Credit Card Number", text: $vm.creditCard)
                Group {
                    switch vm.status {
                    case .ok:
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    case .invalid:
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding()
            
            Button("Verify CC Number") {
                vm.verifyCreditCard.send(vm.creditCard)
            }
        }
        .font(.title)
    }
}

struct PassthroughSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        PassthroughSubjectView()
    }
}

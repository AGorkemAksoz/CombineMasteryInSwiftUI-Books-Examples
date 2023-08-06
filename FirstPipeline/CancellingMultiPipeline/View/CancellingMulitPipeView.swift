//
//  CancellingMulitPipeView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 31.07.2023.
//

import SwiftUI

struct CancellingMulitPipeView: View {
    @StateObject private var vm = CancellingMulitPipeViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Cancel All Pipelines",
                       subtitle: "Remove All",
                       desc: "You learn earlier that you can cancel one pipeline by calling the cancel() function of the AnyCancellable. When everything is in a Set, an easy way to cancel all pipeline to simply remove all of them from the Set")
            
            Group {
                HStack {
                    TextField("First Name", text: $vm.firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text(vm.firstNameValidation)
                }
                
                HStack {
                    TextField("Last Name", text: $vm.lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text(vm.lastNameValidation)
                }
            }
            .padding()
            
            Button("Cancel All Validation") {
                vm.cancelAllValidations()
            }
        }
    }
}

struct CancellingMulitPipeView_Previews: PreviewProvider {
    static var previews: some View {
        CancellingMulitPipeView()
    }
}

//
//  FailView.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import SwiftUI

struct FailView: View {
    @StateObject private var vm = FailViewModel()
    @State private var age = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Fail",
                       subtitle: "Introduction",
                       desc: "The Fail publisher will simply publish a failure with your error and close the pipeline.")
            
            TextField("Enter the age", text: $age)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                vm.save(for: Int(age) ?? -1)
            }
            
            Text("\(vm.age)")
        }
        .font(.title)
        .alert(item: $vm.error) { error in
            Alert(title: Text("Invalid Age"), message: Text(error.rawValue))
            
        }
    }
}

struct FailView_Previews: PreviewProvider {
    static var previews: some View {
        FailView()
    }
}

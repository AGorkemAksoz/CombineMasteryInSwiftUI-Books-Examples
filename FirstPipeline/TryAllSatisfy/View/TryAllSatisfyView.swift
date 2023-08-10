//
//  TryAllSatisfyView.swift
//  FirstPipeline
//
//  Created by Gorkem on 10.08.2023.
//

import SwiftUI

struct TryAllSatisfyView: View {
    @State private var number = ""
    @State private var resultVisible = false
    @StateObject private var vm = TryAllSatisfyViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("TryAllSatisfy",
                       subtitle: "Introduction",
                       desc: "The tryAllSatisfy operator works like allSatisfy except now the subscriber can also receive an error in addition to a true or false")
            .layoutPriority(1)
            
            HStack {
                TextField("Add a Number < 145", text: $number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                Button {
                    vm.add(to: number)
                    number = ""
                } label: {
                    Image(systemName: "plus")
                }
            }
            .padding()
            
            List(vm.numbers, id: \.self) { number in
                Text("\(number)")
            }
            Spacer()
            Button("Fibonacci Numbers") {
                vm.allFibonacciCheck()
                resultVisible = true
            }
            Text(vm.allFibonacciNumbers ? "Yes" : "No")
                .opacity(resultVisible ? 1 : 0)
        }
        .padding(.bottom)
        .font(.title)
        .alert(item: $vm.invalidNumberError) { error in
            Alert(title: Text("A Number is greater than 144"),
                  primaryButton: .default(Text("Start Over"), action: {
                vm.numbers.removeAll()
            })
                  ,secondaryButton: .cancel())
        }
    }
}

struct TryAllSatisfyView_Previews: PreviewProvider {
    static var previews: some View {
        TryAllSatisfyView()
    }
}

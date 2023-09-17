//
//  ContentView.swift
//  TheSplitter
//
//  Created by Aditya Kumar on 9/17/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var billAmount: Double = 0.0
    @State private var tipPercentage: Double = 0.0
    @State private var numberOfMembers: Double = 1.0
    @State private var totalAmount: Double = 0.0 // Store the calculated total amount here

    var body: some View {
        Spacer()
        VStack {
            Spacer()
          
            Text("The Bill Splitter")
                .font(.system(size: 30))
                .bold()
                .padding(25)
                .padding(EdgeInsets(top: 55, leading: 0, bottom: 0, trailing: 0))
            
            VStack {
                Text("Bill Amount")
                    .font(.headline)
                TextField("Enter Amount", value: $billAmount, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(20)
                Slider(value: $billAmount, in: 0...10000, step: 1) {
                    Text("Bill Amount: \(billAmount, specifier: "%.2f")")
                }
                .frame(height: 20)
                .padding(20)
                .onChange(of: billAmount) { newValue in
                    provideHapticFeedback()
                }
            }

            VStack {
                Text("Tip Percentage")
                    .font(.headline)
                TextField("Enter Percentage", value: $tipPercentage, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(20)
                Slider(value: $tipPercentage, in: 0...100, step: 1) {
                    Text("Tip Percentage: \(tipPercentage, specifier: "%.2f")%")
                }
                .frame(height: 20)
                .padding(20)
                .onChange(of: tipPercentage) { newValue in
                    provideHapticFeedback()
                }
            }

            VStack {
                Text("Number of Members")
                    .font(.headline)
                TextField("Enter Members", value: $numberOfMembers, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(20)
                Slider(value: $numberOfMembers, in: 1...10, step: 1) {
                    Text("Number of Members: \(numberOfMembers, specifier: "%.0f")")
                }
                .frame(height: 20)
                .padding(20)
                .onChange(of: numberOfMembers) { newValue in
                    provideHapticFeedback()
                }
            }

            Spacer()

            Button("Calculate") {
                totalAmount = BillCalculator.calculateTotalBill(
                    billAmount: billAmount,
                    tipPercentage: tipPercentage,
                    numberOfMembers: Int(numberOfMembers)
                )
            }
            .padding()

            Text("Total: \(totalAmount, specifier: "%.2f")")
                .font(.headline)
                .padding()
                .padding(EdgeInsets(top:0 , leading:0 , bottom:50 , trailing:0 ))
        }
        .padding(.bottom, 25)
        .frame(maxHeight: 100)
        
        Spacer()
    }
        
    func provideHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}



#Preview {
    ContentView()
}

//
//  BillCalculator.swift
//  TheSplitter
//
//  Created by Aditya Kumar on 9/17/23.
//

import Foundation

struct BillCalculator {
    static func calculateTotalBill(billAmount: Double, tipPercentage: Double, numberOfMembers: Int) -> Double {
        let tipAmount = billAmount * (tipPercentage / 100)
        let totalBill = billAmount + tipAmount
        let amountPerMember = totalBill / Double(numberOfMembers)
        return amountPerMember
    }
}

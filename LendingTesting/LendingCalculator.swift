//
//  LendingCalculator.swift
//  LendingTesting
//
//  Created by Darren Thiores on 23/06/25.
//

import Foundation

struct LendingCalculator {
    static let shared = LendingCalculator()
    
    private init() { }
    
    func calculateTotalRepayment(
        _ totalTransaction: Double,
        tenure: Tenure
    ) -> Double {
        let monthly = totalTransaction / Double(tenure.rawValue)
        let totalMonthly = monthly + (monthly * 0.05)
        
        return totalMonthly * Double(tenure.rawValue)
    }
}

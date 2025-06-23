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
    
    /**
     Requirement: Monthly repayment should be principal split by tenure number, and added with 5% interest of principal, every month.
     */
    func calculateTotalRepayment(
        _ principal: Double,
        tenure: Tenure
    ) -> Double {
        let monthly = principal / Double(tenure.rawValue)
        let totalMonthly = monthly + (monthly * 0.05)
        
        return totalMonthly * Double(tenure.rawValue)
    }
    
    /**
     Requirement: Late fee should be 5k rupiah / day
     */
    func calculateLateFee(_ days: Int) -> Double? {
        guard days > 0 else {
            return nil
        }
        
        return 5_000 * Double(days)
    }
    
    /**
     Requirement: If total repayment pass the limit of 50k rupiah, user will be charged with fee
     */
    func shouldChargeFee(
        _ principal: Double,
        tenure: Tenure
    ) -> Bool {
        let totalRepayment = calculateTotalRepayment(principal, tenure: tenure)
        
        return totalRepayment > 50_000
    }
}

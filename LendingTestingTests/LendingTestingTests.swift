//
//  LendingTestingTests.swift
//  LendingTestingTests
//
//  Created by Darren Thiores on 23/06/25.
//

import Testing
@testable import LendingTesting

struct LendingTestingTests {

    @Test("One month tenure test: 50.000")
    func oneMonthTenure() {
        let expected: Double = 52500
        
        let transaction: Double = 50000
        let calculation = LendingCalculator.shared.calculateTotalRepayment(
            transaction,
            tenure: .ONE
        )
        
        #expect(calculation == expected)
    }
    
    @Test("Calculate late fee for 3 days late")
    func testLateFeeCalculation() throws {
        let lateFee = try #require(LendingCalculator.shared.calculateLateFee(3))
        #expect(lateFee == 15_000)
    }

    @Test("All tenure test: 50.000", arguments: [
        (50000, Tenure.ONE, 52500),
        (50000, Tenure.TWO, 55000),
        (63000, Tenure.THREE, 72450),
    ])
    func testRepaymentCalculation(
        arguments: (totalTransaction: Double, tenure: Tenure, expectation: Double)
    ) {
        let calculation = LendingCalculator.shared.calculateTotalRepayment(
            arguments.totalTransaction,
            tenure: arguments.tenure
        )
        
        #expect(calculation == arguments.expectation)
    }
}

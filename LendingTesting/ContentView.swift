//
//  ContentView.swift
//  LendingTesting
//
//  Created by Darren Thiores on 23/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var totalRepayment: Double? = nil
    @State private var selectedTenure: Tenure = .ONE
    @State private var totalTransaction: Double = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                if let repayment = totalRepayment {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(
                            "Total Repayment: \(repayment.formatted(.currency(code: "IDR")))"
                        )
                        
                        Button("Reset") {
                            totalRepayment = nil
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                    
                    Spacer()
                }
                else {
                    Form {
                        Picker("Tenure", selection: $selectedTenure) {
                            ForEach(Tenure.allCases) { tenure in
                                Text(
                                    String(tenure.rawValue)
                                )
                            }
                        }
                        .listRowSeparator(.hidden)
                        
                        TextField(
                            "Total Transaction",
                            value: $totalTransaction,
                            format: .currency(code: "IDR")
                        )
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .listRowSeparator(.hidden)
                        
                        Button("Calculate") {
                            totalRepayment = LendingCalculator.shared.calculateTotalRepayment(
                                totalTransaction,
                                tenure: .ONE
                            )
                        }
                        .disabled(totalTransaction == 0)
                    }
                }
            }
            .navigationTitle("Loan Calculator")
        }
    }
}

#Preview {
    ContentView()
}

//
//  Tenure.swift
//  LendingTesting
//
//  Created by Darren Thiores on 23/06/25.
//

import Foundation

enum Tenure: Int, CaseIterable, Identifiable {
    case ONE = 1
    case TWO
    case THREE
    
    var id: Self { self }
}

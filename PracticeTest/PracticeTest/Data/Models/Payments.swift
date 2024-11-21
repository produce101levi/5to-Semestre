//
//  Payments.swift
//  PracticeTest
//
//  Created by Leví Diaz on 21/11/24.
//

import Foundation

struct Payments: Identifiable {
    var id: UUID
    var concept: String
    var amount: Int
    var isExpense: Bool
}

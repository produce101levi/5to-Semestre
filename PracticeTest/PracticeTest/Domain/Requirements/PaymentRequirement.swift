//
//  File.swift
//  PracticeTest
//
//  Created by Leví Diaz on 21/11/24.
//

import Foundation

protocol PaymentRequirementProtocol {
    func fetchPayments() async throws -> (expenses: [Payments], income: [Payments], allPayments: [Payments])
}

class PaymentRequirement: PaymentRequirementProtocol {
    
    let repository: PaymentRepository
    
    static let shared = PaymentRequirement()
    
    init(repository: PaymentRepository = PaymentRepository.shared){
        self.repository = repository
    }
    
    
    func fetchPayments() async throws -> (expenses: [Payments], income: [Payments], allPayments: [Payments]) {
        // print("requirement: \(try await repository.fetchPayments())")
        let allPayments = try await repository.fetchPayments()
        let expenses = allPayments.filter({ $0.isExpense })
        let income = allPayments.filter({ !$0.isExpense })
        return (expenses, income, allPayments)
    }
}

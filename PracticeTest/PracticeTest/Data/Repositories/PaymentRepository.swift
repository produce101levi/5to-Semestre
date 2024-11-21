//
//  PaymentRepository.swift
//  PracticeTest
//
//  Created by Leví Diaz on 21/11/24.
//

import Foundation

protocol PaymentRepositoryProtocol {
    func fetchPayments() async throws -> [Payments]
}

class PaymentRepository: PaymentRepositoryProtocol {
    var parse: ParseService
    
    static let shared = PaymentRepository()
    
    init(parse: ParseService = ParseService.shared) {
        self.parse = parse
    }
    
    func fetchPayments() async throws -> [Payments] {
        // print("Repository: \(try await parse.fetchPayments())")
        return try await parse.fetchPayments()
    }
    
}

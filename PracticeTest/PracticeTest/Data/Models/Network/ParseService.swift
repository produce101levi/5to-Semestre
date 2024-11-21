//
//  ParseService.swift
//  PracticeTest
//
//  Created by Leví Diaz on 21/11/24.
//

import Foundation
import ParseCore

class ParseService {
    static let shared = ParseService()
    func fetchPayments() async throws -> [Payments]{
        return try await withCheckedThrowingContinuation { continuation in
            PFCloud.callFunction(inBackground: "consultarPagos", withParameters: [:]){ (response, error) in
                // print("Response: \(String(describing: response))")
                if let error = error {
                    print("Parse Error: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                } else if let response = response as? [String: Any]{
                    if let paymentsArray = response["pagos"] as? [[String: Any]]{
                        
                        let payments = paymentsArray.compactMap { dict -> Payments? in
                        guard let concept = dict["concepto"] as? String,
                                let amount = dict["cantidad"] as? Int,
                              let isExpense = dict["isGasto"] as? Bool else {
                            print("Failed to retrieve dict \(dict)")
                            return nil
                        }
                        return Payments(id: UUID(), concept: concept, amount: amount, isExpense: isExpense)
                        }
                        continuation.resume(returning: payments)
                    }
                }
            }
        }
        
    }
}

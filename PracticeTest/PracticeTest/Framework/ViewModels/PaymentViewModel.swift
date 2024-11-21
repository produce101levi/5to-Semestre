//
//  PaymentViewModel.swift
//  PracticeTest
//
//  Created by Leví Diaz on 21/11/24.
//

import Foundation

class PaymentViewModel: ObservableObject {
    static let shared = PaymentViewModel()
    
    let requirement: PaymentRequirement
    var expenses: [Payments] = []
    var income: [Payments] = []
    var allPayments: [Payments] = []
    @Published var mode = "all"
    
    init(requirement: PaymentRequirement = PaymentRequirement.shared){
        self.requirement = requirement
    }
    
    func fetchPayments() async {
        do {
            let (expenses, income, allPayments) = try await requirement.fetchPayments()
            DispatchQueue.main.async {
                self.expenses = expenses
                // print("ViewModel expenses: \(self.expenses)")
                self.income = income
                // print("ViewModel expenses: \(self.expenses)")
                self.allPayments = allPayments
                // print("ViewModel expenses: \(self.expenses)")
            }
            // print("VieModel: \(payments)")
        } catch {
            print("Error in ViewModel")
        }
        
    }
}


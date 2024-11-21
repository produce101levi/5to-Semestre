//
//  ContentView.swift
//  PracticeTest
//
//  Created by Leví Diaz on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var paymentList: [Payments] = []
    @StateObject var viewModel: PaymentViewModel
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    viewModel.mode = "all"
                    // print(viewModel.allPayments)
                } label: {
                    Image(systemName: "wallet.pass")
                }
                Button {
                    viewModel.mode = "expenses"
                    // print(viewModel.expenses)
                } label: {
                    Image(systemName: "chart.line.downtrend.xyaxis.circle")
                }
                
                Button {
                    viewModel.mode = "income"
                    // print(viewModel.income)
                } label: {
                    Image(systemName: "chart.line.uptrend.xyaxis.circle")
                }
            }
            List(listData, id: \.id){ payment in
                HStack {
                    Text(payment.concept)
                    Spacer()
                    Text("\(payment.amount)")
                }
                
            }
        }.task {
            await viewModel.fetchPayments()
            
        }
        
        
    }
    private var listData: [Payments] {
        switch viewModel.mode {
        case "expenses":
            return viewModel.expenses
        case "income":
            return viewModel.income
        default:
            return viewModel.allPayments
        }
        
    }
}

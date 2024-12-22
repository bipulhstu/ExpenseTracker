//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Bipul Islam on 22/12/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
                //Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                //Header Link
                NavigationLink {
                    
                } label: {
                    HStack{
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color.Text)
                }
            }
            .padding(.top)
            
            //Recent Transactions
            ForEach(transactionListVM.transactions.prefix(6)) { transaction in
                TransactionRow(transaction: transaction)
                Divider()
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    RecentTransactionList()
        .environmentObject(transactionListVM)
}

//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Bipul Islam on 22/12/24.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    var body: some View {
        HStack (spacing: 20) {
            //Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.Icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay{
                    Image(systemName: "text.rectangle.page").foregroundColor(Color.Icon)
                }

            VStack (alignment: .leading, spacing: 6) {
               //Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
            
                //Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                
                //Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
            
            Spacer()
            
            //Transaction Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.Text : .primary)
           
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}

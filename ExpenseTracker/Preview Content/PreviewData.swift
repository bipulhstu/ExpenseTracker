//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Bipul Islam on 22/12/24.
//
import Foundation

var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.40, type: "debit", categoryId: 801, category: "Software", isPending: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction] (repeating: transactionPreviewData, count: 10)

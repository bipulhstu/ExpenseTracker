//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Bipul Islam on 22/12/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}

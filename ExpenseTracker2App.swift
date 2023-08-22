//
//  ExpenseTracker2App.swift
//  ExpenseTracker2
//
//  Created by Kaushik Medamanuri on 8/9/23.
//

import SwiftUI

@main
struct ExpenseTracker2App: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}

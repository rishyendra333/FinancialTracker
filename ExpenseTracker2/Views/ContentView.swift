//
//  ContentView.swift
//  ExpenseTracker2
//
//  Created by Kaushik Medamanuri on 8/9/23.
//

import SwiftUI
import SwiftUICharts
import RealmSwift

let realmApp = RealmSwift.App(id: "expensetracker-lcqyt")

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    //var demoData: [Double] = [-230.32,-994.72,8.02,102.62,530,930.36,900]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    NavigationLink(destination: addExpenseView()) {
                                            Text("Add expense")
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color.black)
                                                .cornerRadius(30)
                                        }
                    
                    // MARK: Chart
                    let data = transactionListVM.accumulateTransactions()
                    
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height:300)
                    }
                    
                
                // MARK: Transaction List
                RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.batch")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}

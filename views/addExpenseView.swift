//
//  addExpenseView.swift
//  ExpenseTracker2
//
//  Created by Kaushik Medamanuri on 8/21/23.
//

import SwiftUI

struct addExpenseView: View {
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var date: String = ""
    @State private var recepient: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {

            Text("Add a new expense")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)

            TextField("Recepient", text: $recepient)
                .textFieldStyle(.roundedBorder)

            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)

            TextField("Date", text: $date)
                .textFieldStyle(.roundedBorder)

            Button {
                print("Expense added")
            } label: {
                Text("Add expense")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    //.background(Color.systemBackground)
                    .background(.black)
                    .cornerRadius(30)
            }
        }
    }
}

struct addExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        addExpenseView()
    }
}

//
//  transactionDetailView.swift
//  budgetBrain
//
//  Created by Isaac D2 on 12/26/23.
//

import SwiftData
import SwiftUI

struct transactionDetailView: View {
    @Environment (\.modelContext) var modelContext
    @Bindable var transaction: Transaction
    
    @State private var editable = false
    
    var body: some View {
        List {
            Text(transaction.amount, format: .currency(code: "USD"))
            Text(transaction.date.formatted(date: .complete, time: .omitted))
            Text(transaction.bucket?.name ?? "Not assigned")
            
            Section("Notes") {
                TextField("Enter some notes about the transaction", text: $transaction.notes, axis: .vertical)
            }
        }
        .navigationTitle(transaction.name)
    }
}

#Preview {
    let preview = PreviewContainer([Transaction.self])
    
    return transactionDetailView(transaction: Transaction.dummy).modelContainer(preview.container)
}

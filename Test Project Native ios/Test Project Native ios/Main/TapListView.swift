//
//  TapListView.swift
//  Test Project Native ios
//
//  Created by John Nemesio Barro on 8/11/23.
//

import SwiftUI
import CoreData

struct TapListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var delete: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Button {
                        deleteAll()
                    } label: {
                        Text("Delete All")
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                
            }
            
            VStack {
                List {
                    ForEach(items) { item in
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(item.btn!)")
                                .font(Font.custom("", size: 22))
                            Text(item.timestamp!, formatter: itemFormatter)
                                .font(Font.custom("", size: 18))
                        }
                    }
                    .onDelete(perform: deleteItems)
                    .offset(x: 20)
                }
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteAll() {
        for item in items {
            viewContext.delete(item)
            saveViewContext()
        }
    }
    
    func saveViewContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolve error: \(error)")
        }
    }
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct TapListView_Previews: PreviewProvider {
    static var previews: some View {
        TapListView()
    }
}

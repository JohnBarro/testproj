//
//  ButtonView.swift
//  Test Project Native ios
//
//  Created by John Nemesio Barro on 8/11/23.
//

import Foundation
import SwiftUI
import CoreData

struct ButtonView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var tapBtn1: String = "Button 1 pressed"
    
    @State var tapBtn2: String = "Button 2 pressed"
    
    @State var tapBtn3: String = "Button 3 pressed"
    
    @State var tapBtn4: String = "Button 4 pressed"
    
    var body: some View {
        
        VStack {
            Button(action: {
                addItem(tapBtn: tapBtn1)
            }, label: {
                VStack {
                    Text("Button 1")
                        .foregroundColor(.black )
                        .font(Font.custom("", size: 25))
                }
                .frame(width: 300, height: 100)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(Color(.yellow))
                }
                
            })
            
            Button(action: {
                addItem(tapBtn: tapBtn2)
            }, label: {
                VStack {
                    Text("Button 2")
                        .foregroundColor(.black )
                        .font(Font.custom("", size: 25))
                }
                .frame(width: 300, height: 100)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(Color(.green))
                }
                
            })
            
            Button(action: {
                addItem(tapBtn: tapBtn3)
            }, label: {
                VStack {
                    Text("Button 3")
                        .foregroundColor(.black )
                        .font(Font.custom("", size: 25))
                }
                .frame(width: 300, height: 100)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(Color(.blue))
                }
                
            })
            
            Button(action: {
                addItem(tapBtn: tapBtn4)
            }, label: {
                VStack {
                    Text("Button 4")
                        .foregroundColor(.black )
                        .font(Font.custom("", size: 25))
                }
                .frame(width: 300, height: 100)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(Color(.red))
                }
                
            })

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
    
    func addNewItem(tapBtn: String) {
        withAnimation {
            for i in items {
                i.btn = tapBtn
                i.timestamp = Date()
                
                saveViewContext()
            }
        }
    }
    
    private func addItem(tapBtn: String) {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.btn = tapBtn
            
            print(items)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    
    
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

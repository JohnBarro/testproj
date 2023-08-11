//
//  MainView.swift
//  Test Project Native ios
//
//  Created by John Nemesio Barro on 8/11/23.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    @State var currentTab = "home"
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                ButtonView()
                    .tag("home")
                
                TapListView()
                    .tag("list")
            }
            
            VStack {
                HStack(spacing: 150) {
                    
                    VStack {
                        TabButton(image: "home")
                        
                        if currentTab == "home" {
                            Text("Buttons")
                                .foregroundColor(.accentColor)
                        } else {
                            Text("Buttons")
                                .foregroundColor(.gray)
                        }
                    }
                    .offset(y: 10)
                    .onTapGesture {
                        currentTab = "home"
                        
                    }
                    
                    VStack {
                        TabButton(image: "list")
                        
                        if currentTab == "list" {
                            Text("Tap Count")
                                .foregroundColor(.accentColor)
                        } else {
                            Text("Tap Count")
                                .foregroundColor(.gray)
                        }
                    }
                    .offset(y: 10)
                    .onTapGesture {
                        currentTab = "list"
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
        }
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            if currentTab == image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .shadow(color:Color(.gray).opacity(0.70), radius: 4, x: 4, y: 4)
            } else {
                if image == "home" {
                    Image("home-not")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                } else if image == "list" {
                    Image("list-not")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

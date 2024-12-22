//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Bipul Islam on 22/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack (alignment: .leading, spacing: 24){
                    //Mark: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //Mark: Notification Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.Icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}

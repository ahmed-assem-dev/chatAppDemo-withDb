//
//  ContentView.swift
//  chatAppDemo
//
//  Created by Assem on 04/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        @State var newText = ""
        VStack {
            VStack {
                TopBarRow()
                    .background(.green)
                    .cornerRadius(20)
                ScrollViewReader {proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id){message in
                            MessageBubble(message: message)
                                
                                
                        }
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft,.topRight])
                    .onChange(of: messagesManager.lastMsgId){id in
                        withAnimation{
                            proxy.scrollTo(id,anchor: .bottom)
                        }
                    }
                }
                
            }
            .background(.green)
            MessageField(messageText: newText)
                .environmentObject(messagesManager)
                .padding([.leading,.trailing],5)
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

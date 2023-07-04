//
//  MessageField.swift
//  chatAppDemo
//
//  Created by Assem on 04/07/2023.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State var messageText: String

        var body: some View {
            HStack(alignment: .center) {
                TextField("Type your message here", text: $messageText)
                    .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                    .background(Color("gray"))
                    .autocorrectionDisabled()

                Button{
                    sendMessage()
                }label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.green)
                        .cornerRadius(50)
                }.padding(.trailing,5)
            }
            .padding(8)
            .background(Color("gray"))
            .cornerRadius(25)
        }

        func sendMessage() {
            messagesManager.sendMessage(text: messageText)
            messageText = ""
        }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField(messageText: "")
            .environmentObject(MessagesManager())
    }
}

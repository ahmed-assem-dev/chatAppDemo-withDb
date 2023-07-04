//
//  MessageBubble.swift
//  chatAppDemo
//
//  Created by Assem on 04/07/2023.
//

import SwiftUI

struct MessageBubble: View {
    var message:Message
    @State var showTime = false
    var body: some View {
        let received = message.received
        VStack(alignment: received ? .leading : .trailing){
            HStack {
                Text(message.text)
                    .padding()
                    .background(received ? .gray : .yellow)
                .cornerRadius(20)
            }
            .frame(maxWidth: 300, alignment: received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if(showTime){
                Text(message.date.formatted(.dateTime.hour().minute()))
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "123", text: "Hello from my demo  chat app this is a message text",received: false, date: Date()))
    }
}

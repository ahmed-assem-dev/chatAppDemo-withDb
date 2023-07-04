//
//  MessagesManager.swift
//  chatAppDemo
//
//  Created by Assem on 04/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject{
    @Published private(set) var messages:[Message] = []
    @Published private(set) var lastMsgId = ""
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener{ querySnapshot , error in
            guard let documents = querySnapshot?.documents else{
                print("error fetching documents: \(String(describing: error))")
                return
            }
            self.messages = documents.compactMap { document -> Message? in
                do{
                    return try document.data(as: Message.self)
                }catch{
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            self.messages.sort{ $0.date < $1.date }
            if let id = self.messages.last?.id{
                self.lastMsgId = id
            }
        }
        
    }
    func sendMessage(text: String){
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false ,date: Date())
            try db.collection("messages").document().setData(from: newMessage)
            
        }
        catch
        {
            print("Coudnot create a document: \(error)")
        }
    }
}

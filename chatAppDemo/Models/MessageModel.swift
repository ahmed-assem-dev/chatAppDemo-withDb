//
//  MessageModel.swift
//  chatAppDemo
//
//  Created by Assem on 04/07/2023.
//

import Foundation

struct Message: Identifiable, Codable{
    let id: String
    let text:String
    var received:Bool = false
    let date:Date
}

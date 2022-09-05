//
//  MessageModel.swift
//  IssueReport
//
//  Created by Nitesh Banskota on 5/9/2022.
//

import Foundation

struct Message : Codable {
   
    var isFromSender : Bool
    var message : String
    var messageType: String
    
}

typealias Messages = [Message]

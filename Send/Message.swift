//
//  Message.swift
//  Send
//
//  Created by Sam Thomas on 7/29/20.
//  Copyright © 2020 Punch a Tree. All rights reserved.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    var message = ""
    var name = ""
    var phoneNumber = ""
}

class MessageStorage: ObservableObject {
    @Published var message = [Message]()
}

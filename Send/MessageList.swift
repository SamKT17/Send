//
//  MessageList.swift
//  Send
//
//  Created by Sam Thomas on 7/28/20.
//  Copyright © 2020 Punch a Tree. All rights reserved.
//

import SwiftUI

struct MessageList: View {
    
    @ObservedObject var messageStorage = MessageStorage()
    
    var body: some View {
        
        NavigationView {
            List(messageStorage.message) {
                currentMessage in
                MessageRow(message: currentMessage)
            }.navigationBarTitle("Messages")
            .navigationBarItems(trailing: NavigationLink(destination: NewMessage(message: Message(), messageStorage: self.messageStorage)) {
                Image(systemName: "plus").padding()
            })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}


struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}

//
//  NewMessage.swift
//  Send
//
//  Created by Sam Thomas on 7/30/20.
//  Copyright © 2020 Punch a Tree. All rights reserved.
//

import SwiftUI

struct NewMessage: View {
    
    @State var message: Message
    @ObservedObject var messageStorage: MessageStorage
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            Section {
                SectionTitle(title: "Name")
                TextField("Name of Reciever", text: $message.name)
            }
            
            Section {
                SectionTitle(title: "Phone Number")
                TextField("Phone Number", text: $message.phoneNumber)
            }
            
            Section {
                SectionTitle(title: "Message")
                TextField("Message", text: $message.message)
            }
            
            Section {
                Button(action:{
                    self.messageStorage.message.append(self.message)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Create")
                        Spacer()
                    }
                }.disabled(message.message.isEmpty)
            }
            
        }.listStyle(GroupedListStyle())
    }
}

struct NewMessage_Previews: PreviewProvider {
    static var previews: some View {
        NewMessage(message: Message(), messageStorage: MessageStorage())
    }
}

struct SectionTitle: View {
    
    var title: String
    
    var body: some View {
        Text(title).font(.callout).foregroundColor(.gray)
    }
    
}

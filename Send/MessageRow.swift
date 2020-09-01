//
//  ContentView.swift
//  Send
//
//  Created by Sam Thomas on 7/16/20.
//  Copyright © 2020 Punch a Tree. All rights reserved.
//

import SwiftUI
import MessageUI

struct MessageRow: View {
    
    private let messageComposeDelegate = MessageDelegate()
    
    var message: Message
    
    var body: some View {
        HStack {
            Text(message.name).font(.title).padding().lineLimit(2)
            Spacer()
            Text(message.message).font(.system(size: 20)).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Spacer()
            Button(action: {
                self.presentMessageCompose()
            }) {
                Image(systemName: "arrow.up.circle.fill").resizable().frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.blue)
            }.padding()
        }
    }
}

extension MessageRow {
    
    private class MessageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            
            switch (result) {
            case .cancelled:
                print("Message was cancelled")
                controller.dismiss(animated: true, completion: nil)
            case .failed:
                print("Message failed")
                controller.dismiss(animated: true, completion: nil)
            case .sent:
                print("Message was sent")
                controller.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }
    
    // Present an message compose view controller modally in UIKit environment
    private func presentMessageCompose() {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        let vc = UIApplication.shared.keyWindow?.rootViewController

        let composeVC = MFMessageComposeViewController()
        
        composeVC.body = message.message
        composeVC.recipients = [message.phoneNumber]
        composeVC.messageComposeDelegate = messageComposeDelegate

        vc?.present(composeVC, animated: true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessageRow(message: Message()).previewLayout(.fixed(width: 500, height: 100))
        }
    }
}


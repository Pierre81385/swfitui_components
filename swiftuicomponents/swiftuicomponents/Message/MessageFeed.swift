////
////  MessageFeed.swift
////  swiftuicomponents
////
////  Created by m1_air on 5/10/24.
////
//
//import Foundation
//import SwiftUI
//
//struct MessageFeedView: View {
//    @State private var user: User?
//    @State private var auth = FireAuth(status: false, response: "")
//
//    @ObservedObject var messages = MessageModel(message: Message(messageId: "", sender: "", hasText: false, text: "", hasImage: false, timestamp: 0.0), messages: [], status: false, response: "")
//    
//    var body: some View {
//        List(messages.messages, id: \.timestamp) {
//            message in
//            if (message.sender == user?.email) {
//                SenderMessage(message: message)
//            } else {
//                MessageFeed(message: message)
//            }
//        }
//        .rotationEffect(.radians(.pi))
//        .scaleEffect(x: -1, y: 1, anchor: .center)
//        .onAppear{
//            messages.snapshotAllMessages()
//            user = auth.GetCurrentUser()
//        }
//    }
//}
//
//struct MessageFeed: View {
//    var message: Message
//    @ObservedObject private var storage: FireStore = FireStore(imageUpload: ImageUpload(user: "", message: "", url: ""), imageUploads: [], status: false, response: "", urls: [])
//
//    var body: some View {
//            HStack {
//                VStack.init(alignment: .leading) {
//                    if(message.hasImage) {
//                        ImageList(id: message.messageId, images: storage.imageUploads)
//                    }
//                    Text(message.text)
//                    Text(message.sender).font(.headline)
//                }.rotationEffect(.radians(.pi))
//                    .scaleEffect(x: -1, y: 1, anchor: .center)
//                Spacer()
//            }.onAppear{
//                //get sender information
//                
//                    storage.getMessageImages(id: message.messageId)
//                
//            }
//        }
//}
//
//struct SenderMessage: View {
//    var message: Message
//    @ObservedObject private var storage: FireStore = FireStore(imageUpload: ImageUpload(user: "", message: "", url: ""), imageUploads: [], status: false, response: "", urls: [])
//
//    var body: some View {
//        HStack {
//            Spacer()
//            VStack.init(alignment: .trailing) {
//                if(message.hasImage) {
//                    
//                    
//                    ImageList(id: message.messageId, images: storage.imageUploads)
//                    
//                }
//                Text(message.text)
//                Text(message.sender).font(.headline)
//            }
//            .rotationEffect(.radians(.pi))
//            .scaleEffect(x: -1, y: 1, anchor: .center)
//        }.onAppear{
//            //get sender information
//                storage.getMessageImages(id: message.messageId)
//            
//        }
//    }
//}
//
//struct ImageList: View {
//    var id: String
//    var images: [ImageUpload]
//    
//    /// A container view for the list.
//    var body: some View {
//        
//        ZStack {
//            VStack {
//                    ForEach(images) { image in
//                        AsyncImage(url: URL(string: image.url)) { phase in
//                            switch phase {
//                            case .empty:
//                                ProgressView()
//                            case .success(let image):
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                            case .failure:
//                                //                                Image(systemName: "photo")
//                                //                                    .resizable()
//                                //                                    .aspectRatio(contentMode: .fit)
//                                AsyncImage(url: URL(string: image.url)) { phase in
//                                    switch phase {
//                                    case .empty:
//                                        ProgressView()
//                                    case .success(let image):
//                                        image
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                    case .failure:
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                    @unknown default:
//                                        fatalError()
//                                    }
//                                }
//                            @unknown default:
//                                fatalError()
//                            }
//                        }
//                    }
//                
//            }
//        }.onAppear {
//        }
//    }
//}

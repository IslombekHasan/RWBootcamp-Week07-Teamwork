//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var model = PostViewModel.shared
    @State private var modalIsPresented = false

    struct HeaderTitleTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(.system(.title))
        }
    }

    struct ButtonTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(.system(size: 15))
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                HStack {
                    MascotImage()
                    Spacer()
                    Text("Home")
                        .modifier(HeaderTitleTextStyle())
                        .offset(x: -mascotImageWidth / 2, y: 0)
                    Spacer()
                }
                Button(action: { self.modalIsPresented = true }) {
                    Image(systemName: "square.and.pencil")
                    Text("New Post")
                        .modifier(ButtonTextStyle())
                }
            }
                .padding(.leading, 16)
                .padding(.top, 8)

            List(model.posts) { post in
                PostView(post: post)
                    .contextMenu {
                        Button(action: {
                            // Share action
                            if let text = post.textBody {
                                let activityView = UIActivityViewController(activityItems: [text], applicationActivities: nil)
                                UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true,
                                                                                                completion: nil)
                            }
                        }) {
                            Text("Share the post")
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
            }
        }
            .sheet(isPresented: $modalIsPresented) {
                NewPostView()
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}

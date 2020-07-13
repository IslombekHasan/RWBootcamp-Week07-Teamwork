//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    @EnvironmentObject var postStore: PostViewModel
    @State private var modalIsPresented = false

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

            List(postStore.posts) { post in
                PostView(post: post)
                    .padding(.bottom, 8)
            }
        }
            .sheet(isPresented: $modalIsPresented) {
                NewPostView(postHandler: self.postStore)
        }
    }

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
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView().environmentObject(PostViewModel())
    }
}

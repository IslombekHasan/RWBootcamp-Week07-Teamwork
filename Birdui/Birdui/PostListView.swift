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
    @State var modalIsPresented = false

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

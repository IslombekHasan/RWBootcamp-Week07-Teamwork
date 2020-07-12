//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
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
                        .offset(x: -mascotImageWidth/2, y: 0)
                    Spacer()
                }
                Button(action: { self.modalIsPresented = true }) {
                    Text("Create New post")
                        .modifier(ButtonTextStyle())
                }
            }
            .padding(.leading, 16)
            .padding(.top, 8)

            List {
                PostView(post: PostViewModel.shared.posts[1])
            }
        }
        .sheet(isPresented: $modalIsPresented) {
            // Display New Post View
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}

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
                .font(.system(size: 17))
        }
    }

    struct ButtonTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(.system(size: 15))
        }
    }

    var body: some View {
        NavigationView {
        VStack(alignment: .leading) {
            let leftImageSize = 50
            HStack {
                Image("mascot_swift-badge")
                    .resizable()
                    .frame(width: 50, height: 50)
                Spacer()
                Text("Home")
                    .modifier(HeaderTitleTextStyle())
                    .padding(.leading, -CGFloat(leftImageSize))
                Spacer()
            }
            HStack {
                Button(action: { self.modalIsPresented = true }) {
                    Text("Create New post")
                        .modifier(ButtonTextStyle())
                }
            }
            List {
                Text("Layout header, new-post button, List of posts")
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .padding(.top, 16)
        .padding(.leading, 24)
        .padding(.trailing, 24)
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

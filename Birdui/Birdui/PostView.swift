//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
    let post: MediaPost

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                MascotImage()
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(post.userName)").lineLimit(1)
                    Text("\(post.timestamp.formattedString())")
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("\(post.textBody!)")
                    .fixedSize(horizontal: false, vertical: true)
                if post.uiImage != nil {
                    HStack {
                        Spacer()
                        Image(uiImage: self.post.uiImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 175, alignment: .center)
                            .cornerRadius(8)
                        Spacer()
                    }
                }
            }
            HStack {
                Spacer()
                ReactionButton(post: post)
                Spacer()
                Button(action: {
                    print("sharing")
                }) {
                    Image(systemName: "square.and.arrow.up")
                }.modifier(ActionButtonStyle())
                Spacer()
            }
                .buttonStyle(BorderlessButtonStyle())
        }
            .padding(.bottom, 8)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: PostViewModel.shared.posts[1])
    }
}

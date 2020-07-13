//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
    @EnvironmentObject var postViewModel: PostViewModel
    @State var showComments = false
    let post: MediaPost

    var body: some View {
        VStack(alignment: .leading) {
            PostHeader
            PostBody
            PostActions
        }
            .contextMenu {
                Button(action: {
                    self.displayShareSheet()
                }) {
                    Text("Share the post")
                    Image(systemName: "square.and.arrow.up")
                }
        }
    }

    /* swiftlint:disable identifier_name */

    var PostHeader: some View {
        HStack(spacing: 8) {
            MascotImage()
            VStack(alignment: .leading, spacing: 5) {
                Text("\(post.userName)").lineLimit(1)
                Text("\(post.timestamp.formattedString())")
            }
        }
    }

    var PostBody: some View {
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
    }

    var PostActions: some View {
        HStack {
            Spacer()
            ReactionButton(post: post)
            Spacer()
            Button(action: { self.showComments = true }) {
                Image(systemName: "text.bubble")
            }.modifier(ActionButtonStyle())
            Spacer()
            Button(action: {
                self.displayShareSheet()
            }) {
                Image(systemName: "square.and.arrow.up")
            }.modifier(ActionButtonStyle())
            Spacer()
        }
            .buttonStyle(BorderlessButtonStyle())
            .sheet(isPresented: $showComments) {
                CommentsListView(postID: self.post.id).environmentObject(self.postViewModel)
        }
    }

    /* swiftlint:enable identifier_name */

    func displayShareSheet() {
        var shareItems: [Any] = []
        if let text = post.textBody {
            shareItems.append("\(post.userName): \"\(text)\" ")
        }

        if let image = post.uiImage {
            shareItems.append(image)
        }
        let activityView = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityView.popoverPresentationController?.sourceView = UIView() // required for iPads
        UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true)
    }

}

struct PostView_Previews: PreviewProvider {
    static var model = PostViewModel()
    static var previews: some View {
        PostView(post: model.posts[1]).environmentObject(model)
    }
}

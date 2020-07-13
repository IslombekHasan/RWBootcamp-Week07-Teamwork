//
//  CommentsListView.swift
//  Birdui
//
//  Created by Islombek Hasanov on 7/13/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct CommentsListView: View {
    @EnvironmentObject var postViewModel: PostViewModel
    @State private var newComment: String = ""
    var postID: UUID

    var names = ["Hand-walking Crab", "SpaceCat", "SeaSeal", "Flying Bison", "Swifty"]

    var body: some View {
        VStack {
            Text("Comments")
                .font(.headline)
                .padding(.top, 16)
            Divider()
            List(postViewModel.comments.filter({ self.postID == $0.postID })) { comment in
                CommentView(comment: comment)
            }

            HStack {
                TextField("Write your comment here", text: $newComment)
                Spacer()
                Button(action: {
                    self.postViewModel.addComment(PostComment(postID: self.postID, bodyText: self.newComment, userName: "Anonymous \(self.names.randomElement()!)", timestamp: Date()))
                    self.newComment = ""
                }) {
                    Image(systemName: "paperplane.fill")
                }
                    .modifier(ActionButtonStyle())
                    .disabled(newComment.isEmpty)
            }
                .padding()
                .background(Color(.systemGray6))
        }
    }
}

struct CommentsListView_Previews: PreviewProvider {
    static var model = PostViewModel()
    static var previews: some View {
        CommentsListView(postID: model.posts[0].id).environmentObject(model)
    }
}

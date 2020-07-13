//
//  ReactionButton.swift
//  Birdui
//
//  Created by Islombek Hasanov on 7/12/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct ReactionButton: View {
    @EnvironmentObject var postViewModel: PostViewModel
    var post: MediaPost

    var body: some View {
        Button(action: {
            if self.post.reaction == .neutral {
                self.postViewModel.react(to: self.post, with: .like)
            } else {
                self.postViewModel.react(to: self.post, with: .neutral)
            }
        }) {
            Image(systemName: post.reaction.rawValue)
        }
            .modifier(ActionButtonStyle())
            .contextMenu {
                ForEach(MediaPost.Reaction.allCases, id: \.self) { reaction in
                    Button(action: {
                        self.postViewModel.react(to: self.post, with: reaction)
                    }) {
                        Text(String(describing: reaction).capitalized)
                        Image(systemName: reaction.rawValue)
                    }
                }
        }
    }
}

struct ActionButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(Color(.systemOrange))
            .frame(width: 32, height: 32, alignment: .center)
    }
}

struct ReactionButton_Previews: PreviewProvider {
    static var previews: some View {
        ReactionButton(post: PostViewModel().posts[0])
    }
}

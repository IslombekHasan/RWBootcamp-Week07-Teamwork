//
//  PostViewModel.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

class PostViewModel: ObservableObject {
    @Published var posts: [MediaPost] = []
    @Published var comments: [PostComment] = []

    init() {
        // Sample posts
        let welcome = MediaPost(textBody: "Reactions 🥳, long press 👆🏼, share sheet 🤭, comments 😱 and more! With ❤️ from Cacti Team JAI!", userName: "Team JAI", timestamp: Date(timeIntervalSinceNow: -1000), uiImage: nil, reaction: .flame)
        let hater = MediaPost(textBody: "I hate SwiftUI!", userName: "Hater101", timestamp: Date(timeIntervalSinceNow: -6000), uiImage: nil, reaction: .dislike)
        let imagePost1 = MediaPost(textBody: "I love debugging software!", userName: "Jay", timestamp: Date(timeIntervalSinceNow: -123456), uiImage: UIImage(named: "chop"))
        let imagePost2 = MediaPost(textBody: "Went to the Aquarium today :]", userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876), uiImage: UIImage(named: "octopus"), reaction: .like)
        let textPost1 = MediaPost(textBody: "Hello World!", userName: "Bhagat", timestamp: Date(timeIntervalSinceNow: -67890), uiImage: nil, reaction: .love)
        let textPost2 = MediaPost(textBody: "This is my favorite social media app! This is my favorite social media app! This is my favorite social media app!",
                                  userName: "Jeff", timestamp: Date(timeIntervalSinceNow: -2345), uiImage: nil)

        // NOTE: We used a separate ViewModel for comments, but then we changed our minds.
        // Sample comments
        let comment1 = PostComment(postID: welcome.id, bodyText: "Wow, guys! This is just great!", userName: "Ray Wenderlich", timestamp: Date(timeIntervalSinceNow: -900))
        let comment2 = PostComment(postID: hater.id, bodyText: "booooo! Have you even written on SwiftUI?", userName: "SwiftUI Lover", timestamp: Date(timeIntervalSinceNow: -900))
        let comment3 = PostComment(postID: textPost1.id, bodyText: "Hey Bhagat! How are you doing? :]", userName: "Team JAI", timestamp: Date(timeIntervalSinceNow: -900))
        let comment4 = PostComment(postID: imagePost2.id, bodyText: "Wow, guys! This is just great!", userName: "Ray Wenderlich", timestamp: Date(timeIntervalSinceNow: -900))
        let comment5 = PostComment(postID: welcome.id, bodyText: "Great job indeed! Just need to refactor some code and everything will be just awesome <3", userName: "Islombek", timestamp: Date(timeIntervalSinceNow: -900))

        posts = [welcome, hater, imagePost1, imagePost2, textPost1, textPost2].sorted(by: { $0.timestamp > $1.timestamp })
        comments = [comment1, comment2, comment3, comment4, comment5].sorted(by: { $0.timestamp < $1.timestamp })
    }

    func addPost(post: MediaPost) {
        posts.append(post)
        posts = posts.sorted(by: { $0.timestamp > $1.timestamp })
    }

    func react(to post: MediaPost, with reaction: MediaPost.Reaction) {
        if let index = posts.firstIndex(where: { (postToCompare) -> Bool in
            post.id == postToCompare.id
        }) {
            posts[index].reaction = reaction
        }
    }

    func addComment(_ comment: PostComment) {
        comments.append(comment)
        comments = comments.sorted(by: { $0.timestamp < $1.timestamp })
    }
}

//
//  AppDelegate.swift
//  Birdui
//
//  Created by Audrey Tam on 3/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import UIKit
//
//protocol Postable {
//    var id: UUID { get }
//    var textBody: String? { get }
//    var userName: String { get }
//    var timestamp: Date { get }
//}

struct MediaPost: Identifiable {
    let id = UUID()
    let textBody: String?
    let userName: String
    let timestamp: Date
    let uiImage: UIImage?
    var reaction: Reaction = .neutral

    enum Reaction: String, CaseIterable {
        case love = "heart.fill"
        case flame = "flame.fill"
        case like = "hand.thumbsup.fill"
        case dislike = "hand.thumbsdown.fill"
        case neutral = "hand.thumbsup"
    }
}

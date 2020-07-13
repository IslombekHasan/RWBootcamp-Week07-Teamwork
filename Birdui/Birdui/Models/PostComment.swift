//
//  PostComments.swift
//  Birdui
//
//  Created by Islombek Hasanov on 7/13/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

struct PostComment: Identifiable {
    let id = UUID()
    let postID: UUID
    let bodyText: String
    let userName: String
    let timestamp: Date
}

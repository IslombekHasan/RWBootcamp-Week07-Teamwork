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

        // header
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 8) {
                    MascotImage()
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(post.userName)").lineLimit(1)
                        Text("\(post.timestamp.formattedString())")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(post.textBody != nil ? "\(post.textBody!)" : "")
                    if post.uiImage != nil {
                        HStack {
                            Spacer()
                            Image(uiImage: post.uiImage!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100, alignment: .center)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
                                 userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
                                 uiImage: UIImage(named: "octopus")))
    }
}

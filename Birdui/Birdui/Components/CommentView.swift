//
//  CommentView.swift
//  Birdui
//
//  Created by Islombek Hasanov on 7/13/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    var comment: PostComment

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(comment.userName)").bold()
                Spacer()
                Text("\(comment.timestamp.formattedString())")
                    .font(.footnote)
            }
            Text("\(comment.bodyText)")
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: PostViewModel().comments[0])
    }
}

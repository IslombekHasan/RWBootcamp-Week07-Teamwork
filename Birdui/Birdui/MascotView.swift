//
//  MascotView.swift
//  Birdui
//
//  Created by Janin Culhaoglu on 12/07/2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

let mascotImageWidth: CGFloat = 50

struct MascotImage: View {
    var body: some View {
        Image("mascot_swift-badge")
            .resizable()
            .frame(width: mascotImageWidth, height: mascotImageWidth)
    }
}

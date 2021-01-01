//
//  AspectRatio.swift
//  MauriKit
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import UIKit

public extension UIView {
    /// Reports image view's aspect ratio. For instance, an square image (height and width equal) will report an aspect ratio of 1, otherwise the value will be
    /// the resulting division of its width and its height
    var aspectRatio: CGFloat {
        frame.width / frame.height
    }
}

//
//  Rounded.swift
//  MauriKit
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import UIKit

public extension UIView {
    /// Turn current component into a rounded one. Works properly on squared components (aspect ratio 1:1)
    func rounded() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layoutIfNeeded()
    }
}

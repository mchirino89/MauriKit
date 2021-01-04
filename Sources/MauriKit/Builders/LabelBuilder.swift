//
//  LabelBuilder.swift
//  
//
//  Created by Mauricio Chirino on 13/12/20.
//

import UIKit

public struct LabelBuilder {
    public static func assemble(textStyle: UIFont.TextStyle,
                         fontColor: UIColor = .label,
                         backgroundColor: UIColor = .clear,
                         text: String = "lorem ipsum") -> UILabel {
        let label = UILabel()
        label.textColor = fontColor
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.75
        label.backgroundColor = .clear
        label.font = .preferredFont(forTextStyle: textStyle)
        label.text = text

        return label
    }
}

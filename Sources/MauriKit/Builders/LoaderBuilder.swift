//
//  LoaderBuilder.swift
//  
//
//  Created by Mauricio Chirino on 15/12/20.
//

import UIKit

public struct LoaderBuilder {
    public static func assemble(style: UIActivityIndicatorView.Style = .large,
                                color: UIColor = .systemBlue) -> UIActivityIndicatorView {
        let loader = UIActivityIndicatorView(style: style)
        loader.startAnimating()
        loader.color = color

        return loader
    }
}

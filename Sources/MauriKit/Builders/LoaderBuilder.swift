//
//  LoaderBuilder.swift
//  
//
//  Created by Mauricio Chirino on 15/12/20.
//

import UIKit

public struct LoaderBuilder {
    /// Builds an activity indicator with minimum default configuration
    /// - Parameters:
    ///   - style: native style. Defaults to `.large`
    ///   - color: desired color to show for animation. Defaults to `.systemBlue`
    ///   (this color's contrast is adjusted automatically by the OS between _light_ and _dark_ mode)
    /// - Returns: An `UIActivityIndicatorView` with the given setup
    public static func assemble(style: UIActivityIndicatorView.Style = .large,
                                color: UIColor = .systemBlue) -> UIActivityIndicatorView {
        let loader = UIActivityIndicatorView(style: style)
        loader.startAnimating()
        loader.color = color

        return loader
    }
}

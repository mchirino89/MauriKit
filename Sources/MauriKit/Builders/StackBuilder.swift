//
//  StackBuilder.swift
//
//
//  Created by Mauricio Chirino on 13/12/20.
//

import UIKit

public struct StackSetup {
    let arrangedSubviews: [UIView]
    let axis: NSLayoutConstraint.Axis
    let spacing: CGFloat
    let alignment: UIStackView.Alignment
    let distribution: UIStackView.Distribution

    public init(arrangedSubviews: [UIView],
                axis: NSLayoutConstraint.Axis = .vertical,
                spacing: CGFloat = UIConstants.standardPadding,
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill) {
        self.arrangedSubviews = arrangedSubviews
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
}

public struct StackBuilder {
    public static func assemble(basedOn setup: StackSetup) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: setup.arrangedSubviews)
        stackView.axis = setup.axis
        stackView.spacing = setup.spacing
        stackView.alignment = setup.alignment
        stackView.distribution = setup.distribution

        return stackView
    }
}

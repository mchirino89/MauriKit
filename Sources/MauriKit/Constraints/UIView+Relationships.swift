//
//  File.swift
//  
//
//  Created by Mauricio Chirino on 31/12/20.
//

import UIKit

public typealias Relationships = (_ child: UIView, _ other: UIView) -> NSLayoutConstraint

public func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0,
                                priority: UILayoutPriority = .required) -> [Relationships] where Anchor: NSLayoutAnchor<Axis> {
    return equal(keyPath, keyPath, constant: constant, priority: priority)
}

public func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                _ toAnchor: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0,
                                priority: UILayoutPriority = .required)
-> [Relationships] where Anchor: NSLayoutAnchor<Axis> {
    return [{ view, other in
        let constraint = view[keyPath: keyPath].constraint(equalTo: other[keyPath: toAnchor], constant: constant)
        constraint.priority = priority
        return constraint
    }]
}

public func equal<Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                          multiplier: CGFloat,
                          constant: CGFloat = 0) -> [Relationships] where Anchor: NSLayoutDimension {
    return equal(keyPath, keyPath, multiplier: multiplier, constant: constant)
}

public func equal<Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                          _ toAnchor: KeyPath<UIView, Anchor>,
                          multiplier: CGFloat,
                          constant: CGFloat = 0) -> [Relationships] where Anchor: NSLayoutDimension {
    return [{ view, other in
        view[keyPath: keyPath].constraint(equalTo: other[keyPath: toAnchor], multiplier: multiplier, constant: constant)
    }]
}
public func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                to: UIView,
                                constant: CGFloat = 0) -> [Relationships] where Anchor: NSLayoutAnchor<Axis> {
    return equal(keyPath, to: to, keyPath, constant: constant)
}

public func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                to: UIView, _ toAnchor: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0) -> [Relationships] where Anchor: NSLayoutAnchor<Axis> {
    return [{ view, _ in
        view[keyPath: keyPath].constraint(equalTo: to[keyPath: toAnchor], constant: constant)
    }]
}

public func constant<Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                             constant: CGFloat,
                             priority: UILayoutPriority = .required) -> [Relationships] where Anchor: NSLayoutDimension {
    return [{ view, _ in
        let constraint = view[keyPath: keyPath].constraint(equalToConstant: constant)
        constraint.priority = priority
        return constraint
    }]
}

public func pinAllEdges(margin: CGFloat = 0) -> [Relationships] {
    return pinHorizontalEdges(margin: margin) + pinVerticalEdges(margin: margin)
}

public func pinHorizontalEdges(margin: CGFloat = 0) -> [Relationships] {
    return equal(\.safeAreaLayoutGuide.leadingAnchor, constant: margin)
        + equal(\.safeAreaLayoutGuide.trailingAnchor, constant: -margin)
}

public func pinVerticalEdges(margin: CGFloat = 0) -> [Relationships] {
    return equal(\.safeAreaLayoutGuide.topAnchor, constant: margin) +
        equal(\.safeAreaLayoutGuide.bottomAnchor, constant: -margin)
}

public func pinToCenter() -> [Relationships] {
    return equal(\.safeAreaLayoutGuide.centerXAnchor) + equal(\.safeAreaLayoutGuide.centerYAnchor)
}

public func pinToCenter(of view: UIView) -> [Relationships] {
    return equal(\.safeAreaLayoutGuide.centerXAnchor, to: view) + equal(\.safeAreaLayoutGuide.centerYAnchor, to: view)
}

public extension UIView {
    func addSubview(_ child: UIView, constraints: [[Relationships]]) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.flatMap { $0.map { $0(child, self) } })
    }
}

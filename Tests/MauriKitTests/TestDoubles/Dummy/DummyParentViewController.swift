//
//  DummyParentViewController.swift
//  
//
//  Created by Mauricio Chirino on 25/4/21.
//

import UIKit

final class DummyParentViewController: UIViewController {
    let containerView: UIView

    init() {
        let containerSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        containerView = UIView(frame: CGRect(origin: .zero, size: containerSize))
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(containerView)
    }
}

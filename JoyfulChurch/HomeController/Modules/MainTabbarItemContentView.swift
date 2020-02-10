//
//  MainTabbarItemContentView.swift
//  JoyfulChurch
//
//  Created by Taejune Jung on 06/02/2020.
//  Copyright © 2020 JoyfulChurch. All rights reserved.
//

import Foundation
import ESTabBarController_swift

final class MainTabBarItemContentView: ESTabBarItemContentView {

    // MARK: - Con(De)structor
    public var duration = 0.3

    override init(frame: CGRect) {
        super.init(frame: frame)

        setProperties()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func selectAnimation(animated: Bool, completion: (() -> Void)?) {
        self.bounceAnimation()
        completion?()
    }

    override func reselectAnimation(animated: Bool, completion: (() -> Void)?) {
        self.bounceAnimation()
        completion?()
    }

    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }

    // MARK: - Private methods

    private func setProperties() {
        renderingMode = .alwaysOriginal
        titleLabel.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        textColor = .brownishGrayCw
        highlightTextColor = .whiteCw

        badgeColor = .redCw
        badgeView.badgeLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)

        insets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }

}

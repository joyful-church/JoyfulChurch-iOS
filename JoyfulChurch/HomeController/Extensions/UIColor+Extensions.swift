//
//  UIColor+Extensions.swift
//  JoyfulChurch
//
//  Created by Taejune Jung on 06/02/2020.
//  Copyright © 2020 JoyfulChurch. All rights reserved.
//

import UIKit

public extension UIColor {
    
    // MARK: - CashDoc
    
    class var yellowCw: UIColor {
        return UIColor.fromRGB(255, 210, 0)
    }
    class var diarrheaCw: UIColor {
        return UIColor.fromRGB(155, 129, 5)
    }
    class var dandelionCw: UIColor {
        return UIColor.fromRGB(255, 235, 0)
    }
    class var greenCw: UIColor {
        return UIColor.fromRGB(32, 196, 49)
    }
    class var goldenCw: UIColor {
        return UIColor.fromRGB(242, 199, 2)
    }
    class var blueCw: UIColor {
        return UIColor.fromRGB(53, 143, 255)
    }
    class var frenchBlueCw: UIColor {
        return UIColor.fromRGB(66, 102, 178)
    }
    class var iceBlueCw: UIColor {
        return UIColor.fromRGB(233, 239, 244)
    }
    class var redCw: UIColor {
        return UIColor.fromRGB(255, 47, 74)
    }
    class var blackCw: UIColor {
        return UIColor.fromRGB(17, 17, 17)
    }
    class var blackAlphaCw: UIColor {
        return UIColor.fromRGBA(17, 17, 17, 0.5)
    }
    class var blackTwoCw: UIColor {
        return UIColor.fromRGB(51, 51, 51)
    }
    class var brownishGrayCw: UIColor {
        return UIColor.fromRGB(102, 102, 102)
    }
    class var brownGrayCw: UIColor {
        return UIColor.fromRGB(153, 153, 153)
    }
    class var brownGrayTwoCw: UIColor {
        return UIColor.fromRGB(170, 170, 170)
    }
    class var veryLightPinkCw: UIColor {
        return UIColor.fromRGB(187, 187, 187)
    }
    class var veryLightPinkTwoCw: UIColor {
        return UIColor.fromRGB(242, 242, 242)
    }
    class var veryLightPinkThreeCw: UIColor {
        return UIColor.fromRGB(238, 238, 238)
    }
    class var veryLightPinkFourCw: UIColor {
        return UIColor.fromRGB(240, 240, 240)
    }
    class var grayCw: UIColor {
        return UIColor.fromRGB(216, 216, 216)
    }
    class var grayTwoCw: UIColor {
        return UIColor.fromRGB(249, 249, 249)
    }
    class var grayThreeCw: UIColor {
        return UIColor.fromRGB(252, 252, 252)
    }
    class var whiteCw: UIColor {
        return UIColor.fromRGB(246, 246, 246)
    }
    class var azureBlue: UIColor {
        return UIColor.fromRGB(0, 144, 255)
    }
    class var black: UIColor {
        return UIColor.fromRGB(17, 17, 17)
    }
    class var blackTwo: UIColor {
        return UIColor.fromRGB(51, 51, 51)
    }
    class var blackTwoClick: UIColor {
        return UIColor.fromRGB(100, 100, 100)
    }
    class var blackThree: UIColor {
        return UIColor.fromRGB(56, 56, 56)
    }
    class var brightBlue: UIColor {
        return UIColor.fromRGB(0, 122, 255)
    }
    class var brownishGray: UIColor {
        return UIColor.fromRGB(102, 102, 102)
    }
    class var coralRed: UIColor {
        return UIColor.fromRGB(255, 65, 65)
    }
    class var coralRedClick: UIColor {
        return UIColor.fromRGB(170, 9, 9)
    }
    class var darkBrown: UIColor {
        return UIColor.fromRGB(94, 80, 80)
    }
    class var gray2: UIColor {
        return UIColor.fromRGB(199, 199, 199)
    }
    class var linkBlue: UIColor {
        return UIColor.fromRGB(72, 103, 154)
    }
    class var lineGray: UIColor {
        return UIColor.fromRGB(236, 236, 236)
    }
    class var white2: UIColor {
        return UIColor.fromRGB(244, 244, 244)
    }
    class var white3: UIColor {
        return UIColor.fromRGB(242, 242, 242)
    }
    class var white4: UIColor {
        return UIColor.fromRGB(250, 250, 250)
    }
    class var sunFlowerYellow: UIColor {
        return UIColor.fromRGB(255, 210, 0)
    }
    class var sunFlowerYellowClick: UIColor {
        return UIColor.fromRGB(255, 238, 0)
    }
    class var warmGray: UIColor {
        return UIColor.fromRGB(153, 153, 153)
    }
    class var zumBlue: UIColor {
        return UIColor.fromRGB(56, 106, 253)
    }
    // MARK: - Class methods
    
    class func fromRGB(_ r: Double, _ g: Double, _ b: Double) -> UIColor {
        let const = 255.0
        return UIColor(red: CGFloat(r / const), green: CGFloat(g / const), blue: CGFloat(b / const), alpha: 1.0)
    }
    class func fromRGBA(_ r: Double, _ g: Double, _ b: Double, _ a: Double) -> UIColor {
        let const = 255.0
        return UIColor(red: CGFloat(r / const), green: CGFloat(g / const), blue: CGFloat(b / const), alpha: CGFloat(a))
    }
}

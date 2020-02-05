//
//  Util.swift
//  CashDoc
//
//  Created by HanSangbeom on 2017. 4. 3..
//  Copyright © 2017년 Cashwalk, Inc. All rights reserved.
//

import UIKit

enum ScreenSize {
    static let WIDTH         = UIScreen.main.bounds.size.width
    static let HEIGHT        = UIScreen.main.bounds.size.height
    static let MAX_LENGTH    = max(ScreenSize.WIDTH, ScreenSize.HEIGHT)
    static let MIN_LENGTH    = min(ScreenSize.WIDTH, ScreenSize.HEIGHT)
}

enum StatusBarSize {
    static let HEIGHT = UIApplication.shared.statusBarFrame.size.height
    static let WIDTH = UIApplication.shared.statusBarFrame.size.width
}

enum DeviceType {
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MAX_LENGTH == 736.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MAX_LENGTH == 812.0
    static let IS_IPHONE_X_MORE     = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MAX_LENGTH >= 812.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.MAX_LENGTH == 1024.0
}

var widthRatio: CGFloat {
    return UIScreen.main.bounds.width / 375.0
}

var heightRatio: CGFloat {
    return UIScreen.main.bounds.height / 667.0
}

var hasTopNotch: Bool {
    if StatusBarSize.HEIGHT > 20 {
        return true
    }
    return false
}

let tabBarControllerBottom: CGFloat = 48
let navigationBarHeight: CGFloat = 44

func getAppVersion() -> String {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
}

func getOSVersion() -> String {
    return UIDevice.current.systemVersion
}

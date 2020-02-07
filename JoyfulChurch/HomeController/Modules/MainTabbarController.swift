//
//  MainTabbarController.swift
//  JoyfulChurch
//
//  Created by Taejune Jung on 06/02/2020.
//  Copyright © 2020 JoyfulChurch. All rights reserved.
//

import ESTabBarController_swift

//import UIKit
//import MessageUI
//import ESTabBarController
//import Lottie
//import StoreKit
//import RxSwift
//import RxCocoa
//import Firebase

final class MainTabBarController: ESTabBarController {
    
    // MARK: - Constants
    
    enum MainTabItemType: Int, CaseIterable {
        case home
        case message
        case more
        
        func navigationController(tabBarController: UITabBarController) -> BaseNavigationController {
            let title: String
            let normalImageName: String
            let selectedImageName: String
            
            switch self {
            case .home:
                title = "JOYFUL"
                normalImageName = "unselectedHome"
                selectedImageName = "selectedHome"
            case .message:
                title = "MESSAGE"
                normalImageName = "unselectedMessage"
                selectedImageName = "selectedMessage"
            case .more:
                title = "MORE"
                normalImageName = "unselectedMore"
                selectedImageName = "selectedMore"
            }
            
            let navigationController = BaseNavigationController(rootViewController: rootViewController(tabBarController: tabBarController))
            
            navigationController.tabBarItem = ESTabBarItem(MainTabBarItemContentView(),
                                                           title: title,
                                                           image: UIImage(named: normalImageName),
                                                           selectedImage: UIImage(named: selectedImageName),
                                                           tag: rawValue)
            
            return navigationController
        }
        
        private func rootViewController(tabBarController: UITabBarController) -> UIViewController {
            switch self {
            case .home:
                let sb = UIStoryboard.init(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return UIViewController() }
                return vc
                
            case .message:
                let sb = UIStoryboard.init(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: "MessageViewController") as? MessageViewController else { return UIViewController() }
                return vc
            case .more:
                let sb = UIStoryboard.init(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: "MoreViewController") as? MoreViewController else { return UIViewController() }
                return vc
            }
        }
    }
    
    // MARK: - Properties
    private var prevSelectedItem: UITabBarItem?
    private var slotIcons: [UIImage]?

    lazy var mainTabItems: [BaseNavigationController] = {
        var items = [BaseNavigationController]()
        MainTabItemType.allCases.forEach({ (item) in
            items.append(item.navigationController(tabBarController: self))
        })
        return items
    }()
    
    // MARK: - Overridden: UITabBarController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
        setTabBar()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Public methods

 
    
    // MARK: - Private methods
    
    private func setProperties() {
        view.backgroundColor = .white
        tabBar.barTintColor = .blackCw
        tabBar.tintColor = .whiteCw
        tabBar.unselectedItemTintColor = .brownGrayCw
    }
    
//    private func setAnalytics() {
//        Analytics.setUserID(UserManager.shared.userModel?.code)
//        Analytics.setUserProperty(UserManager.shared.userModel?.nickname, forName: "nickName")
//        Analytics.setUserProperty(UserManager.shared.userModel?.email, forName: "email")
//        Analytics.setUserProperty(String(UserManager.shared.userModel?.point ?? 0), forName: "point")
//        Analytics.setUserProperty(String(UserManager.shared.userModel?.rulletteRemainCnt ?? 0), forName: "rulletteRemainCnt")
//        Analytics.setUserProperty(UserDefaults.standard.string(forKey: UserDefaultKey.kFirstAppVersion.rawValue), forName: "kFirstAppVersion")
//
//        Crashlytics.sharedInstance().setUserIdentifier(UserManager.shared.userModel?.code)
//        Crashlytics.sharedInstance().setUserName(UserManager.shared.userModel?.nickname)
//        Crashlytics.sharedInstance().setUserEmail(UserManager.shared.userModel?.email)
//        Crashlytics.sharedInstance().setObjectValue(String(UserManager.shared.userModel?.point ?? 0), forKey: "point")
//        Crashlytics.sharedInstance().setObjectValue(String(UserManager.shared.userModel?.rulletteRemainCnt ?? 0), forKey: "rulletteRemainCnt")
//        Crashlytics.sharedInstance().setObjectValue(UserDefaults.standard.string(forKey: UserDefaultKey.kFirstAppVersion.rawValue), forKey: "kFirstAppVersion")
//    }
    
    private func setTabBar() {
        tabBar.isTranslucent = false
        self.delegate = self
        viewControllers = mainTabItems
        setInitialVC()
    }
    
    private func setInitialVC() {
        //selectedIndex = RemoteConfigManager.shared.getBool(from: .ios_app_start_reward) ?? true ? 2 : 0
        selectedIndex = 0
    }
    
    private func isReviewDateForAWeek(reviewDateStr: String) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        guard let reviewDate = formatter.date(from: reviewDateStr) else { return false }
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.day], from: reviewDate, to: Date())
        guard let day = components.day else { return false }
        if day > 7 {
            return true
        } else {
            return false
        }
    }
}

// MARK: - Layout
extension MainTabBarController {
    private func layout() {

    }
}

// MARK: - UITabBarDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        super.tabBar(tabBar, didSelect: item)

        defer {
            prevSelectedItem = item
        }

        guard let navigationController = viewControllers?[item.tag] as? BaseNavigationController else { return }
//        GlobalDefine.shared.curNav = navigationController
        
        guard item.tag == MainTabItemType.home.rawValue else { return }
        navigationController.popToRootViewController(animated: false)
    }
}

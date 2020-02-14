//
//  UserNotificationManager.swift
//  JoyfulChurch
//
//  Created by Taejune Jung on 12/02/2020.
//  Copyright © 2020 JoyfulChurch. All rights reserved.
//

import UserNotifications
import FirebaseMessaging

//extension Notification.Name {
//    static let FCMToken = Notification.Name("FCMToken")
//}
//
//class UserNotificationManager {
//    
//    // MARK: - Constants
//    
//    static let shared = UserNotificationManager()
//    
//    // MARK: - Public Methods
//    
//    func addDailyNotification(_ isLinked: Bool? = nil) {
//        let shouldAddNoti = UserDefaults.standard.object(forKey: UserDefaultKey.kIsConsumeReportAlarmOn.rawValue) as? Bool ?? true
//        if !shouldAddNoti { return }
//        let content = UNMutableNotificationContent()
//        let categoryIdentifier = NotificationIdentifier.DailyNotification1930.rawValue
//        var date = Date()
//        let currentHour = Calendar.current.component(.hour, from: Date())
//        
//        content.sound = UNNotificationSound.default
//        content.badge = 1
//        content.categoryIdentifier = categoryIdentifier
//        
//        let randomNumber = Int.random(in: 0 ..< 60)
//        if let isLinkedProperty = isLinked {
//            if isLinkedProperty {
//                content.title = "오늘은 얼마나 썼나?"
//                content.body = "소비내역 확인하고 캐시적립해요!😄"
//                date = Calendar.current.date(bySettingHour: 19, minute: randomNumber, second: randomNumber, of: Date()) ?? Date()
//            } else {
//                content.title = "선물 도착"
//                content.body = "100% 당첨되는 캐시 선물 받아가세요."
//                date = Calendar.current.date(bySettingHour: 20, minute: randomNumber, second: randomNumber, of: Date()) ?? Date()
//            }
//        } else {
//            if currentHour >= 19 && currentHour <= 21 {
//                return
//            }
//            
//            content.title = "선물 도착"
//            content.body = "100% 당첨되는 캐시 선물 받아가세요."
//            date = Calendar.current.date(bySettingHour: 20, minute: randomNumber, second: randomNumber, of: Date()) ?? Date()
//        }
//        
//        #if DEBUG
//        //date = Date(timeIntervalSinceNow: 10)
//        #endif
//        let triggerDaily = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
//        
//        // Used For Test
////        let date = Date(timeIntervalSinceNow: 10)
////        let triggerDaily = Calendar.current.dateComponents([.second,], from: date)
////        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
//        
//        let identifier = categoryIdentifier
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request) { (error) in
//            if let error = error {
//                Log.e("Error \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func removeDailyNotification() {
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [NotificationIdentifier.DailyNotification1930.rawValue])
//    }
//
//    func addCardPaymentDateNotification() {
//        let shouldAddNoti = UserDefaults.standard.object(forKey: UserDefaultKey.kIsCardPaymentDateAlarmOn.rawValue) as? Bool ?? true
//        if !shouldAddNoti { return }
//        
//        var dateAndCard = [String: [String]]()
//        
//        CardPaymentRealmProxy().getPaymentDetails().results.forEach { (paymentDetails) in
//            guard let estDate = paymentDetails.estDate, estDate != "", let estAmt = paymentDetails.estAmt, estAmt != "0", let fCodeName = paymentDetails.fCodeName else {return}
//            
//            if var cardNameList = dateAndCard[estDate] {
//                cardNameList.append(fCodeName)
//            } else {
//                dateAndCard[estDate] = [fCodeName]
//            }
//        }
//        
//        dateAndCard.forEach { (estDate, value) in
//            if estDate.count != 8 {return}
//            
//            guard let month = Int(estDate[4..<6]), let day = Int(estDate[6..<8]) else {return}
//            
//            let content = UNMutableNotificationContent()
//            let categoryIdentifier = "\(NotificationIdentifier.CardPaymentDate1200.rawValue)\(estDate[4..<8])"
//            let cardNames = value.joined(separator: ", ")
//            
//            content.title = "카드 결제일 미리 알림"
//            content.body = "\(month)월 \(day)일은 \(cardNames) 결제 예정일 입니다."
//            content.sound = UNNotificationSound.default
//            content.badge = 1
//            content.categoryIdentifier = categoryIdentifier
//            
//            var dateComp = DateComponents()
////            dateComp.year = year
//            dateComp.month = month
//            dateComp.day = day > 1 ? day - 1 : day
//            dateComp.hour = 12
//            dateComp.minute = Int.random(in: 0 ..< 60)
//            dateComp.second = Int.random(in: 0 ..< 60)
//            
//            let triggerDaily = dateComp
//            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
//            
//            let identifier = categoryIdentifier
//            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//            
//            UNUserNotificationCenter.current().add(request) { (error) in
//                if let error = error {
//                    Log.e("Error \(error.localizedDescription)")
//                }
//            }
//        }
//    }
//    
//    func removeCardPaymentDateNotification() {
//        var identifiers = [String]()
//        
//        CardPaymentRealmProxy().getPaymentDetails().results.forEach { (paymentDetails) in
//            guard let estDate = paymentDetails.estDate, estDate.count == 8 else {return}
//            identifiers.append("\(NotificationIdentifier.CardPaymentDate1200.rawValue)\(estDate[4..<8])")
//        }
//        
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//    }
//    
//    func addPropertyNotification() {
//        let content = UNMutableNotificationContent()
//        let categoryIdentifier = NotificationIdentifier.Property.rawValue
//        
//        content.body = "자산이 업데이트 되었어요."
//        content.sound = UNNotificationSound.default
//        content.badge = 1
//        content.categoryIdentifier = categoryIdentifier
//        
//        let identifier = categoryIdentifier
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: nil)
//        
//        UNUserNotificationCenter.current().add(request) { (error) in
//            if let error = error {
//                Log.e("Error \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func addAccountBookNotification() {
//        let content = UNMutableNotificationContent()
//        let categoryIdentifier = NotificationIdentifier.PointUpdated.rawValue
//        
//        content.body = "가계부가 업데이트 되었어요."
//        content.sound = UNNotificationSound.default
//        content.badge = 1
//        content.categoryIdentifier = categoryIdentifier
//        
//        let identifier = categoryIdentifier
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: nil)
//        
//        UNUserNotificationCenter.current().add(request) { (error) in
//            if let error = error {
//                Log.e("Error \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func addPointUpdatedNotification(point: String) {
//        let categoryIdentifier = NotificationIdentifier.Property.rawValue
//        let content = UNMutableNotificationContent()
//        content.body = point + " 캐시가 적립되었어요."
//        content.sound = UNNotificationSound.default
//        content.badge = 1
//        content.categoryIdentifier = categoryIdentifier
//        
//        // Used For Test
////        let date = Date(timeIntervalSinceNow: 0.25)
////        let triggerDaily = Calendar.current.dateComponents([.second,], from: date)
////        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: false)
//        
//        let identifier = categoryIdentifier
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: nil)
//        
//        UNUserNotificationCenter.current().add(request) { (error) in
//            if let error = error {
//                Log.e("Error \(error.localizedDescription)")
//            }
//            UserManager.shared.getUser()
//        }
//    }
//    
//    func removePointUpdatedNotification() {
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [UserDefaultKey.kPointUpdatedNotification.rawValue])
//    }
//    
//    func addNotificationFromFCM(data: [AnyHashable: Any]) {
//        guard let message = getMessageFromFCM(data: data) else {return}
//        
//        if #available(iOS 10.0, *) {
//            let content = UNMutableNotificationContent()
//            content.body = message
//            content.sound = UNNotificationSound.default
//            content.userInfo = data
//            
//            let request = UNNotificationRequest(identifier: message, content: content, trigger: nil)
//            UNUserNotificationCenter.current().add(request, withCompletionHandler: { (_) in
//                UserManager.shared.getUser()
//            })
//        } else {
//            let localNotification = UILocalNotification()
//            localNotification.alertBody = message
//            localNotification.soundName = UILocalNotificationDefaultSoundName
//            localNotification.userInfo = data
//            UIApplication.shared.scheduleLocalNotification(localNotification)
//        }
//    }
//    
//    func subscribeTopics(createdAt: Int) {
//        var fixedNumberStr = "\(createdAt % 1000)"
//        if fixedNumberStr.count == 2 {
//            fixedNumberStr = "0\(fixedNumberStr)"
//        } else if fixedNumberStr.count == 1 {
//            fixedNumberStr = "00\(fixedNumberStr)"
//        }
//        
//        Messaging.messaging().subscribe(toTopic: "cashdoc_\(fixedNumberStr)")
//    }
//    
//    // MARK: - Private methods
//    
//    private func getMessageFromFCM(data: [AnyHashable: Any]) -> String? {
//        guard let type = data["type"] as? String else {return nil}
//        
//        let messageType = FCMMessageType(rawValue: type)
//
//        return messageType?.createMessage(data: data)
//    }
//}

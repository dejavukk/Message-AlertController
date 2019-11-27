//
//  AppDelegate.swift
//  Message-AlertController
//
//  Created by JunHyuk on 2019/11/12.
//  Copyright © 2019 junhyuk. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
// UNUserNotificationCenterDelegate 패턴 추가, "알림센터와 관련하여 사건이 발생하면 AppDelegate한테 통보."
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    // 앱 처음 실행될 때 호출되는 메소드.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 11.0, *) {
            
            // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 사용자 동의 여부 차을 실행
            let notiCenter = UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (didAllow, e) in }
            
            // 알림 메시지를 클릭하는 이벤트를 전달받을 수 있다.
            notiCenter.delegate = self
        } else {
            
            // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 이를 애플리케이션에 저장.
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(setting)
        }
        
        return true
    }
    
    // 앱이 활성화 상태를 잃었을 때 실행되는 메소드.
    func applicationWillResignActive(_ application: UIApplication) {
        if #available(iOS 10.0, *) {    // Usernotification 프레임워크를 이용한 로컬 알림 (iOS 10 이상)
            // 알림 동의 여부를 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    
                    // 알림 콘텐츠 객체
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1
                    nContent.title = "로컬 알림 메시지"
                    nContent.subtitle = "준비된 내용이 아주 많다!, 얼른 다시 앱을 열어주세요!!"
                    nContent.body = "앗! 왜나갔어요??, 어서 들어오세요!"
                    nContent.sound = UNNotificationSound.default
                    nContent.userInfo = ["name": "홍길동"]
                    
                    // 알림 발송 조건 객체
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    // 알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeUp", content: nContent, trigger: trigger)
                    
                    // 노티피케이션 센터에 추가
                    UNUserNotificationCenter.current().add(request)
                } else {
                    
                    print("사용자가 동의하지 않음!")
                }
            }
        } else {    // UILocationNotification 객체를 이용한 로컬 알림 (iOS 9 이하)
            
        }
    }
    
    // 앱 실행 도중에 알림 메시지가 도착한 경우
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        
        completionHandler([.alert, .badge, .sound])
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


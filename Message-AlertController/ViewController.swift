//
//  ViewController.swift
//  Message-AlertController
//
//  Created by JunHyuk on 2019/11/12.
//  Copyright © 2019 junhyuk. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    // Alert결과 알려주는 레이블.
    @IBOutlet var result: UILabel!
    
    // TextField, DatePicker 프로퍼티 선언.
    @IBOutlet weak var msg: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // 메시지 창을 처리하기 위한 적절한 위치
        
    }
    
    // 저장 메소드 선언.
    @IBAction func save(_ sender: UIButton) {
        
        if #available(iOS 10, *) {
            
            // UserNotification 프레임워크를 사용한 로컬 알림
            // 알림 동의 여부를 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    // 알림 설정이 들어갈 곳
                    
                    DispatchQueue.main.async {
                        // 알림 콘텐츠 정의
                        let nContent = UNMutableNotificationContent()
                        nContent.body = (self.msg.text)!
                        nContent.title = "미리 알림"
                        nContent.sound = UNNotificationSound.default
                        
                        // 발송 시각을 '지금으로부터 *초 형식으로 변환
                        let time = self.datePicker.date.timeIntervalSinceNow
                        // 발송 조건 정의
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        // 발송 요청 객체 정의
                        let request = UNNotificationRequest(identifier: "알람", content: nContent, trigger: trigger)
                        
                        // 노티피케이션 센터에 추가
                        UNUserNotificationCenter.current().add(request) { (_) in
                            DispatchQueue.main.async {
                                
                                // 발송 안내 메세지 창
                                let date = self.datePicker.date.addingTimeInterval(9*60*60)
                                let message = "알림이 등록되었습니다. 등록된 알림은 \(date)에 발송됩니다."
                                
                                let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                                let ok = UIAlertAction(title: "확인", style: .default)
                                alert.addAction(ok)
                                
                                self.present(alert, animated: false)
                            }
                            
                        }
                    }
                    
                    
                } else {
                    let alert = UIAlertController(title: "알림 등록", message: "알림이 허용되어 있지 않습니다.", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
                    return
                }
            }
        } else {
            
            // LocalNotification 객체를 사용한 로컬 알림
        }
        
        
    }
    
    
    
    @IBAction func alertButton(_ sender: UIButton) {
        
        // 메시지창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        // 확인 버튼 추가.
        let ok = UIAlertAction(title: "확인", style: .default)
        let exec = UIAlertAction(title: "실행", style: .destructive)
        let stop = UIAlertAction(title: "중지", style: .default)
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        // 메시지 창 실행
        self.present(alert, animated: false)
        
        print("메시지 얼럿창 구현 성공.")
    }
    
    // 새로운 메소드 구현.
    @IBAction func login(_ sender: UIButton) {
        
        let title = "iTunes Store에 로그인"
        let message = "사용자의 Apple ID sqlpro@naver.com를 입력하세요."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            
            // 확인 버튼을 탭했을 시 처리할 내용
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \(tf.text!)입니다.")
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 텍스트필드 추가
        alert.addTextField(configurationHandler: { (tf) in
            
            tf.placeholder = "암호" // 안내 메시지
            tf.isSecureTextEntry = true // 비밀번호 처리
            
        })
        self.present(alert, animated: false)
        
    }
    
    @IBAction func auth(_ sender: UIButton) {
        
        // 메시지 창 관련 객체 정의
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            // 확인 버튼을 탭 했을 때 실행할 내용
            
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
            if loginId == "sqlpro" && loginPw == "1234" {
                self.result.text = "인증되었습니다."
                
            } else {
                self.result.text = "인증에 실패하였습니다."
            }
            
            
        }
        
        // 정의 액션 버튼 객체를 메시지 창에 추가.
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 아이디 필드 추가
        alert.addTextField(configurationHandler: { (tf) in
            
            tf.placeholder = "아이디" // 미리 보여줄 안내 메시지
            tf.isSecureTextEntry = false // 입력시 *로 처리 안함
        })
        
        alert.addTextField(configurationHandler:  { (tf) in
            
            tf.placeholder = "비밀번호" // 미리 보여줄 안내 메시지
            tf.isSecureTextEntry = true // 입력시 *로 처리함
        })
        
        self.present(alert, animated: false)
    }
    
    
    
    
    


}


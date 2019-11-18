//
//  ViewController.swift
//  Message-AlertController
//
//  Created by JunHyuk on 2019/11/12.
//  Copyright © 2019 junhyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Alert결과 알려주는 레이블.
    @IBOutlet var result: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // 메시지 창을 처리하기 위한 적절한 위치
        
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
        let cancel = UIAlertAction(title: "cnlth", style: .cancel)
        
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
        }
        
        // 정의 액션 버튼 객체를 메시지 창에 추가.
        alert.addAction(cancel)
        alert.addAction(ok)
    }
    
    
    


}


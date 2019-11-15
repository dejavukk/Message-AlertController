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
    


}


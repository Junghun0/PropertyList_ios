//
//  ListViewController.swift
//  Property_List_ios
//
//  Created by 박정훈 on 18/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet var account: UITextField!
    
    var accountList = [
        "sdkfsdkas@naver.com",
        "asdizzz@naver.com",
        "abc1@naver.com",
        "abcaabc@naver.com",
        "zzzzzz@naver.com"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let picker = UIPickerView()
        
        //피커 뷰의 델리게이트 객체 지정
        picker.delegate = self
        //account 텍스트 필드 입력 방식을 가상 키보드 대신 피커뷰로 대체
        self.account.inputView = picker
        
        //@@ 가변 폭 버튼 정의
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        
        //툴바 객체 정의 (pickerview 상단에 사용할 툴바)
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 35)
        toolbar.barTintColor = UIColor.lightGray
        
        //액세서리 뷰 영역에 툴 바를 표시
        self.account.inputAccessoryView = toolbar
        
        //툴바에 들어갈 닫기 버튼
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone)
        
        //버튼을 툴바에 추가
        toolbar.setItems([flexSpace,done], animated: true)
    }
    
    @objc func pickerDone(_ sender: Any){
        self.view.endEditing(true)
    }
    
    //생성할 컴포넌트의 개수를 정의
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //지정된 컴포넌트가 가질 목록의 길이를 정의
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountList.count
    }
    //지정된 컴포넌트의 목록 각 행에 출력될 내용을 정의
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.accountList[row]
    }
    //지정된 컴포넌트의 목록 각 행을 사용자가 선택했을 때 실행할 액션
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //선택된 계정값을 텍스트 필드에 입력
        let account = self.accountList[row] //선택된 계정
        self.account.text = account
        
        //입력 뷰를 닫음
        //self.view.endEditing(true)
    }
}

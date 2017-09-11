//
//  YXWPhoneTextField.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/29.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWPhoneTextField: YXWLoginTextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(valueDidChange), for: .editingChanged)
        keyboardType = .numberPad
        placeholder = "请输入手机号"
    }
    
    func checkPhone() -> String? {
        if (text?.isEmpty)! {
            showAnnimation()
            return "手机号不能为空"
        } else if PhoneNumberIsValidated(vStr: text!) == false{
            showAnnimation()
            return "手机格式不正确"
        }else{
            return nil
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
//事件
extension YXWPhoneTextField {
    @objc fileprivate func valueDidChange() {
        
        let kMaxLength = 11
        var toBeString = text
        let lang = UIApplication.shared.textInputMode?.primaryLanguage
        if lang == "zh-Hans" {//中文输入
            let selectedRange = markedTextRange
            let positionx = position(from: (selectedRange?.start)!, offset: 0)
            
            if (positionx == nil) {
                if (toBeString?.characters.count)! > kMaxLength {
                    
                    let index = toBeString?.index((toBeString?.startIndex)!, offsetBy: kMaxLength)
                    text = toBeString?.substring(to: index!)
                }
            }
        }else{
            
            if (toBeString?.characters.count)! > kMaxLength {
                
                let index = toBeString?.index((toBeString?.startIndex)!, offsetBy: kMaxLength)
                text = toBeString?.substring(to: index!)
                
            }
        }
        
    }
}

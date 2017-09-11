//
//  YXWPwdTextField.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/29.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWPwdTextField: YXWLoginTextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(valueDidChange), for: .editingChanged)
        keyboardType = .asciiCapable
        isSecureTextEntry = true
        placeholder = "请输入密码"
        
    }
    
    func checkPwd() -> String? {
        if (text?.isEmpty)! {
            showAnnimation()
            return "密码不能为空"
        }else if PasswordIsValidated(vStr: text!) == false {
            showAnnimation()
            return "格式错误(6-15位数字字母组合)"
        }else{
            return nil
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
//事件
extension YXWPwdTextField{
    
    @objc fileprivate func valueDidChange() {
        
        let kMaxLength = 15
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

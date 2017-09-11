//
//  YXWValidationTextField.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWValidationTextField: YXWLoginTextField {
    
    fileprivate var second : NSInteger = 60
    fileprivate var timer : Timer?
    fileprivate var rightViewWidth : CGFloat = 0.0
    var vaDelegate : YXWValidationTextFieldDelegate?
    
    
    lazy var validationButton: UIButton = {
        let button = UIButton()
        button.setTitle("重新获取", for: .normal)
        button.setTitleColor(HexColor(hex: "#FFFFFF"), for: .normal)
        button.titleLabel?.font = Scale_Font(f: 14)
        button.addTarget(self, action: #selector(secondAction), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(valueDidChange), for: .editingChanged)
        keyboardType = .numberPad
        placeholder = "请输入验证码"
        
        
        rightView = validationButton
        rightViewMode = .always
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        validationButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(Scale_W(w: -13.2))
        }
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        rightViewWidth = rect.width * 0.5
        return CGRect.init(x: rect.origin.x - Scale_W(w: 13.2), y: rect.origin.y, width: rect.size.width, height: rect.size.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return CGRect.init(x: rect.origin.x + rightViewWidth , y: rect.origin.y, width: rect.size.width, height: rect.size.height)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return CGRect.init(x: rect.origin.x + rightViewWidth, y: rect.origin.y, width: rect.size.width, height: rect.size.height)
    }
    
    func checkValidationCode() -> String? {
        if (text?.isEmpty)! {
            showAnnimation()
            return "验证码不能为空"
        } else if text?.characters.count != 6 {
            showAnnimation()
            return "验证码格式错误"
        }else{
            return nil
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//事件
extension YXWValidationTextField {
    @objc fileprivate func valueDidChange() {
        
        let kMaxLength = 6
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
    
    @objc fileprivate func secondAction() {
        
        vaDelegate?.sendValidationCode()
        validationButton.isEnabled = false
        second = 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timerAction()
        
    }
    
    @objc fileprivate func timerAction() {
        
        if second == 0 {
            
            validationButton.isEnabled = true
            validationButton.setTitle("重新获取", for: .normal)
            timer?.invalidate()
            timer = nil
            
        } else {
            
            validationButton.setTitle("\(second)S", for: .normal)
            second -= 1
            
        }
    }
    
}


protocol YXWValidationTextFieldDelegate {
    
    func sendValidationCode()
}

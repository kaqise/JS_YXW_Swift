//
//  YXWConfirmAndRegisterController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWConfirmAndRegisterController: YXWBaseLoginController {
    
    //懒加载
    fileprivate lazy var treeIcon : UIImageView = { [unowned self] in
        let icon = UIImageView()
        icon.image = UIImage.init(named: "Login_treeIcon");
        return icon
        }()
    
    fileprivate lazy var inputPwdLB : UILabel = {//用户名输入框
        let label = UILabel()
        label.textColor = HexColor(hex: "#FFFFFF")
        label.font = Scale_Font(f: 20)
        label.text = "请输入密码"
        return label
    }()
    
    fileprivate lazy var pwdTextField: YXWPwdTextField = {//密码输入框
        let textField = YXWPwdTextField()
        textField.placeholder = "请输入密码"
        return textField
    }()
    
    fileprivate lazy var confirmPwdTextField: YXWPwdTextField = {//确认密码
        let textField = YXWPwdTextField()
        textField.placeholder = "请再次输入密码"
        return textField
    }()
    
    fileprivate lazy var registerButton: YXWLoginBaseButton = {
        let button = YXWLoginBaseButton()
        button.setTitle("注册", for: .normal)
        button.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var instruction: UILabel = {
        let label = UILabel()
        label.text = "密码格式为6至15位数字或字母组合"
        label.textColor = HexColor(hex: "##FFFFFF")
        label.font = Scale_Font(f: 12)
        return label
    }()
    
    
    fileprivate lazy var protocolLB: YXWUserProtocolLabel = {
        let label = YXWUserProtocolLabel()
        label.text = "注册即代表您同意用户协议"
        label.delegate = self
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
    }
}

//初始化
extension YXWConfirmAndRegisterController{
    
    fileprivate func setup() {
        
        //添加
        view.addSubview(treeIcon)
        view.addSubview(inputPwdLB)
        view.addSubview(pwdTextField)
        view.addSubview(confirmPwdTextField)
        view.addSubview(registerButton)
        view.addSubview(instruction)
        view.addSubview(protocolLB)
        
        //布局
        treeIcon.snp.makeConstraints { (make) in
            make.top.equalTo( Scale_H(h: 76) )
            make.centerX.equalTo(view)
        }
        
        inputPwdLB.snp.makeConstraints { (make) in
            make.top.equalTo(treeIcon.snp.bottom).offset(Scale_H(h: 29.7))
            make.height.equalTo(Scale_H(h: 28))
            make.centerX.equalTo(view)
        }
        
        pwdTextField.snp.makeConstraints { (make) in
            make.top.equalTo(inputPwdLB.snp.bottom).offset(Scale_H(h: 21))
            make.left.equalTo(Scale_W(w: 53))
            make.right.equalTo(Scale_W(w: -53))
            make.height.equalTo(Scale_H(h: 50))
        }
        
        confirmPwdTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwdTextField.snp.bottom).offset(Scale_H(h: 18))
            make.left.equalTo(Scale_W(w: 53))
            make.right.equalTo(Scale_W(w: -53))
            make.height.equalTo(Scale_H(h: 50))
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(confirmPwdTextField.snp.bottom).offset(Scale_H(h: 16))
            make.left.right.height.equalTo(confirmPwdTextField)
        }
        
        instruction.snp.makeConstraints { (make) in
            make.top.equalTo(registerButton.snp.bottom).offset(Scale_H(h: 8))
            make.left.equalTo(Scale_W(w: 70))
            make.height.equalTo(Scale_H(h: 17))
        }
        
        protocolLB.snp.makeConstraints { (make) in
            make.bottom.equalTo(Scale_H(h: -19))
            make.centerX.equalTo(view)
            make.height.equalTo(14)
        }
        
    }
}

//事件处理
extension YXWConfirmAndRegisterController{
    //注册
    @objc fileprivate func registerButtonAction() {
        
        if let message : String = pwdTextField.checkPwd() {
            
            MYLog(message: message)
        } else if pwdTextField.text != confirmPwdTextField.text {
            
            confirmPwdTextField.showAnnimation()
            MYLog(message: "两次输入的密码不同,请重新输入")
        }else{
            
            MYLog(message: "注册成功")
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

//代理方法
extension YXWConfirmAndRegisterController : YXWUserProtocolLabelDelegate{
    
    func protocolAction() {
        MYLog(message: "点击了协议")
    }
    
}

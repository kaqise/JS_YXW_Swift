//
//  YXWLoginViewController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/25.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWLoginViewController: YXWBaseLoginController {
    
    //懒加载
    fileprivate lazy var treeIcon : UIImageView = { [unowned self] in
        let icon = UIImageView()
        icon.image = UIImage.init(named: "Login_treeIcon");
        return icon
    }()
    
    fileprivate lazy var userBtn: YXWLoginPortButton = {//用户端按钮
        let user = YXWLoginPortButton()
        user.setTitle("普通用户", for: .normal)
        user.addTarget(self, action: #selector(userPortAction(sender:)), for: .touchUpInside)
        user.isSelected = true
        return user
    }()
    
    fileprivate lazy var doctorBtn: YXWLoginPortButton = {//医生端按钮
        let doctor = YXWLoginPortButton()
        doctor.setTitle("专家用户", for: UIControlState.normal)
        doctor.addTarget(self, action: #selector(doctorPortAction), for: .touchUpInside)
        return doctor
    }()
    
    
    fileprivate lazy var phoneTextField : YXWPhoneTextField = {//用户名输入框
        let textField = YXWPhoneTextField()
        return textField
    }()
    
    fileprivate lazy var pwdTextField: YXWPwdTextField = {//密码输入框
        let textField = YXWPwdTextField()
        return textField
    }()
    
    fileprivate lazy var loginButton: YXWLoginBaseButton = {
        let button = YXWLoginBaseButton()
        button.setTitle("登录", for: .normal)
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = HexColor(hex: "#FFFFFF")
        return line
    }()
    
    fileprivate lazy var forgetPwdButton: UIButton = {
        let button = UIButton()
        button.setTitle("忘记密码", for: .normal)
        button.addTarget(self, action: #selector(forginPwdAction), for: .touchUpInside)
        button.setTitleColor(HexColor(hex: "#FFFFFF"), for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.titleLabel?.font = Scale_Font(f: 12)
        return button
    }()
    
    fileprivate lazy var registButton: UIButton = {
        let button = UIButton()
        button.setTitle("注册账户", for: .normal)
        button.addTarget(self, action: #selector(registAction), for: .touchUpInside)
        button.setTitleColor(HexColor(hex: "#FFFFFF"), for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.titleLabel?.font = Scale_Font(f: 12)
        return button
    }()
    
    fileprivate lazy var protocolLB: YXWUserProtocolLabel = {
        let label = YXWUserProtocolLabel()
        label.text = "点击登录,即代表您同意用户协议"
        label.delegate = self
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    
}

//初始化
extension YXWLoginViewController{
    
    fileprivate func setup() {
        
        //添加
        view.addSubview(treeIcon)
        view.addSubview(userBtn)
        view.addSubview(doctorBtn)
        view.addSubview(phoneTextField)
        view.addSubview(pwdTextField)
        view.addSubview(loginButton)
        view.addSubview(line)
        view.addSubview(forgetPwdButton)
        view.addSubview(registButton)
        view.addSubview(protocolLB)
        
        //布局
        treeIcon.snp.makeConstraints { (make) in
            make.top.equalTo( Scale_H(h: 76) )
            make.centerX.equalTo(view)
        }
        
        userBtn.snp.makeConstraints { (make) in
            make.top.equalTo(treeIcon.snp.bottom).offset(Scale_H(h: 42.9))
            make.left.equalTo(Scale_W(w: 105))
            make.height.equalTo(Scale_H(h: 17))
        }
        
        doctorBtn.snp.makeConstraints { (make) in
            make.right.equalTo(Scale_W(w: -105))
            make.width.height.top.equalTo(userBtn)
            make.left.equalTo(userBtn.snp.right)
        }
        
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(userBtn.snp.bottom).offset(Scale_H(h: 18))
            make.left.equalTo(Scale_W(w: 53))
            make.right.equalTo(Scale_W(w: -53))
            make.height.equalTo(Scale_H(h: 50))
        }
        
        pwdTextField.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom).offset(Scale_H(h: 16))
            make.left.right.height.equalTo(phoneTextField)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwdTextField.snp.bottom).offset(Scale_H(h: 16))
            make.left.right.height.equalTo(phoneTextField)
        }
        
        line.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(Scale_H(h: 15))
            make.height.equalTo(Scale_H(h: 17))
            make.width.equalTo(1)
            make.centerX.equalTo(view)
        }
        
        forgetPwdButton.snp.makeConstraints { (make) in
            make.right.equalTo(line.snp.left).offset(Scale_W(w: -5))
            make.centerY.height.equalTo(line)
        }
        
        registButton.snp.makeConstraints { (make) in
            make.left.equalTo(line.snp.right).offset(Scale_W(w: 5))
            make.centerY.height.equalTo(line)
        }
        
        protocolLB.snp.makeConstraints { (make) in
            make.bottom.equalTo(Scale_H(h: -19))
            make.centerX.equalTo(view)
            make.height.equalTo(14)
        }
    }
    
}

//事件处理
extension YXWLoginViewController{
    //用户端
    @objc fileprivate func userPortAction(sender : YXWLoginPortButton){
        
        if sender.isSelected == false {
            
            sender.isSelected = true
            sender.showAnnimation()
            self.doctorBtn.isSelected = false
            
        }
        
    }
    //医生端
    @objc fileprivate func doctorPortAction(sender : YXWLoginPortButton){
        
        if sender.isSelected == false {
            
            sender.isSelected = true
            sender.showAnnimation()
            self.userBtn.isSelected = false
            
        }
        
    }
    //登录
    @objc fileprivate func loginAction() {
        
//        if let message : String = phoneTextField.checkPhone() {
//            MYLog(message: message)
//        } else if let message : String = pwdTextField.checkPwd(){
//            MYLog(message: message)
//        }else{
//            MYLog(message: "登录成功")
//            
//            UIApplication.shared.keyWindow?.rootViewController = YXWUserPortBaseTabBarController()
//        }
        UIApplication.shared.keyWindow?.rootViewController = YXWUserPortBaseTabBarController()

    }
    //忘记密码
    @objc fileprivate func forginPwdAction() {
        MYLog(message: "忘记密码")
        
        let forget = YXWForgetPwdViewController()
        navigationController?.pushViewController(forget, animated: true)
        
    }
    //注册账户
    @objc fileprivate func registAction() {
        MYLog(message: "注册账户")
        
        let register = YXWRegisterViewController()
        navigationController?.pushViewController(register, animated: true)
        
    }
}

//代理方法
extension YXWLoginViewController : YXWUserProtocolLabelDelegate{
    
    func protocolAction() {
        MYLog(message: "点击了协议")
    }
    
}




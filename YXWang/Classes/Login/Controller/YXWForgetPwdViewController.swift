//
//  YXWForgetPwdViewController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/29.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWForgetPwdViewController: YXWBaseLoginController {
    
    //懒加载
    fileprivate lazy var treeIcon : UIImageView = { [unowned self] in
        let icon = UIImageView()
        icon.image = UIImage.init(named: "Login_treeIcon");
        return icon
        }()
    
    fileprivate lazy var inputPhone : UILabel = {//用户名输入框
        let label = UILabel()
        label.textColor = HexColor(hex: "#FFFFFF")
        label.font = Scale_Font(f: 20)
        label.text = "输入手机号码"
        return label
    }()
    
    fileprivate lazy var phoneTextField : YXWPhoneTextField = {//用户名输入框
        let textField = YXWPhoneTextField()
        return textField
    }()
    
    fileprivate lazy var nextStepButton: YXWLoginBaseButton = {
        let button = YXWLoginBaseButton()
        button.setTitle("下一步", for: .normal)
        button.addTarget(self, action: #selector(nextStepAction), for: .touchUpInside)
        return button
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
extension YXWForgetPwdViewController{
    
    fileprivate func setup() {
        
        //添加
        view.addSubview(treeIcon)
        view.addSubview(inputPhone)
        view.addSubview(phoneTextField)
        view.addSubview(nextStepButton)
        view.addSubview(protocolLB)
        
        //布局
        treeIcon.snp.makeConstraints { (make) in
            make.top.equalTo( Scale_H(h: 76) )
            make.centerX.equalTo(view)
        }
        
        inputPhone.snp.makeConstraints { (make) in
            make.top.equalTo(treeIcon.snp.bottom).offset(Scale_H(h: 29.7))
            make.height.equalTo(Scale_H(h: 28))
            make.centerX.equalTo(view)
        }
        
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(inputPhone.snp.bottom).offset(Scale_H(h: 21))
            make.left.equalTo(Scale_W(w: 53))
            make.right.equalTo(Scale_W(w: -53))
            make.height.equalTo(Scale_H(h: 50))
        }
        
        nextStepButton.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom).offset(Scale_H(h: 18))
            make.left.equalTo(Scale_W(w: 53))
            make.right.equalTo(Scale_W(w: -53))
            make.height.equalTo(Scale_H(h: 50))
        }
        
        protocolLB.snp.makeConstraints { (make) in
            make.bottom.equalTo(Scale_H(h: -19))
            make.centerX.equalTo(view)
            make.height.equalTo(14)
        }
        
    }
}

//事件处理
extension YXWForgetPwdViewController{
    
    //下一步
    @objc fileprivate func nextStepAction() {
        
        if let message : String = phoneTextField.checkPhone() {
            MYLog(message: message)
        }else{
            MYLog(message: "下一步")
            
            let resetPwd = YXWResetPasswordController()
            navigationController?.pushViewController(resetPwd, animated: true)
            
        }
        
    }
    
}

//代理方法
extension YXWForgetPwdViewController : YXWUserProtocolLabelDelegate{
    
    func protocolAction() {
        MYLog(message: "点击了协议")
    }
    
}

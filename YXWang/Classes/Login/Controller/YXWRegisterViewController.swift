//
//  YXWRegisterViewController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/29.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWRegisterViewController: YXWBaseLoginController {
    
    //懒加载
    fileprivate lazy var treeIcon : UIImageView = { [unowned self] in
        let icon = UIImageView()
        icon.image = UIImage.init(named: "Login_TreeIcon_small");
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
extension YXWRegisterViewController{
    
    fileprivate func setup() {
        
        //添加
        view.addSubview(treeIcon)
        view.addSubview(userBtn)
        view.addSubview(doctorBtn)
        view.addSubview(phoneTextField)
        view.addSubview(nextStepButton)
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
        
        nextStepButton.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom).offset(Scale_H(h: 16))
            make.left.right.height.equalTo(phoneTextField)
        }
        
        protocolLB.snp.makeConstraints { (make) in
            make.bottom.equalTo(Scale_H(h: -19))
            make.centerX.equalTo(view)
            make.height.equalTo(14)
        }
        
        
    }
    
}

//事件处理
extension YXWRegisterViewController{
    //用户端
    func userPortAction(sender : YXWLoginPortButton){
        
        if sender.isSelected == false {
            
            sender.isSelected = true
            sender.showAnnimation()
            self.doctorBtn.isSelected = false
            
        }
        
    }
    //医生端
    func doctorPortAction(sender : YXWLoginPortButton){
        
        if sender.isSelected == false {
            
            sender.isSelected = true
            sender.showAnnimation()
            self.userBtn.isSelected = false
            
        }
        
    }
    
    //下一步
    func nextStepAction() {
        
        if let message : String = phoneTextField.checkPhone() {
            MYLog(message: message)
        }else{
            MYLog(message: "下一步")
            
            let validation = YXWValidationViewController()
            validation.phoneNum = phoneTextField.text
            navigationController?.pushViewController(validation, animated: true)
        }
        
    }
    
    
}

//代理方法
extension YXWRegisterViewController : YXWUserProtocolLabelDelegate{
    
    func protocolAction() {
        MYLog(message: "点击了协议")
    }
    
}

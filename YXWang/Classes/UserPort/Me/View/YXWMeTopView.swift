//
//  YXWMeTopView.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/31.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWMeTopView: UIView {

    var imageUrl : String? {
        
        didSet{
            
        }
    }
    var nickName : String? {
        
        didSet{
            nameLabel.text = nickName
        }
    }
    var phoneNum : String? {
        
        didSet{
            phoneLabel.text = phoneNum
        }
    }
    
    fileprivate lazy var backImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "")
        return imageView
    }()
    
    fileprivate lazy var headerIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    
    fileprivate lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "张三"
        label.textColor = HexColor(hex: "#FFFFFF")
        label.font = Scale_Font(f: 16)
        return label
    }()
    
    fileprivate lazy var phoneLabel : UILabel = {
        let label = UILabel()
        label.textColor = HexColor(hex: "#FFFFFF")
        label.font = Scale_Font(f: 16)
        label.text = "13881813323"
        return label
    }()
    
    fileprivate lazy var bottomView : YXWShadowView = {
        let view = YXWShadowView()
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let subLayer = CALayer()
        subLayer.frame = CGRect(x: 0, y: 0, width: Screen_W, height: Scale_H(h: 139))
        subLayer.contents = UIImage.init(named: "Me_TopViewBG")?.cgImage
        
        let maskLayer = CALayer()
        maskLayer.frame = subLayer.bounds
        maskLayer.backgroundColor = HexColor(hex: "#26AE60").cgColor
        maskLayer.opacity = 0.5
        subLayer.addSublayer(maskLayer)
        
        layer.addSublayer(subLayer)
        
        initUI()
        
        let bottomLayer = CALayer()
        bottomLayer.backgroundColor = UIColor.white.cgColor
        bottomLayer.frame = CGRect(x: 0, y: Scale_H(h: 192), width: Screen_W, height: Scale_H(h: 1))
        bottomLayer.shadowColor = HexColor(hex: "#26AE60").cgColor
        bottomLayer.shadowRadius = 3
        bottomLayer.shadowOpacity = 0.6
        layer.addSublayer(bottomLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupFrame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension YXWMeTopView{
    
    //创建
    fileprivate func initUI() {
        
        addSubview(headerIcon)
        addSubview(nameLabel)
        addSubview(phoneLabel)
        addSubview(bottomView)
        
    }
    //约束
    fileprivate func setupFrame() {
        
        headerIcon.snp.makeConstraints { (make) in
            make.top.equalTo(Scale_H(h: 47))
            make.left.equalTo(Scale_W(w: 19))
            make.height.width.equalTo(Scale_H(h: 64))
        }
        headerIcon.layer.cornerRadius = Scale_H(h: 32)
        headerIcon.layer.masksToBounds = true
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerIcon.snp.right).offset(Scale_W(w: 20))
            make.top.equalTo(headerIcon.snp.top).offset(Scale_H(h: 7))
            make.height.equalTo(Scale_H(h: 22))
        }
        
        phoneLabel.snp.makeConstraints { (make) in
            make.left.height.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(Scale_H(h: 7))
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(self)
            make.width.equalTo(Scale_W(w: 289))
            make.height.equalTo(Scale_H(h: 74))
        }
        
    }
}

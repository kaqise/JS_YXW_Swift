//
//  YXWShadowView.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/31.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWShadowView: UIView {
    
    fileprivate lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.text = "120"
        label.textColor = HexColor(hex: "#333333")
        label.font = Scale_Font(f: 18)
        return label
    }()
    
    fileprivate lazy var messageLabel : UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textColor = HexColor(hex: "#333333")
        label.font = Scale_Font(f: 18)
        return label
    }()
    
    fileprivate lazy var priceTitle : UILabel = {
        let label = UILabel()
        label.text = "余额"
        label.textColor = HexColor(hex: "#666666")
        label.font = Scale_Font(f: 15)
        return label
    }()
    
    fileprivate lazy var messageTitle : UILabel = {
        let label = UILabel()
        label.text = "消息"
        label.textColor = HexColor(hex: "#666666")
        label.font = Scale_Font(f: 15)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let rect = CGRect(x: 0, y: 0, width: Scale_W(w: 289), height: Scale_H(h: 74))
        
        var backGroundImage : UIImage
        
        UIGraphicsBeginImageContext(rect.size)
        let bezi = UIBezierPath.init(roundedRect: rect, byRoundingCorners: [.topLeft , .topRight] , cornerRadii: CGSize(width: Scale_H(h: 8), height: Scale_H(h: 8)))
        
        UIColor.white.setFill()
        bezi.fill()
        
        backGroundImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        layer.contents = backGroundImage.cgImage
        layer.shadowColor = HexColor(hex: "#26AE60").cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.2
        
        initUI()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupFrame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension YXWShadowView{
    
    fileprivate func initUI() {
        addSubview(priceLabel)
        addSubview(messageLabel)
        addSubview(priceTitle)
        addSubview(messageTitle)
    }
    
    fileprivate func setupFrame() {
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(Scale_H(h: 19))
            make.centerX.equalTo(self.snp.left).offset(Scale_W(w: 63.5))
            make.height.equalTo(Scale_H(h: 25))
        }
        
        priceTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(priceLabel)
            make.height.equalTo(Scale_H(h: 21))
            make.top.equalTo(priceLabel.snp.bottom)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(Scale_H(h: 19))
            make.centerX.equalTo(self.snp.right).offset(Scale_W(w: -63.5))
            make.height.equalTo(Scale_H(h: 25))
        }
        
        messageTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(messageLabel)
            make.height.equalTo(Scale_H(h: 21))
            make.top.equalTo(messageLabel.snp.bottom)
        }
    }
    
    
}


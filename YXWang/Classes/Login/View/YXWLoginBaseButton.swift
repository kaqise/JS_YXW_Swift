//
//  YXWLoginBaseButton.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/29.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWLoginBaseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundImage(UIImage.init(named: "Login_ButtonImage"), for: .normal)
        setTitleColor(HexColor(hex: "#FFFFFF"), for: .normal)
        titleLabel?.font = Scale_Font(f: 14)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.masksToBounds = true
        layer.cornerRadius = Scale_H(h: 25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

//
//  YXWLoginPortButton.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/26.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWLoginPortButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage.init(named: "Login_portIcon_default"), for: UIControlState.normal)
        
        setImage(UIImage.init(named: "Login_portIcon_selected"), for: UIControlState.selected)
        
        adjustsImageWhenHighlighted = false
        
        titleLabel?.font = Scale_Font(f: 12)
        
        setTitleColor(HexColor(hex: "#E4E4E4"), for: .normal)
        
        imageEdgeInsets = UIEdgeInsetsMake(0, Scale_W(w: -3), 0, 0)
        titleEdgeInsets = UIEdgeInsetsMake(0, Scale_W(w: 3), 0, 0)
        
        
    }
    
    func showAnnimation() {
        let keyAnnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyAnnimation.values = [1.0 , 1.1 , 1.0]
        keyAnnimation.duration = 0.25
        keyAnnimation.isRemovedOnCompletion = true
        layer.add(keyAnnimation, forKey: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

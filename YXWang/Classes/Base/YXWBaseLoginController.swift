//
//  YXWBaseLoginController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/25.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWBaseLoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.view.layer.contents = UIImage.init(named:"Login_BG")?.cgImage
        
    }
   
}

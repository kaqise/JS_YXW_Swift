//
//  AppDelegate+extension.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/25.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import Foundation

extension AppDelegate{
    
    //配置App
    func yxw_setApp() {
        
        UIApplication.shared.setStatusBarHidden(false, with: UIStatusBarAnimation.fade)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
    }
    
    // 添加主控制器
    func yxw_addRootController() {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = YXWLoginNavigationController.init(rootViewController: YXWLoginViewController())
        
    }
}

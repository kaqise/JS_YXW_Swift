//
//  YXWUserPortBaseTabBarController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWUserPortBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarItem.appearance()
        
        var textAttrs_default : [String : AnyObject] = Dictionary()
        textAttrs_default[NSFontAttributeName] = UIFont.systemFont(ofSize: 10)
        textAttrs_default[NSForegroundColorAttributeName] = HexColor(hex: "#FFFFFF")
        
        var textAttrs_selected : [String : AnyObject] = Dictionary()
        textAttrs_selected[NSFontAttributeName] = UIFont.systemFont(ofSize: 10)
        textAttrs_selected[NSForegroundColorAttributeName] = HexColor(hex: "#062C31")
        
        appearance.setTitleTextAttributes(textAttrs_default, for: .normal)
        appearance.setTitleTextAttributes(textAttrs_selected, for: .selected)
        appearance.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -3)
        
        UITabBar.appearance().backgroundImage = UIImage.init(named: "Navigation_BackImage")
        
        addChildViewControllers()
        
        
    }
    
    //添加子控制器
    private func addChildViewControllers(){
        addChildViewController(controller: YXWHealthCategoryController(), title: "健康分类", imageName: "TabBarHeal")
        addChildViewController(controller: YXWInspectionReportController(), title: "检查报告", imageName: "TabBarReport")
        addChildViewController(controller: YXWLeadingExpertController(), title: "知名专家", imageName: "TabBarExpert")
        addChildViewController(controller: YXWUserPortMeController(), title: "我的", imageName: "TabBarMe")
    }
    
    private func addChildViewController(controller: UIViewController, title:String, imageName:String){
        
        controller.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_Selected")?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.imageInsets = UIEdgeInsetsMake(-5, 0, 5, 0)
        controller.tabBarItem.title = title
        
        let nav = YXWBaseNavigationController()
        nav.addChildViewController(controller)
        addChildViewController(nav)
    }

}



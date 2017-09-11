//
//  YXWHealthCategoryController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit
import LLCycleScrollView

class YXWHealthCategoryController: YXWBaseController {
    
    fileprivate lazy var loopView: LLCycleScrollView = {
        
        let loop = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 0, width: Screen_W, height: Scale_H(h: 170.5)))
        
        loop.autoScroll = true
        
        // 是否无限循环，此属性修改了就不存在轮播的意义了 😄
        loop.infiniteLoop = true
        
        // 滚动间隔时间(默认为2秒)
        loop.autoScrollTimeInterval = 3.0
        
        // 等待数据状态显示的占位图
//        loop.placeHolderImage = #UIImage
        
        // 如果没有数据的时候，使用的封面图
//        loop.coverImage = #UIImage
        
        // 设置图片显示方式=UIImageView的ContentMode
        loop.imageViewContentMode = .scaleToFill
        
        // 设置滚动方向（ vertical || horizontal ）
        loop.scrollDirection = .vertical
        
        // 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
        loop.customPageControlStyle = .snake
        
        // 非.system的状态下，设置PageControl的tintColor
        loop.customPageControlInActiveTintColor = UIColor.red
        
        // 设置.system系统的UIPageControl当前显示的颜色
        loop.pageControlCurrentPageColor = UIColor.white
        
        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        loop.customPageControlIndicatorPadding = 8.0
        
        // 设置PageControl的位置 (.left, .right 默认为.center)
        loop.pageControlPosition = .center
        
        return loop
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNaviBar()
    }

    

}

//导航设置
extension YXWHealthCategoryController{
    fileprivate func setupNaviBar() {
        title = "健康分类"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_scanfIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(scanfAction))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_message")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(messageAction))
    }
}

//事件
extension YXWHealthCategoryController{
    
    @objc fileprivate func scanfAction() {
        MYLog(message: "二维码")
    }
    
    @objc fileprivate func messageAction() {
        MYLog(message: "消息")
    }
}

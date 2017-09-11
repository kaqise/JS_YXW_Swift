//
//  Common.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/25.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import Foundation
import SnapKit

let Screen_H = UIScreen.main.bounds.size.height
let Screen_W = UIScreen.main.bounds.size.width

func Scale_W( w : CGFloat) -> CGFloat {
    return UIScreen.main.bounds.size.width / 375 * w
}

func Scale_H( h : CGFloat) -> CGFloat {
    return UIScreen.main.bounds.size.height / 667 * h
}

func Scale_Font( f : CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: Scale_H(h: f))
}

func MYLog<T> (message: T, fileName: String = #file, funcName: String = #function, lineNum: Int = #line) {
    
    #if DEBUG
        
        let file = (fileName as NSString).lastPathComponent
        
        print("\(file):\(funcName):\(lineNum):\("打印内容"):\(message)")
        
    #endif
    
}

func HexColor( hex : String) -> UIColor {
    
    var cString = hex.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    let length = (cString as NSString).length
    //错误处理
    if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
        return UIColor.white
    }
    
    if cString.hasPrefix("#"){
        cString = (cString as NSString).substring(from: 1)
    }
    
    //字符chuan截取
    var range = NSRange()
    range.location = 0
    range.length = 2
    
    let rString = (cString as NSString).substring(with: range)
    
    range.location = 2
    let gString = (cString as NSString).substring(with: range)
    
    range.location = 4
    let bString = (cString as NSString).substring(with: range)
    
    //存储转换后的数值
    var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
    //进行转换
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    //根据颜色值创建UIColor
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
}




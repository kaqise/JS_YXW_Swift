//
//  YXWUserProtocolLabel.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/29.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWUserProtocolLabel: UILabel {
    
    fileprivate var textStorage : NSTextStorage?
    fileprivate var layoutManager : NSLayoutManager?
    fileprivate var textContainer : NSTextContainer?
    fileprivate var selectRect : CGRect?
    fileprivate var isTouching = Bool()
    var delegate : YXWUserProtocolLabelDelegate?
    
    override var text: String? {//重写set方法
        didSet{
            perpareText()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isUserInteractionEnabled = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch : UITouch = touches.first!
        
        let point : CGPoint = touch.location(in: self)
        
        
        if selectRect?.contains(point) == true {
            
            let attText = NSMutableAttributedString(attributedString: attributedText!)
            attText.addAttribute(NSForegroundColorAttributeName , value: UIColor.gray , range: NSRange.init(location: attText.length - 4, length: 4))
            attributedText = attText
            isTouching = true
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isTouching == true {
            
            let attText = NSMutableAttributedString(attributedString: attributedText!)
            attText.addAttribute(NSForegroundColorAttributeName , value: HexColor(hex: "#FFFFFF") , range: NSRange.init(location: attText.length - 4, length: 4))
            attributedText = attText
            
            delegate?.protocolAction()
            
            isTouching = false
            
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension YXWUserProtocolLabel{
    
    @objc fileprivate func perpareText() {
        
        let attributeText : NSMutableAttributedString = NSMutableAttributedString(string: text!, attributes: [NSForegroundColorAttributeName : HexColor(hex: "#D1D4D6") , NSFontAttributeName : Scale_Font(f: 12)])
        
        let attributes : [String : Any] = [NSForegroundColorAttributeName : HexColor(hex: "#FFFFFF") , NSUnderlineStyleAttributeName : 1]
        
        let range = NSRange(location: attributeText.length - 4, length: 4)
        
        attributeText.addAttributes(attributes, range: range)
        
        attributedText = attributeText
        
        setupBasic()
        
        setupBasic(attributeText: attributeText)
        
        selectRect = characterRect(range: range)
    }
    
    @objc fileprivate func setupBasic() {
        
        textStorage = NSTextStorage()
        layoutManager = NSLayoutManager()
        textContainer = NSTextContainer()
        
        textStorage?.addLayoutManager(layoutManager!)
        layoutManager?.addTextContainer(textContainer!)
        
    }
    
    
    @objc fileprivate func setupBasic(attributeText : NSAttributedString) {
        
        let rect =  attributeText.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: Scale_H(h: 14)), options: .usesLineFragmentOrigin, context: nil)
        
        textContainer?.size = rect.size
        textContainer?.lineFragmentPadding = 0
        
        textStorage?.setAttributedString(attributeText)
        
    }
    
    @objc fileprivate func characterRect(range : NSRange) -> CGRect {
        
        let glyphRange = layoutManager?.glyphRange(forCharacterRange: range, actualCharacterRange: nil)
        
        let rect = (layoutManager?.boundingRect(forGlyphRange: glyphRange!, in: textContainer!))!
        
        return CGRect.init(x: rect.origin.x - 5, y: rect.origin.y - 5, width: rect.size.width + 10, height: rect.size.height + 10)
        
    }
    
    
}

protocol YXWUserProtocolLabelDelegate {
    
    func protocolAction()
}

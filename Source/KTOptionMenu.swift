//
//  Created by Kamal Trapasiya
//

import UIKit

var parentView = UIView()
var mainAction: ((Int) -> Void)?

public extension UIViewController {
    
    func KTOptionMenu(sender:UIButton,options:[String], action: @escaping (Int) -> Void) {
        
        parentView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        let dismissButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        dismissButton.addTarget(self, action: #selector(dissmissViewAction), for: .touchUpInside)
        parentView.addSubview(dismissButton)
        let buttonLocation = sender.convert(sender.bounds, to: self.view)
        
        let lblWidth = options.map { UILabel.textWidth(font: UIFont.systemFont(ofSize: 15), text: $0) }
        let maxWidth = lblWidth.max()! + 32
        
        
        let mainView = UIView()
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        mainView.layer.cornerRadius = 5
        
        let contentHeight = CGFloat(50 * options.count)
        scrollView.contentSize.height = contentHeight
        var x = CGFloat()
        let xw = buttonLocation.origin.x + sender.frame.width + maxWidth
        if xw < self.view.frame.width {
            x = buttonLocation.origin.x
        }
        else if xw >= self.view.frame.width {
            x = buttonLocation.origin.x + sender.frame.width - maxWidth
        }
        
        var y = CGFloat()
        
        if buttonLocation.origin.y < 3 * (self.view.frame.height/4) {
            y = buttonLocation.origin.y
        }
        else {
            y = buttonLocation.origin.y + sender.frame.height - contentHeight
        }
        
        var height = CGFloat()
        if y + contentHeight > self.view.frame.height {
            height = self.view.frame.height - y - 50
            mainView.frame = CGRect.init(x: x, y: y, width: maxWidth, height: height)
        }
        else if y < 50 {
            y = 50
            height = buttonLocation.origin.y - y + sender.frame.height
            mainView.frame = CGRect.init(x: x, y: y, width: maxWidth, height: height)
        }
        else {
            height = contentHeight
            mainView.frame = CGRect.init(x: x, y: y, width: maxWidth, height: contentHeight)
        }
        
        scrollView.frame = CGRect.init(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height)
        

        mainView.backgroundColor = UIColor.white
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize.zero
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.masksToBounds = false
        
        for i in 0..<options.count {
            
            let button = UIButton.init(frame: CGRect.init(x: 16, y: 50 * i, width: (Int(maxWidth) - 32), height: 50))
            
            if i < options.count - 1 {
                
                let thickness: CGFloat = 0.3
                let bottomBorder = CALayer()
                bottomBorder.frame = CGRect(x:0, y: button.frame.size.height - thickness, width: button.frame.size.width, height:thickness)
                bottomBorder.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
                button.layer.addSublayer(bottomBorder)
            }
            
            button.setTitleColor(.black, for: .normal)
            button.setTitle(options[i], for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.contentHorizontalAlignment = .left
            button.tag = i
            mainAction = action
            button.addTarget(self, action: #selector(didPress(_:)), for: .touchUpInside)
            scrollView.addSubview(button)
        }
        
        //mainView.clipsToBounds = true
        mainView.addSubview(scrollView)
        parentView.addSubview(mainView)
        self.view.addSubview(parentView)
        
        _ = mainView.subviews.map { $0.isHidden = true }
        mainView.frame = CGRect.init(x: (buttonLocation.origin.x) + 32, y: buttonLocation.origin.y, width: 0, height: 0)
        UIView.animate(withDuration: 0.2) {
            mainView.frame = CGRect.init(x: x, y: y, width: maxWidth, height: height)
        } completion: { succ in
            _ = mainView.subviews.map { $0.isHidden = false }
        }
        parentView.isHidden = false
    }
    
    @objc func didPress(_ sender:UIButton) {
        dismissOptionMenu()
        mainAction?(sender.tag)
    }
    
    func dismissOptionMenu() {
        for view in parentView.subviews {
            view.removeFromSuperview()
        }
        parentView.isHidden = true
    }
    
    @objc func dissmissViewAction() {
        dismissOptionMenu()
    }
}

extension UILabel {
    func textWidth() -> CGFloat {
        return UILabel.textWidth(label: self)
    }
    
    class func textWidth(label: UILabel) -> CGFloat {
        return textWidth(label: label, text: label.text!)
    }
    
    class func textWidth(label: UILabel, text: String) -> CGFloat {
        return textWidth(font: label.font, text: text)
    }
    
    class func textWidth(font: UIFont, text: String) -> CGFloat {
        let myText = text as NSString
        
        let rect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(labelSize.width)
    }
}



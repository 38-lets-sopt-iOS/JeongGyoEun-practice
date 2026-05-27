//
//  UIView+.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/29/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

extension UITextField {
    func addLeftPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    func addRightPadding(_ width: CGFloat = 20) {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
           self.rightView = paddingView
           self.rightViewMode = ViewMode.always
       }
}

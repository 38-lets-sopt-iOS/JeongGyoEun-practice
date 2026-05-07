//
//  UIFont+Extension.swift
//  
//
//  Created by 정교은 on 4/24/26.
//
import UIKit

extension UIFont {
    
    static func pretendard(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "Pretendard"
        let weightString: String
        
        switch weight {
        case .black:
            weightString = "Black"
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Regular"
        }
        
        return UIFont(name: "\(familyName)-\(weightString)", size: size)
        ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    static let head1 = UIFont.pretendard(size: 30, weight: .semibold)
    static let head2 = UIFont.pretendard(size: 23, weight: .semibold)
    static let head3 = UIFont.pretendard(size: 20, weight: .semibold)
    
    static let subhead1 = UIFont.pretendard(size: 18, weight: .semibold)
    static let subhead2 = UIFont.pretendard(size: 15, weight: .semibold)
    static let subhead3 = UIFont.pretendard(size: 12, weight: .semibold)
    
    static let medium = UIFont.pretendard(size: 18, weight: .medium)
    
    static let body1 = UIFont.pretendard(size: 12, weight: .medium)
    static let body2 = UIFont.pretendard(size: 12, weight: .regular)
    
    static let cap1 = UIFont.pretendard(size: 12, weight: .light)
}

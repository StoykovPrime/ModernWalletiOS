//
//  FormController.swift
//  ModernMoney
//
//  Created by Nacho Nachev on 28.11.17.
//  Copyright © 2017 Lykkex. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import TextFieldEffects

protocol FormController {
    
    var formViews: [UIView] { get }
    
    var canGoBack: Bool { get }
    
    var buttonTitle: String? { get }
    
    var next: FormController? { get }
    
    var segueIdentifier: String? { get }
    
    func bind<T: UIViewController>(button: UIButton, nextTrigger: PublishSubject<Void>, pinTrigger: PublishSubject<Pin1ViewController?>, loading: UIBindingObserver<T, Bool>, error: UIBindingObserver<T, [AnyHashable: Any]>)
    
    func unbind()

}

extension FormController {
    
    func titleLabel(title: String?) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Geomanist-Light", size: 15.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = title
        label.textAlignment = .center
        return label
    }
    
    func textField(placeholder: String?) -> UITextField {
        let textField = HoshiTextField()
        textField.placeholder = placeholder
        textField.font = UIFont(name: "Geomanist", size: 16.0)
        textField.placeholderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        textField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.borderActiveColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.borderInactiveColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addConstraint(NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 60))
        return textField
    }
    
}

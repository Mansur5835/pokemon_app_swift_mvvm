//
//  Toast.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 31/01/24.
//

import Foundation
import UIKit

class Toast {

    class func show(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
              toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
              toastLabel.textColor = UIColor.white
              toastLabel.textAlignment = .center;
              toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
              toastLabel.text = message
              toastLabel.alpha = 1.0
              toastLabel.layer.cornerRadius = 10;
              toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
              UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                  toastLabel.alpha = 0.0
              }, completion: {(isCompleted) in
                  toastLabel.removeFromSuperview()
              })
     }
}

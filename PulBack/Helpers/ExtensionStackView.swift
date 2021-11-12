//
//  ExtensionStackView.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 05/08/21.
//

import Foundation
import UIKit

extension UIStackView{
    convenience init(views:[UIView], axis:NSLayoutConstraint.Axis, spacing: CGFloat, alignment:UIStackView.Alignment, distribution:UIStackView.Distribution){
        self.init()
        
        for view in views{
            self.addArrangedSubview(view)
        }
        
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
}

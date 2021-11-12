//
//  PulBackBtn.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 05/08/21.
//

import Foundation
import UIKit

class PulBackBtn: UIButton {
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       setup()
    }
    
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        layer.cornerRadius = 30
        clipsToBounds = true
        backgroundColor = AppColors.customRed
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 24)
    }
}


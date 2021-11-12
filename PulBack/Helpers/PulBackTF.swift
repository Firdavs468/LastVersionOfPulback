//
//  PulBackTF.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 05/08/21.
//

import Foundation
import  UIKit
import  SnapKit

class PulBackTF:UIView{
    private let  titleIconIV = UIImageView()
    private let  leftIconIV = UIImageView()
    private let  rightIconIV = UIImageView()
    private let textField = UITextField()
    private let titleLbl = UILabel()
    private let containerView = UIView()
    private let verticalStackView = UIStackView(views: [], axis: .vertical, spacing: 5, alignment: .fill, distribution: .fill)
    private let horizontalStackView = UIStackView(views: [], axis: .horizontal, spacing: 5, alignment: .center, distribution: .fill)
    private let topHorizontalStackView = UIStackView(views: [], axis: .horizontal, spacing: 5, alignment: .fill, distribution: .fill)
    
    
    var placeholder : String?{
        get {
            return textField.placeholder
        }
        set(newValue){
            if let plc = newValue{
                textField.placeholder = plc
            }
        }
    }
    
    var text : String?{
        get {
            return textField.text
        }
        set(newValue){
            if let txt = newValue{
                textField.text = txt
            }
        }
    }
    
    var title : String?{
        get {
            return titleLbl.text
        }
        set(newValue){
            if let text = newValue{
                titleLbl.text = text
                topHorizontalStackView.addArrangedSubview(titleLbl)
                verticalStackView.insertArrangedSubview(topHorizontalStackView, at:0)
            }
        }
    }
    
    
    var title_icon : UIImage?{
        get {
            return self.titleIconIV.image
        }set(newValue){
            if let img = newValue{
                titleIconIV.image = img
                topHorizontalStackView.insertArrangedSubview(titleIconIV, at: 0)
            }
        }
    }
    
    var right_icon : UIImage?{
        get {
            return self.rightIconIV.image
        }set(newValue){
            if let img = newValue{
                rightIconIV.image = img
                horizontalStackView.addArrangedSubview(rightIconIV)
            }
        }
    }
    
    
    var left_icon : UIImage?{
        get {
            return self.leftIconIV.image
        }set(newValue){
            if let img = newValue{
                leftIconIV.image = img
                horizontalStackView.insertArrangedSubview(leftIconIV, at: 0)
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    func isEmpty() ->Bool{
        if textField.text!.isEmpty{
            containerView.layer.borderColor = UIColor.red.cgColor
        }else{
            containerView.layer.borderColor = UIColor.lightGray.cgColor
        }
        return textField.text!.isEmpty
    }
    
    
    func setupUI(){
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = #colorLiteral(red: 0.9449954033, green: 0.9451572299, blue: 0.9449852109, alpha: 1)
        
        self.backgroundColor = .clear
        
        titleIconIV.snp.makeConstraints { (make) in
            make.width.height.equalTo(24)
        }
        
        leftIconIV.snp.makeConstraints { (make) in
            make.width.height.equalTo(24)
        }
        
        rightIconIV.snp.makeConstraints { (make) in
            make.width.height.equalTo(24)
        }
        
        verticalStackView.addArrangedSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        horizontalStackView.addArrangedSubview(textField)
        containerView.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { (make) in
            make.edges.equalTo(containerView).inset(UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 5))
        }
    }
    
}



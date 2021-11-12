//
//  logOutVC.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 07/08/21.
//

import UIKit

class logOutVC: UIViewController {
    
    @IBOutlet weak var noBtn: UIButton!{
        didSet{
            noBtn.layer.cornerRadius = noBtn.frame.height/3
        }
    }
    @IBOutlet weak var yesBtn: UIButton!{
        didSet{
            yesBtn.layer.cornerRadius = yesBtn.frame.height/3
        }
    }
    
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = backView.frame.height/10
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func noBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func yesBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

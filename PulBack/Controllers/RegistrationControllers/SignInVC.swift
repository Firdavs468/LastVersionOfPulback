//
//  SignInVC.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 27/07/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import FlagPhoneNumber




class SignInVC: UIViewController {
    
    @IBOutlet weak var pulbackImage: UIImageView!
    
    @IBOutlet weak var phoneNumberTextField: FPNTextField!{
        didSet{
            self.phoneNumberTextField.delegate = self
        }
    }
    @IBOutlet weak var pulbackButton: PulBackBtn!
    @IBOutlet weak var hiddenPhoneNumberLabel: UIView!
    
    
    var base_url = "https://www.googleapis.com/books/v1/volumes?q="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupCornerRadius()
        
        UserDefaults.standard.setValue(true, forKey: "isLogged")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        phoneNumberTextField.text = phoneNumberTextField.getFormattedPhoneNumber(format: .E164)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        phoneNumberTextField.layer.cornerRadius = phoneNumberTextField.bounds.height/2
        phoneNumberTextField.layer.borderWidth = 1.5
        phoneNumberTextField.layer.borderColor = #colorLiteral(red: 0.1105599452, green: 0.1105599452, blue: 0.1105599452, alpha: 1)
        phoneNumberTextField.setCountries(including: [.UZ,.RU])
        phoneNumberTextField.flagButtonSize = CGSize(width: 56, height: 44)
        
    }
    @IBAction func registrationButtonPressed(_ sender: Any) {
        Loader.stop()
        userSignIn()
    }
    func setupCornerRadius(){
        phoneNumberTextField.layer.borderWidth = 2
        phoneNumberTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        phoneNumberTextField.layer.cornerRadius = phoneNumberTextField.frame.height/2
        
    }
    
  
    
}
extension SignInVC: UITextFieldDelegate{
    
}

extension SignInVC {
    func userSignIn(){
        let params  = [
             "phone_number" : phoneNumberTextField.text!
        ]
        
        UserDefaults.standard.setValue(phoneNumberTextField.text, forKey: "phone")
        Net.req(urlAPI:"/client/sign-in", method: .post, params: params) {[self] data in
            if let data = data {
                print("\(params)🇺🇿")
                print(data)
                if data["code"].intValue == 0 {
                    let vc = OTPVC(nibName: "OTPVC", bundle: nil)
                    navigationController?.pushViewController(vc, animated: true)
                }else if data["code"].intValue == 11000{
                    let vc = SignUpPage(nibName: "SignUpPage", bundle: nil)
                    vc.phone_number = phoneNumberTextField.text ?? ""
                    navigationController?.pushViewController(vc, animated: true)
                }else{
                    Alert.showAlert(forState: .error, message: data["message"].stringValue)
                }
            }
        }
    }
}


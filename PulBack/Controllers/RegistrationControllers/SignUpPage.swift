//
//  SignUpPage.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 28/07/21.
//

import UIKit
class SignUpPage: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var signUpBtn: PulBackBtn!
    
    
    var phone_number = ""
    var isCheck : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        //        isCheck = false
        if !isCheck{
            checkBtn.setImage(AppIcon.check, for: .normal)
            isCheck = true
        }
        else{
            checkBtn.setImage(AppIcon.uncheck, for: .normal)
            isCheck = false
        }
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        let vc = OTPVC(nibName: "OTPVC", bundle: nil)
//        if !nameTF.text!.isEmpty && !surnameTF.text!.isEmpty{
        UserDefaults.standard.setValue(nameTF.text!, forKey: Keys.NAME)
        UserDefaults.standard.setValue(surnameTF.text!, forKey: Keys.SURNAME)
            navigationController?.pushViewController(vc, animated: true)
//        }
        
    }
    
    
}
extension SignUpPage{
    func sendUser(){
        let params = [
            "first_name" : nameTF.text!,
            "last_name" : surnameTF.text!,
            "phone_number" : phone_number
        ]
        
        Net.req(urlAPI: "client/sign-up", method: .post, params: params) {[self] (data) in
            if let data = data{
                print(data)
                if data["message"].stringValue == "Succes"{
                    let vc = OTPVC(nibName: "OTPVC", bundle: nil)
                    vc.number = self.phone_number
                    navigationController?.pushViewController(vc, animated: true)
                }
                else{
                    Alert.showAlert(forState: .error, message:data["message"].stringValue)
                }
            }
        }
    }
   
}

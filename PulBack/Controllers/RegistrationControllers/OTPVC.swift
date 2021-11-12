//
//  OTPVC.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 31/07/21.
//

import UIKit

class OTPVC: UIViewController {
    
    @IBOutlet weak var confirmBtn: PulBackBtn!
    
    @IBOutlet weak var otpTextFieldView: OTPFieldView!{
        didSet{
            otpTextFieldView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var loaderView: TimerView!
    
    var number = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderView.createCircularPath(radius: 50, lineWidth: 10, bgLineColor: .clear, progressColor: .systemGreen, firstDuration: 90)
        loaderView.progressAnimation()
        setupOtpView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func confirmBtnPressed(_ sender: Any) {
        let vc = CustomTabBarControllerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    func setupOtpView(){
        self.otpTextFieldView.fieldsCount = 4
        self.otpTextFieldView.fieldBorderWidth = 2
        self.otpTextFieldView.defaultBorderColor = UIColor.black
        self.otpTextFieldView.filledBorderColor = UIColor.green
        self.otpTextFieldView.cursorColor = UIColor.red
        self.otpTextFieldView.displayType = .underlinedBottom
        self.otpTextFieldView.fieldSize = 40
        self.otpTextFieldView.separatorSpace = 8
        self.otpTextFieldView.shouldAllowIntermediateEditing = false
        //            self.otpTextFieldView.delegate = self
        self.otpTextFieldView.initializeUI()
    }
}
extension OTPVC{
    func otpApi(){
        let params  = [
            "phone_number":UserDefaults.standard.string(forKey: "phone")!,
            "otp":otpTextFieldView
        ] as [String : Any]
        Net.req(urlAPI: "/client/sign-verify", method: .post, params: params) {[self] data in
            
            if let data = data {
                print(data)
                if data["code"].intValue == 0 {
                    UserDefaults.standard.setValue(data["data"]["token"].stringValue, forKey: Keys.token)
                    let vc = CustomTabBarControllerViewController(nibName: "CustomTabBarControllerViewController", bundle: nil)
                    vc.modalPresentationStyle = .fullScreen
                    present(vc, animated: true, completion: nil)
                }else{
                    Alert.showAlert(forState: .error, message: data["message"].stringValue)
                }
            }
        }
    }
}

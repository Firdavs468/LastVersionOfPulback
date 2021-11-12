//
//  LanguageVC.swift
//  PulBack
//
//  Created by Firdavs Zokirov  on 14/08/21.
//

import UIKit
protocol SetImageDelegate {
    func image(UIButton: UIImage,lbl: UILabel)
}


class LanguageVC: UIViewController{
    
    @IBOutlet var langLbl: [UILabel]!
    @IBOutlet var chekmarkBtn: [UIButton]!{
        didSet{
            for i in chekmarkBtn{
                i.isHidden = true
            }
        }
    }
    @IBOutlet var mainView: UIView!
    
    var lang = UserDefaults.standard.string(forKey: Keys.LANGUAGE) ?? "uz"
    var delegate: SetImageDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        setCheckIcon()
    }
    func setCheckIcon(){
        let lang =  UserDefaults.standard.string(forKey: Keys.LANGUAGE) ?? "uz"
        if lang == "uz"{
            chekmarkBtn[0].isHidden = false
        }else if lang == "ru"{
            chekmarkBtn[1].isHidden = false
        }else {
            chekmarkBtn[2].isHidden = false
        }
    }
    @IBAction func btns(_ sender: UIButton) {
        for i in chekmarkBtn {
            i.isHidden = true
        }
        chekmarkBtn[sender.tag].isHidden = false
        
        if sender.tag == 0
        {
            lang = "uz"
        }
        if sender.tag == 1
        {
            lang = "ru"
        }
        if sender.tag == 2
        {
            lang = "eng"
        }
    }
    
    
    @IBAction func outputBtnPressed(_ sender: Any) {
        UserDefaults.standard.setValue(lang, forKey: Keys.LANGUAGE)
        Loader.start()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
            Loader.stop()
            let window = UIApplication.shared.keyWindow
            window?.rootViewController = CustomTabBarControllerViewController()
            window?.makeKeyAndVisible()
        }
        
    }
    
    
    @IBAction func CancelBtnPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.mainView.frame = CGRect(x: 0, y: -500, width: 0, height: 0)
        }
    }
}

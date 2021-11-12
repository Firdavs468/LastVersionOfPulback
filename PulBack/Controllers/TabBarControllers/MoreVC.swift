//
//  MoreVC.swift
//  PulBack
//
//  Created by Mirshod on 8/3/21.
//

import UIKit
import BarcodeScanner

class MoreVC: UIViewController{
    @IBOutlet var langLbl: UILabel!
    @IBOutlet var btnImage: UIButton!
    @IBOutlet var profileImg: UIImageView!
    
    var delegate: SetImageDelegate?
    var index: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        navigationBarItem()
        navBarBackground()
        setCheckIcon()
    }
    func setCheckIcon(){
        let lang =  UserDefaults.standard.string(forKey: Keys.lang) ?? "uz"
        if lang == "uz"{
            langLbl.text = "O'zbek"
            btnImage.setImage(#imageLiteral(resourceName: "uzbek"), for: .normal)

        }else if lang == "ru"{
            langLbl.text = "Rus"
            btnImage.setImage(#imageLiteral(resourceName: "rus"), for: .normal)
        }else {
            langLbl.text = "Ingliz"
            btnImage.setImage(#imageLiteral(resourceName: "eng"), for: .normal)
        }
    }
    @IBAction func langBtnPressed(_ sender: Any) {
        let vc = LangVC(nibName: "LangVC", bundle: nil)
        
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)

    }
    
    
    @IBAction func profileBtnPressed(_ sender: Any) {
        let vc = ProfileEditingVC(nibName: "ProfileEditingVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    func navBarBackground(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    func navigationBarItem(){
        let operatorBar = UIBarButtonItem(image: AppIcon.operatorr, style: .plain, target: self, action: #selector(operatorBarTapped))
        
        
        let qrCodeBar = UIBarButtonItem(image: AppIcon.scaner, style: .plain, target: self, action: #selector(qrCodeBarTapped))
        
        let settingBar = UIBarButtonItem(image: AppIcon.settings, style: .plain, target: self, action: #selector(settingsBarTapped))
        navigationItem.leftBarButtonItem = operatorBar
        navigationItem.rightBarButtonItems =  [settingBar,qrCodeBar]
        if #available(iOS 13.0, *) {
            qrCodeBar.tintColor = .systemGray2
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            operatorBar.tintColor = .systemGray2
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            settingBar.tintColor = .systemGray2
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc func operatorBarTapped(){
        print("Bosildi")
    }
    
    @objc func qrCodeBarTapped(){
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        present(viewController, animated: true, completion: nil)
        
    }
    
    @objc func settingsBarTapped(){
        let vc = SettingVC(nibName: "SettingVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func profileEditingBtnPressed(_ sender: Any) {
        let vc = ProfileEditingVC(nibName: "ProfileEditingVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension MoreVC: BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate{
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        controller.reset()
    }
    
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error){
        print(error)
        
    }
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}

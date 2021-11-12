//
//  ServicesCenterVC.swift
//  Pulback
//
//  Created by Firdavs Zokirov on 05/08/21.
//

import UIKit
import BarcodeScanner


class ServicesCenterVC: UIViewController {
    @IBOutlet var directionBtn: UIButton!{
        didSet{
            directionBtn.tintColor = .green
        }
    }
    @IBOutlet var callLbl: UILabel!{
        didSet{
            callLbl.text = Language.getTitle(type:.lbl_call)
            
        }
    }
    @IBOutlet var marketLbl: UILabel!{
            didSet{
                marketLbl.text = Language.getTitle(type: .lbl_market)
            }
    }
    @IBOutlet var addressLbl: UILabel!{
        didSet{
            addressLbl.text = Language.getTitle(type: .lbl_address)
        }
    }
    @IBOutlet var scanerBtn: UIButton!{
        didSet{
            callLbl.text = Language.getTitle(type: .lbl_call)
        }
    }
    @IBOutlet var directionLbl: UILabel!{
        didSet{
            callLbl.text = Language.getTitle(type: .lbl_call)
        }
    }
    @IBOutlet var callBtn: UIButton!{
        didSet{
            callBtn.tintColor = .green
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.string(forKey: "phone") as Any)
        
        navBarBackground()
    }
    
    func navBarBackground(){
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.layoutIfNeeded()
        }
    
    @IBAction func callNumber(_ sender: Any) {
        callNumber(phoneNumber: "998942496636")
    }
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func scanBtnPressed(_ sender: Any) {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        present(viewController, animated: true, completion: nil)
        
    }
}
extension ServicesCenterVC: BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate{
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


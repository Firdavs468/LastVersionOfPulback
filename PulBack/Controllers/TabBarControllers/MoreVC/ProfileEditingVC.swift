//
//  ProfileEditingVC.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 04/08/21.
//

import UIKit

class ProfileEditingVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var chooseBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            profileImage.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var profileBackView: UIView!
    @IBOutlet weak var phoneNumberTF: PulBackTF!
    @IBOutlet weak var nameTF: PulBackTF!{
        didSet{
            nameTF.text = "Firdavs"
        }
    }
    @IBOutlet weak var surnameTF: PulBackTF!{
        didSet{
            surnameTF.text = "Zokirov"
        }
    }
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barItem()
        setupCornerRadius()
        phoneNumberTF.text = UserDefaults.standard.string(forKey: Keys.PHONE_NUMBER)
        nameTF.text = UserDefaults.standard.string(forKey: Keys.NAME)
        surnameTF.text = UserDefaults.standard.string(forKey: Keys.SURNAME)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @IBAction func savedBtnPressed(_ sender: Any) {
        if !phoneNumberTF.isEmpty() && !nameTF.isEmpty() && !surnameTF.isEmpty(){
            navigationController?.popViewController(animated: true)
        }
        else{
            Alert.showAlert(forState: .unknown, message: "Ma'lumotlarni to'ldiring")
        }
    }
    
    @IBAction func chooseBtnPressed(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.image = image
        }
        
        
        
    }
    
    
    @objc func settingsPressed(){
        let vc = SettingsVC(nibName: "SettingsVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func barItem(){
        let settingBar = UIBarButtonItem(image: AppIcon.settings, style: .plain, target: self, action: #selector(settingsPressed))
        navigationItem.rightBarButtonItem =  settingBar
        settingBar.tintColor = .lightGray
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
    
        
    }
    func setupCornerRadius(){
        profileBackView.layer.cornerRadius = profileBackView.frame.height/2
    }
    
}

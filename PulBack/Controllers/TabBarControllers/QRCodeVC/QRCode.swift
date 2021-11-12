//
//  QRCode.swift
//  PulBack
//
//  Created by Firdavs Zokirov  on 14/08/21.
//

import UIKit

class QRCode: UIViewController {

    
    @IBOutlet weak var useDuringLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }

}

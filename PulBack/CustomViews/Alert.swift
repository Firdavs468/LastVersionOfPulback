


import UIKit



let screenSize = UIScreen.main.bounds

class AlertView: UIView {
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 20
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
    }
}

class Alert {
    
    enum AlertType {
        case warning
        case success
        case error
        case unknown
    }
    
    static var timer : Timer? = nil
    
    class func showAlert(forState: AlertType, message: String, duration: TimeInterval = 4, userInteration: Bool = true) {
                
        let view = AlertView(frame: CGRect(x: 0, y: -130, width: screenSize.width, height: 120))
        
        let titleLbl = UILabel()
        titleLbl.frame = view.frame
        titleLbl.textColor = .white
        titleLbl.minimumScaleFactor = 0.2
        titleLbl.adjustsFontSizeToFitWidth = true
        titleLbl.textAlignment = .center
        
        titleLbl.numberOfLines = 3
        titleLbl.font = UIFont(name: "Montserrat-Medium", size: 17)

        view.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        titleLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true

        
        

        view.tag = 9981
  
        view.backgroundColor = .black
        
        if let window = UIApplication.shared.keyWindow {
            if let vi = UIApplication.shared.keyWindow?.viewWithTag(9981) {
                timer?.invalidate()
                vi.removeFromSuperview()
            }
            window.addSubview(view)
        
        }

        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseIn, animations: {
            view.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        })
        
        
        let closeBtn = UIButton()
        closeBtn.backgroundColor = .clear
        closeBtn.setImage(#imageLiteral(resourceName: "close_light").withRenderingMode(.alwaysTemplate), for: .normal)
        closeBtn.tintColor = .white
        closeBtn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        closeBtn.layer.cornerRadius = 17.5
        closeBtn.layer.borderWidth = 1
        closeBtn.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        view.addSubview(closeBtn)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 35).isActive = true
        closeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        closeBtn.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)

        titleLbl.text = message
        
        switch forState {
        case .warning:
            view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case .error:
            view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case .success:
            view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case .unknown:
            view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
        
        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(Alert.closeBtnPressed), userInfo: nil, repeats: false)        

    }
    
    
    @objc class func closeBtnPressed() {
        if let window = UIApplication.shared.keyWindow, let view = window.viewWithTag(9981) {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
                view.transform = CGAffineTransform(translationX: 0, y: -view.frame.height)
            }) { (_) in
                view.removeFromSuperview()
            }
        }
    }
}

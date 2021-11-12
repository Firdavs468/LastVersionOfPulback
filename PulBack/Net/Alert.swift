


import UIKit
import SnapKit


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
        
        let alertView = UIView()
        alertView.frame = CGRect(x: 10, y: UIApplication.shared.statusBarFrame.height-70, width: UIScreen.main.bounds.width-20, height: 80)
        alertView.layer.cornerRadius = 20
        alertView.layer.shadowColor = UIColor.black.cgColor
        alertView.layer.shadowRadius = 6
        alertView.layer.shadowOffset = CGSize(width: 0, height: 3)
        alertView.clipsToBounds = true
        
        
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        alertView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(alertView).inset(UIEdgeInsets(top: 10, left:30 , bottom: 10, right: 16))
        }
        
        
        alertView.tag = 9981
        
        alertView.backgroundColor = .black
        
        if let window = UIApplication.shared.keyWindow {
            if let vi = UIApplication.shared.keyWindow?.viewWithTag(9981) {
                timer?.invalidate()
                vi.removeFromSuperview()
            }
            window.addSubview(alertView)
            
        }
        
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseIn, animations: {
            alertView.transform = CGAffineTransform(translationX: 0, y: alertView.frame.height)
        })
        
        
        let closeBtn = UIButton()
        closeBtn.backgroundColor = .clear
        closeBtn.setImage(#imageLiteral(resourceName: "direction").withRenderingMode(.alwaysTemplate), for: .normal)
        closeBtn.tintColor = .white
        closeBtn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        closeBtn.layer.cornerRadius = 17.5
        closeBtn.layer.borderWidth = 1
        closeBtn.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        alertView.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-17)
            make.top.equalToSuperview().offset(17)
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(50)
            
        }
        closeBtn.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)
        
        titleLabel.text = message
        
        switch forState {
            case .warning:
                alertView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            case .error:
                alertView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            case .success:
                alertView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            case .unknown:
                alertView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
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

//


import UIKit
import Lottie


public class Loader {
    
    ///Shows custom Alert for a while
    class func start() {
        
        let loadV = UIView()
        loadV.tag = 19995
        loadV.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        loadV.frame = UIScreen.main.bounds
        let customView = AnimationView()
        
        loadV.addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.centerXAnchor.constraint(equalTo: loadV.centerXAnchor).isActive = true
        customView.centerYAnchor.constraint(equalTo: loadV.centerYAnchor).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        customView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        customView.backgroundColor = .clear
        if let window = UIApplication.shared.windows.first(where: { (window) -> Bool in window.isKeyWindow}) {
            window.addSubview(loadV)
        }
        customView.animation = Animation.named("loading")
        customView.animationSpeed = 3.0
        customView.loopMode = .loop
        customView.play()
        
        UIView.animate(withDuration: 0.3) {
            loadV.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35)
        }
    }
    
    class func stop() {
        if let window = UIApplication.shared.windows.first(where: { (window) -> Bool in window.isKeyWindow}) {
            for i in window.subviews {
                if i.tag == 19995 {
                    UIView.animate(withDuration: 0.3, animations: {
                        i.backgroundColor = .clear
                    }) { (_) in
                        i.removeFromSuperview()
                    }
                }
            }
        }
    }
}





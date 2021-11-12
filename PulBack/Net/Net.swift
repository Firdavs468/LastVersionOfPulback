//



import UIKit
import Alamofire
import SwiftyJSON


class Net {
    
    static var commonHeader: HTTPHeaders {
        [
            "Content-Type" : "application/json"
        ]
    }
    
    static var tokenHeader: HTTPHeaders {
        [
            "Content-Type": "application/json",
            "Authorization": "\(Cache.getUserToken())"
        ]
    }
    
    ///JSONEncoding.default , header tokensiz jonatiladi
    class func simpleRequest(from url: URL, method: HTTPMethod, params: [String: Any]?, withLoader: Bool? = nil, completion: @escaping (JSON?) -> Void) {
        
        if Reachability.isConnectedToNetwork() {
            //loader
            if let isLoaderActive = withLoader {
                if isLoaderActive {
                    Loader.start()
                }
            }
            
            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: commonHeader).responseJSON { (response) in
                
                //end loading
                if let isLoaderActive = withLoader {
                    if isLoaderActive {
                        Loader.stop()
                    }
                }
                switch response.result {
                    case .success(_): completion(JSON(response.data!))
                    case .failure(_): completion(nil)
                }
            }
        } else {
            Alert.showAlert(forState: .error, message: "Your device no internet connection")
        }
    }
    
    ///JSONEncoding.default , headerda token xam  jonatiladi
    class func request(from url: URL, method: HTTPMethod, params: [String: Any]?, withLoader: Bool? = nil, completion: @escaping (JSON?) -> Void) {
        if Reachability.isConnectedToNetwork() {
            //loader
            if let isLoaderActive = withLoader {
                if isLoaderActive {
                    Loader.start()
                }
            }
            
            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: tokenHeader).responseJSON { (response) in
                
                //end loading
                if let isLoaderActive = withLoader {
                    if isLoaderActive {
                        Loader.stop()
                    }
                }
                
                switch response.result {
                    case .success(_): completion(JSON(response.data!))
                    case .failure(_): print(response.error.debugDescription); completion(nil)
                }
            }
        } else {
            Alert.showAlert(forState: .error, message: "Your device no internet connection")
        }
    }
    
    ///URLEncoding.default , header tokensiz jonatiladi
    class func requestWithURLEncoding(from url: URL, method: HTTPMethod, params: [String: Any]?, withLoader: Bool? = nil, completion: @escaping (JSON?) -> Void) {
        if Reachability.isConnectedToNetwork() {
            //loader
            if let isLoaderActive = withLoader {
                if isLoaderActive {
                    Loader.start()
                }
            }
            
            AF.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: commonHeader).responseJSON { (response) in
                
                //end loading
                if let isLoaderActive = withLoader {
                    if isLoaderActive {
                        Loader.stop()
                    }
                }
                switch response.result {
                    case .success(_): completion(JSON(response.data!))
                    case .failure(_): completion(nil)
                }
            }
        } else {
            Alert.showAlert(forState: .error, message: "Your device no internet connection")
        }
    }
}

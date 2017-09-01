//
//  Helper.swift
//  ForgetMeNot
//
//  Created by Relinns on 28/07/16.
//  Copyright © 2016 Relinns. All rights reserved.
//
import UIKit

typealias ServiceResponse = (Data?,URLResponse?, Error?) ->Void

class Helper: NSObject {
    
    static let sharedInstance = Helper()
    func getArray() -> NSDictionary?{
        if let path = Bundle.main.path(forResource: "language",ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                    print("serialization failed in get country code data")
                    return  nil
                }
                print(json)
                return json
                
            } catch let error {
                print(error.localizedDescription)
                return nil
                
            }
        } else {
            print("Invalid filename/path.")
            return nil
        }
    }
    func getCountryArray() -> NSArray?{
        if let path = Bundle.main.path(forResource: "isd", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray else {
                    print("serialization failed in get country code data")
                    return  nil
                }
                print(json)
                return json
                
            } catch let error {
                print(error.localizedDescription)
                return nil
                
            }
        } else {
            print("Invalid filename/path.")
            return nil
        }
    }

    
    func getlatlongArray() -> NSArray?{
        if let path = Bundle.main.path(forResource: "latlong", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray else {
                    print("serialization failed in get country code data")
                    return  nil
                }
                print(json)
                return json
                
            } catch let error {
                print(error.localizedDescription)
                return nil
                
            }
        } else {
            print("Invalid filename/path.")
            return nil
        }
    }
    
    func getJson(urlStr:String,param :String,method:String ,onCompletion : @escaping (ServiceResponse))  {
        print(param)
        var request = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = method
        request.httpBody = param.data(using: String.Encoding.utf8)
        
        let session =  URLSession.shared
        
        let task = session.dataTask(with: request , completionHandler: {data, response, error -> Void in
            
            onCompletion(data as Data?, response,error as NSError?)
        })
        task.resume()
        
    }
    
    func makeMultipartCall(urlStr:String,param :[String:String],image:UIImage? ,imageNameParam:String,onCompletion : @escaping (ServiceResponse))  {
        var request = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = "POST"
        
        let session =  URLSession.shared
        
        let boundary = generateBoundaryString()
    
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = createBodyWithParameters(parameters: param,imageName: imageNameParam, filePathKey: "file", imageDataKey: image, boundary: boundary)
        
        let task = session.dataTask(with: request , completionHandler: {data, response, error -> Void in
            
            onCompletion(data as Data?, response,error as NSError?)
        })
        task.resume()
    }
    
    func createBodyWithParameters(parameters: [String: String]?,imageName:String, filePathKey: String?, imageDataKey: UIImage?, boundary: String) -> Data {
        let body = NSMutableData();
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        if imageDataKey != nil {
            
            let imageData = UIImageJPEGRepresentation(imageDataKey!, 1)
            
            let filename = "post.jpg"
            let mimetype = "image/jpg"
            
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"\(imageName)\"; filename=\"\(filename)\"\r\n")
            body.appendString("Content-Type: \(mimetype)\r\n\r\n")
            body.append(imageData!)
            body.appendString("\r\n")
            
        }
        
        body.appendString("--\(boundary)--\r\n")
        
        return body as Data
    }
    
    func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().uuidString)"
    }
    

}


extension NSMutableData {
    
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

extension String
{
    
    
    func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format:"SELF MATCHES %@", emailFormat).evaluate(with: self)
    }
    
    
    
    
    var html2AttributedString: NSAttributedString? {
        
        
        
        guard
            let data = data(using: String.Encoding.unicode)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType ,
                NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2: String? {
        
        return html2AttributedString?.string.html2AttributedString?.string
    }
    
    
}

extension UIViewController{
    
    func showalertview(_ messagestring:String){
        DispatchQueue.main.async{
            let alert = UIAlertController(title: nil, message: messagestring, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func showalertview(_ messagestring:String, Buttonmessage: String ,handler:@escaping () -> Void ){
        DispatchQueue.main.async{
            let alert = UIAlertController(title: "", message: messagestring, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Buttonmessage, style: .default, handler: { action  in
                DispatchQueue.main.async{
                    handler()
                }
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    

    
    
}

extension UIView {
    
    func startProgresshud(){
        DispatchQueue.main.async{
            
            
            if let _ = self.viewWithTag(40) {
                //View is already locked
            }
            else {
                self.isUserInteractionEnabled = false
                let lockView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width / 4, height: self.frame.size.width / 4))
                lockView.layer.cornerRadius = 10         
                lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
                lockView.tag = 40
                lockView.alpha = 0.0
//                let activity = DGActivityIndicatorView(type: .BallClipRotate, tintColor: UIColor.whiteColor())
                let activity = UIActivityIndicatorView()

                activity.center = lockView.center
                activity.startAnimating()
                lockView.addSubview(activity)
                
                self.addSubview(lockView)
                
                UIView.animate(withDuration: 0.2, animations: {
                    lockView.alpha = 1.0
                }) 
                lockView.center = self.center
            }
        }
    }
    
    func stopProgressHud() {
        DispatchQueue.main.async{
            self.isUserInteractionEnabled = true
            if let lockView = self.viewWithTag(40) {
                UIView.animate(withDuration: 0.2, animations: {
                    lockView.alpha = 0.0
                }, completion: { finished in
                    lockView.removeFromSuperview()
                }) 
            }
        }
    }
    
    
    func fadeOut(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }) 
    }
    
    func fadeIn(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        }) 
    }
    
    
    
    func base64Conv(str: String) -> String{
        
        let longstring = str
        let data = (longstring).data(using: String.Encoding.utf8)
        let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        
        return base64
        
        
    }
    
    
    
    func addShadows(view: UIView){
        
        
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 1
        view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        view.layer.shadowOpacity = 1
        
    }
    
    
    
    
    
    
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

//
//  LoginScreenViewController.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 12/03/21.
//

import UIKit
import Alamofire
class LoginScreenViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    @IBOutlet weak var BuyNowBtn: UIButton!
    @IBOutlet weak var SecurityCodeBtn: UIButton!
    @IBOutlet weak var LicenseTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    var username:String?
    var licsensekey:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        LicenseTextField.delegate = self
        EmailTextField.delegate  = self
        activityindicator.isHidden = true
        EmailTextField.layer.borderColor = #colorLiteral(red: 0.3254901961, green: 0.7921568627, blue: 0.9529411765, alpha: 1)
        LicenseTextField.layer.borderColor = #colorLiteral(red: 0.3254901961, green: 0.7921568627, blue: 0.9529411765, alpha: 1)
        EmailTextField.layer.borderWidth = 2
        LicenseTextField.layer.borderWidth = 2
        LicenseTextField.borderStyle = .roundedRect
        EmailTextField.borderStyle = .roundedRect
        EmailTextField.layer.cornerRadius = 10
        EmailTextField.layer.masksToBounds = true
        LicenseTextField.layer.cornerRadius = 10
        LicenseTextField.layer.masksToBounds = true
        let lineView = UIView(frame: CGRect(x: 0, y: 21, width: BuyNowBtn.frame.size.width, height: 1))
        lineView.backgroundColor=UIColor.systemBlue
        BuyNowBtn.addSubview(lineView)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = true

    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func SecurityCodeAction(_ sender: Any) {
                let parameters: Parameters=[
                            "username":EmailTextField.text!,
                            "licensekey":LicenseTextField.text!
                        ]
                activityindicator.isHidden = false
                activityindicator.startAnimating()
                if !EmailTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty && !LicenseTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty{
                    AF.request("https://appstudio.co/iOS/login_N.php", method: .post, parameters: parameters).responseJSON
                    {[self] response in
                        if let result = response.value{
                            let jsonData = result as! NSDictionary
                            print("jsonData : \(jsonData.allValues)")
        
                            for i in jsonData.allValues{
                                if i as! String == "success"{
                                    username = EmailTextField.text!
        
        //                                    mail_add = EmailLog.text
                                            EmailTextField.text = ""
                                            LicenseTextField.text = ""
                                            activityindicator.stopAnimating()
                                            activityindicator.isHidden = true
//                                    SecurityScreen
                                    performSegue(withIdentifier: "logintotabbar", sender: self)
        
        
                                }else if i as! String == "failure"{
                                    activityindicator.stopAnimating()
                                    activityindicator.isHidden = true
                                    let alert = UIAlertController(title: "Alert", message: "Check Username and License key", preferredStyle: UIAlertController.Style.alert)
                                    let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
                                        }
                                    alert.addAction(cancel)
                                    present(alert, animated: true, completion: nil)
                                }
                            }
                        }
                    }
        
        
                    }else{
                        activityindicator.stopAnimating()
                        activityindicator.isHidden = true
                    let alert = UIAlertController(title: "Alert", message: "Fill All Fields", preferredStyle: UIAlertController.Style.alert)
                    let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
                        }
                    alert.addAction(cancel)
                    present(alert, animated: true, completion: nil)
                        
                    
                }

//        if  !EmailTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty && !LicenseTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty {
//                // namo server link "http://con.test:8888/orgReg.php"
//                let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/mail.php")! as URL)
//                request.httpMethod = "POST"
//                let postString = "username=\(EmailTextField.text!)&licensekey=\(LicenseTextField.text!)"
//                username = EmailTextField.text
//                licsensekey =  LicenseTextField.text
//                request.httpBody = postString.data(using: String.Encoding.utf8)
//                let task = URLSession.shared.dataTask(with: request as URLRequest) {
//                    data, response, error in
//
//                    if error != nil {
//                        print("error=\(String(describing: error))")
//                        return
//                    }
//                    print("response = \(String(describing: response))")
//                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//                    print("responseString = \(String(describing: responseString))")
//                }
//                task.resume()
//            performSegue(withIdentifier: "SecurityScreen", sender: self)
//                EmailTextField.text = ""
//                LicenseTextField.text = ""
//            
//        }else{
//            let alert = UIAlertController(title: "Alert", message: "Fill All Fields", preferredStyle: UIAlertController.Style.alert)
//            let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
//                }
//            alert.addAction(cancel)
//            present(alert, animated: true, completion: nil)
//            EmailTextField.text = ""
//            LicenseTextField.text = ""
//        }
        
        UserDefaults.standard.set(EmailTextField.text, forKey: "email")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    @IBAction func BuyNowAction(_ sender: Any) {
    }
    
    @IBOutlet weak var ContinueTrailAction: UIStackView!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logintotabbar"{
            if let viewController: Tabbar = segue.destination as? Tabbar {
                viewController.username = username
             }
        }
    }
    
}

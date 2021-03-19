//
//  SecurityCodeVerifyViewController.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 12/03/21.
//

import UIKit

class SecurityCodeVerifyViewController: UIViewController {

    @IBOutlet weak var AppActivateButton: UIButton!
    @IBOutlet weak var ActivateAppField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        ActivateAppField.layer.borderColor = #colorLiteral(red: 0.3254901961, green: 0.7921568627, blue: 0.9529411765, alpha: 1)
                ActivateAppField.layer.borderWidth = 2
                ActivateAppField.layer.cornerRadius = 10
        ActivateAppField.borderStyle = .roundedRect

                ActivateAppField.layer.masksToBounds = true
                AppActivateButton.layer.cornerRadius = 10
                AppActivateButton.layer.masksToBounds = true
                AppActivateButton.layer.borderWidth = 1
                AppActivateButton.layer.borderColor = UIColor.white.cgColor
                AppActivateButton.layer.cornerRadius = 10
                AppActivateButton.layer.masksToBounds = true
    }
    
    @IBAction func AppActivateAction(_ sender: Any) {
        //        let parameters: Parameters=[
        //                    "username":EmailTextField.text!,
        //                    "licensekey":LicenseTextField.text!
        //                ]
        //        activityindicator.isHidden = false
        //        activityindicator.startAnimating()
        //        if !EmailTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty && !LicenseTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty{
        //            Alamofire.request("https://appstudio.co/iOS/login_N.php", method: .post, parameters: parameters).responseJSON
        //            {[self]Response in
        //                if let result = Response.value{
        //                    let jsonData = result as! NSDictionary
        //                    print("jsonData : \(jsonData.allValues)")
        //
        //                    for i in jsonData.allValues{
        //                        if i as! String == "success"{
        //
        ////                                    mail_add = EmailLog.text
        //                                    EmailTextField.text = ""
        //                                    LicenseTextField.text = ""
        //                                    activityindicator.stopAnimating()
        //                                    activityindicator.isHidden = true
        //
        //                            performSegue(withIdentifier: "SecurityScreen", sender: self)
        //
        //
        //                        }else if i as! String == "failure"{
        //                            activityindicator.stopAnimating()
        //                            activityindicator.isHidden = true
        //                            let alert = UIAlertController(title: "Alert", message: "Check Username and License key", preferredStyle: UIAlertController.Style.alert)
        //                            let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
        //                                }
        //                            alert.addAction(cancel)
        //                            present(alert, animated: true, completion: nil)
        //                        }
        //                    }
        //                }
        //            }
        //
        //
        //            }else{
        //                activityindicator.stopAnimating()
        //                activityindicator.isHidden = true
        //            let alert = UIAlertController(title: "Alert", message: "Fill All Fields", preferredStyle: UIAlertController.Style.alert)
        //            let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
        //                }
        //            alert.addAction(cancel)
        //            present(alert, animated: true, completion: nil)
        //        }

        performSegue(withIdentifier: "Tabbar", sender: self)
    }
    

}

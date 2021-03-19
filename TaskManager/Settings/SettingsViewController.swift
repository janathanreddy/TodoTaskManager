//
//  SettingsViewController.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 12/03/21.
//

import UIKit
import Alamofire
class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,YourCellDelegate {
    
    
    
    

    @IBOutlet weak var tableView: UITableView!
    var cells = ["StartTableViewCell","QuickTableViewCell","ShowloveTableViewCell","EmailTableViewCell","QuitTableViewCell"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if cells[indexPath.row] == "QuitTableViewCell"{
            let cell = tableView.dequeueReusableCell(withIdentifier: cells[indexPath.row],for: indexPath) as! QuitTableViewCell
            cell.cellDelegate = self
            cell.Quit.tag = indexPath.row
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cells[indexPath.row],for: indexPath)
        
        return cell
        
    }
    
    func didPressButton(_ tag: Int) {
        let parameters: Parameters=["logout":"logout"]
        AF.request("https://appstudio.co/iOS/logout_N.php", method: .get, parameters: parameters).responseJSON
        {[self] response in
            if let result = response.value{
                let jsonData = result as! NSDictionary
                print("jsonData : \(jsonData.allValues)")

                for i in jsonData.allValues{
                    print("Response Status : \(i)")
                    if i as! String == "Success"{
                        performSegue(withIdentifier: "Quit", sender: self)
                    }else{
                    let alert = UIAlertController(title: "Alert", message: "Logout Failed", preferredStyle: UIAlertController.Style.alert)
                    let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
                        }
                    alert.addAction(cancel)
                    present(alert, animated: true, completion: nil)
                    }
                }
                
            }
            
        }
    }
}

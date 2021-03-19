//
//  CompletedViewController.swift
//  TaskManager
//
//  Created by Janarthan Subburaj on 12/03/21.
//

import UIKit

class CompletedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var tableView: UITableView!
    var didselect:String?
    var didselectDate:String?
    var txtDatePicker = UITextField()
    let datePicker = UIDatePicker()
    var username:String?
    var TaskDates:[String] = []

    private var Completed = [CompletedAdded]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        Completed.removeAll()
        downloadItems()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Completed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 70
        let CompletedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CompletedTableViewCell", for: indexPath) as! CompletedTableViewCell
        CompletedTableViewCell.CompletedButton.tag = indexPath.row
        CompletedTableViewCell.CompletedButton.addTarget(self, action: #selector(CompletedAction(sender:)), for:.touchUpInside )
        CompletedTableViewCell.TaskName.text = Completed[indexPath.row].TaskName
        CompletedTableViewCell.TaskDate.text = Completed[indexPath.row].TaskDate
        if Completed[indexPath.row].Category == "Home"{
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 35")
        }else if Completed[indexPath.row].Category == "Shopping" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 24")
        }else if Completed[indexPath.row].Category == "Expense" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 25")
        }else if Completed[indexPath.row].Category == "inbox" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 26")
        }else if Completed[indexPath.row].Category == "Personal Notes" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 29")
        }else if Completed[indexPath.row].Category == "Personal Diary" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 28")
        }else if Completed[indexPath.row].Category == "Appointment" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 35")
        }else if Completed[indexPath.row].Category == "Tasks" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 31")
        }else if Completed[indexPath.row].Category == "Business" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 27")
        }else if Completed[indexPath.row].Category == "Travel" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 33")
        }else if Completed[indexPath.row].Category == "Gift" {
            CompletedTableViewCell.Categoryimage.image = UIImage(named: "Group 34")
        }
        
        if Completed[indexPath.row].FavouriteStatus == "Favourite"{
            CompletedTableViewCell.CompletedButton.setImage(UIImage(named: "Path"), for: .normal)
        }else{
            CompletedTableViewCell.CompletedButton.setImage(UIImage(named: "Heart unchecked"), for: .normal)
        }
        CompletedTableViewCell.contentView.backgroundColor = UIColor.clear
        CompletedTableViewCell.View1.layer.cornerRadius = 8
        CompletedTableViewCell.View1.layer.masksToBounds = false
        CompletedTableViewCell.View1.layer.shadowRadius = 4
        CompletedTableViewCell.View1.layer.shadowOpacity = 1
        CompletedTableViewCell.View1.layer.shadowColor = #colorLiteral(red: 0.9157811174, green: 0.9157811174, blue: 0.9157811174, alpha: 1)
        CompletedTableViewCell.View1.layer.shadowOffset = CGSize(width: 0 , height:10)
        return CompletedTableViewCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 8

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    func downloadItems() {
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {return}
        let request = NSMutableURLRequest(url: NSURL(string:"https://appstudio.co/iOS/Completed_N.php")! as URL)
            request.httpMethod = "POST"
        let postString = "username=\(email)"
            print("postString \(postString)")
            request.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
              data, response, error in
              if error != nil {
                print("error=\(String(describing: error))")
                return
              }
              self.parseJSON(data!)
              print("response = \(String(describing: response))")
              let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
              print("responseString = \(String(describing: responseString))")
            }
            task.resume()
    }
    
    func parseJSON(_ data:Data) {
        var jsonResult = NSArray()
            do{
                jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            } catch let error as NSError {
                print(error)
            }
            var jsonElement = NSDictionary()
        let stocks = NSMutableArray()
        for i in 0 ..< jsonResult.count
             {
            print("The count is \(jsonResult.count)")
            jsonElement = jsonResult[i] as! NSDictionary
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            let datetime = formatter.date(from: "\(jsonElement["TaskDate"] as! String) 13:37:00 +0100")
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "E,d MMM"
            let datetostring = dateformatter.string(from: datetime!)
            print("datetime \(datetime) \(jsonElement["TaskDate"] as? String) \(datetostring)")
                //the following insures none of the JsonElement values are nil through optional binding
            if let TaskName = jsonElement["Taskname"] as? String,
            let TaskStatus = jsonElement["TaskStatus"] as? String,
            let TaskDate = jsonElement["TaskDate"] as? String,
            let FavouriteStatus = jsonElement["FavouriteStatus"] as? String,
            let Category = jsonElement["Category"] as? String,
            let Id = jsonElement["Id"] as? String
            {
            print(TaskName)
            print(TaskStatus)
                TaskDates.append(TaskDate)
                Completed.append(CompletedAdded(TaskName: TaskName,TaskDate: datetostring,FavouriteStatus: FavouriteStatus,Category:Category,Id: Id))
                print("Completed : \(Completed)")
                }
            }
        DispatchQueue.main.async(execute: { [self] () -> Void in
                itemsDownloaded(items: stocks)
            if self.Completed.count > 0{
                self.tableView.isHidden = false
                self.View1.isHidden = true
            }else{
                self.tableView.isHidden = true
                self.View1.isHidden = false
            }
        })
        }
    
    
    func itemsDownloaded(items: NSArray) {
       
        self.tableView.reloadData()
      }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

                let deleteAction = UITableViewRowAction(style: .default, title: "Delete") {[self] (action, indexPath) in
                    let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/delete_N.php")! as URL)
                    request.httpMethod = "POST"
                    let postString = "TaskName=\(Completed[indexPath.row].TaskName ?? "")"
                    request.httpBody = postString.data(using: String.Encoding.utf8)
                    let task3 = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
                               if error != nil {
                               print("error=\(String(describing: error))")
                               return
                               }
                               print("response = \(String(describing: response))")
                               let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                               print("responseString = \(String(describing: responseString))")
                               }
                               task3.resume()
                    Completed.remove(at: indexPath.row)
                               tableView.deleteRows(at: [indexPath], with: .fade)
                    if self.Completed.count > 0{
                        self.tableView.isHidden = false
                        self.View1.isHidden = true
                    }else{
                        self.tableView.isHidden = true
                        self.View1.isHidden = false
                    }
                }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.4666666667, blue: 0.4666666667, alpha: 1)
//                deleteAction.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "RED DELETE CARD Copy"))
                //renameAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0)
                return [deleteAction]
            }
    
    @objc func CompletedAction(sender:UIButton){
        let tag = sender.tag
        let indexPath = IndexPath(row: tag, section: 0)
        print("Edit Button Tapped \(indexPath)")

        if sender.isSelected{
            sender.isSelected = false
            sender.setImage(UIImage(named: "Heart unchecked"), for: .normal)
            // Namo sever Link "http://con.test:8888/update.php"
            print("Edit Button Tapped \(Completed[indexPath.row].TaskName)")

            let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/FavouriteStatus.php")! as URL)
            request.httpMethod = "POST"
            let postString = "TaskName=\(Completed[indexPath.row].TaskName!)&FavouriteStatus=Not Favourite"
            print("postString : \(postString)")
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil {
                    print("error=\(String(describing: error))")
                    return
                }
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
            }
            task.resume()
        }else{
            sender.isSelected = true
            sender.setImage(UIImage(named: "Path"), for: .normal)
            let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/FavouriteStatus.php")! as URL)
            request.httpMethod = "POST"
            let postString = "TaskName=\(Completed[indexPath.row].TaskName!)&FavouriteStatus=Favourite"
            print("postString \(postString)")
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil {
                    print("error=\(String(describing: error))")
                    return
                }
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            }
            task.resume()
         }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var textField = UITextField()
        didselect = "\(Completed[indexPath.row].TaskName!)"
        didselectDate = "\(Completed[indexPath.row].TaskDate!)"
        print("UpdateFunction \(Int16(Completed[indexPath.row].Id!)!)")
                if   textField.text!.trimmingCharacters(in: .whitespaces).isEmpty{

                        let alert = UIAlertController(title: "Edit Task", message: "", preferredStyle: UIAlertController.Style.alert)
                        let action = UIAlertAction(title: "update", style: UIAlertAction.Style.default) { [self](action) in
                            let alertController = UIAlertController(title: "Edit", message: "Updation Done", preferredStyle: UIAlertController.Style.alert)
                            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil))
                            
                            // namo link sever "http://con.test:8888/Task.php"
                            
                            let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/Edit_N.php")! as URL)
                            request.httpMethod = "POST"
                            let postString = "TaskName=\(textField.text as! String)&Id=\(Int16(Completed[indexPath.row].Id as! String) as! Int16)&TaskDate=\(txtDatePicker.text!)"
                            print("EditpostString : \(postString)")

                            request.httpBody = postString.data(using: String.Encoding.utf8)
                            Completed.removeAll()

                            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                                data, response, error in

                                if error != nil {
                                    print("error=\(String(describing: error))")
                                    return
                                }
                                print("response = \(String(describing: response))")
                                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                                print("responseString = \(String(describing: responseString))")
                                downloadItems()
                            }
                            task.resume()
                            self.present(alertController, animated: true, completion: nil)
                            tableView.reloadData()
                            }
                        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                            }
                    alert.addTextField { [self] (alertTextField) in
                              alertTextField.placeholder = "Edit Task"
                        alertTextField.text = didselect
                              textField = alertTextField
                            }
                    alert.addTextField{[self](alartTextField) in
                        alartTextField.placeholder = "Edit Task Date"
                        datePicker.datePickerMode = .date
                          let toolbar = UIToolbar();
                          toolbar.sizeToFit()
                          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
                        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
                        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
                        alartTextField.inputAccessoryView = toolbar
                        alartTextField.inputView = datePicker
                        alartTextField.text = TaskDates[indexPath.row]
                        txtDatePicker = alartTextField

                    }
                           
                    alert.addAction(action)
                    alert.addAction(cancel)
                            present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Alert", message: "Fill All Fields", preferredStyle: UIAlertController.Style.alert)
                    let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
                        }
                    alert.addAction(cancel)
                    present(alert, animated: true, completion: nil)
                }
    }
    @objc func donedatePicker(){
       let formatter = DateFormatter()
       formatter.dateFormat = "yyyy-MM-dd"
       txtDatePicker.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
     }

     @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }

}
struct CompletedAdded{
    var CategoryImage:UIImage?
     var TaskName:String?
     var TaskDate:String?
     var FavouriteStatus:String?
     var Category:String?
    var Id:String?
}


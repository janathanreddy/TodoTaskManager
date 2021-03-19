//
//  PendingViewController.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 11/03/21.
//

import UIKit

class PendingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var View1: UIView!
    private var Pending = [PendingAdded]()
    var didselect:String?
    var didselectDate:String?
    var txtDatePicker = UITextField()
    let datePicker = UIDatePicker()
    var username:String?
    var TaskDates:[String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Pending.count
    }
    override func viewWillAppear(_ animated: Bool) {
        Pending.removeAll()
        downloadItems()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 70
        let PendingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PendingTableViewCell", for: indexPath) as! PendingTableViewCell
        PendingTableViewCell.PendingButton.tag = indexPath.row

        PendingTableViewCell.PendingButton.addTarget(self, action: #selector(FavouriteAction(sender:)), for:.touchUpInside )
        PendingTableViewCell.TaskName.text = Pending[indexPath.row].TaskName
        PendingTableViewCell.TaskDate.text = Pending[indexPath.row].TaskDate
        if Pending[indexPath.row].Category == "Home"{
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 35")
        }else if Pending[indexPath.row].Category == "Shopping" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 24")
        }else if Pending[indexPath.row].Category == "Expense" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 25")
        }else if Pending[indexPath.row].Category == "inbox" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 26")
        }else if Pending[indexPath.row].Category == "Personal Notes" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 29")
        }else if Pending[indexPath.row].Category == "Personal Diary" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 28")
        }else if Pending[indexPath.row].Category == "Appointment" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 35")
        }else if Pending[indexPath.row].Category == "Tasks" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 31")
        }else if Pending[indexPath.row].Category == "Business" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 27")
        }else if Pending[indexPath.row].Category == "Travel" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 33")
        }else if Pending[indexPath.row].Category == "Gift" {
            PendingTableViewCell.Categoryimage.image = UIImage(named: "Group 34")
        }

        if Pending[indexPath.row].FavouriteStatus == "Favourite"{
            PendingTableViewCell.PendingButton.setImage(UIImage(named: "Path"), for: .normal)
        }else{
            PendingTableViewCell.PendingButton.setImage(UIImage(named: "Heart unchecked"), for: .normal)
        }
        
        PendingTableViewCell.contentView.backgroundColor = UIColor.clear
        PendingTableViewCell.View1.layer.cornerRadius = 8
        PendingTableViewCell.View1.layer.masksToBounds = false
        PendingTableViewCell.View1.layer.shadowRadius = 4
        PendingTableViewCell.View1.layer.shadowOpacity = 1
        PendingTableViewCell.View1.layer.shadowColor = #colorLiteral(red: 0.9157811174, green: 0.9157811174, blue: 0.9157811174, alpha: 1)
        PendingTableViewCell.View1.layer.shadowOffset = CGSize(width: 0 , height:10)
        
        return PendingTableViewCell
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
        let request = NSMutableURLRequest(url: NSURL(string:"https://appstudio.co/iOS/Pending_N.php")! as URL)
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
                Pending.append(PendingAdded(TaskName: TaskName,TaskDate: datetostring,FavouriteStatus: FavouriteStatus,Category:Category,Id: Id))
                print("Pending : \(Pending)")
                }
            }
        DispatchQueue.main.async(execute: { [self] () -> Void in
                itemsDownloaded(items: stocks)
            if self.Pending.count > 0{
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
                    let postString = "TaskName=\(Pending[indexPath.row].TaskName ?? "")"
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
                    Pending.remove(at: indexPath.row)
                               tableView.deleteRows(at: [indexPath], with: .fade)
                    if self.Pending.count > 0{
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
    
    @objc func FavouriteAction(sender:UIButton){
        print("Edit Button Tapped")
        let tag = sender.tag
        let indexPath = IndexPath(row: tag, section: 0)
        if sender.isSelected{
            sender.isSelected = false
            sender.setImage(UIImage(named: "Heart unchecked"), for: .normal)
            // Namo sever Link "http://con.test:8888/update.php"
            let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/FavouriteStatus.php")! as URL)
            request.httpMethod = "POST"
            let postString = "TaskName=\(Pending[indexPath.row].TaskName!)&FavouriteStatus=Not Favourite"
            print("postString : \(postString)")
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil {
                    print("error=\(String(describing: error))")
                    return
                }
                print("response = \(String(describing: response))")
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString = \(String(describing: responseString))")
                print("Checked Deselected")
                
            }
            task.resume()
        }else{
            sender.isSelected = true
            sender.setImage(UIImage(named: "Path"), for: .normal)
            let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/FavouriteStatus.php")! as URL)
            request.httpMethod = "POST"
            let postString = "TaskName=\(Pending[indexPath.row].TaskName!)&FavouriteStatus=Favourite"
            print("postString \(postString)")
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil {
                    print("error=\(String(describing: error))")
                    return
                }
                print("response = \(String(describing: response))")
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString = \(String(describing: responseString))")
                print("Checked Selected")
            }
            task.resume()
         }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var textField = UITextField()
        didselect = "\(Pending[indexPath.row].TaskName!)"
        didselectDate = "\(Pending[indexPath.row].TaskDate!)"
        print("UpdateFunction \(Int16(Pending[indexPath.row].Id!)!)")
                if   textField.text!.trimmingCharacters(in: .whitespaces).isEmpty{

                        let alert = UIAlertController(title: "Edit Task", message: "", preferredStyle: UIAlertController.Style.alert)
                        let action = UIAlertAction(title: "update", style: UIAlertAction.Style.default) { [self](action) in
                            let alertController = UIAlertController(title: "Edit", message: "Updation Done", preferredStyle: UIAlertController.Style.alert)
                            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil))
                            
                            // namo link sever "http://con.test:8888/Task.php"
                            
                            let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/Edit_N.php")! as URL)
                            request.httpMethod = "POST"
                            let postString = "TaskName=\(textField.text as! String)&Id=\(Int16(Pending[indexPath.row].Id as! String) as! Int16)&TaskDate=\(txtDatePicker.text!)"
                            print("EditpostString : \(postString)")

                            request.httpBody = postString.data(using: String.Encoding.utf8)
                            Pending.removeAll()

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
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let CompletedAction = UIContextualAction(style: .normal, title:  "Close", handler: {[self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
             print("OK, marked as Closed")
            let requesting = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/update_N.php")! as URL)
            requesting.httpMethod = "POST"
            let postStr = "TaskName=\(Pending[indexPath.row].TaskName!)&TaskStatus=Completed"
            print("leadingSwipeActions \(postStr)")
            requesting.httpBody = postStr.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: requesting as URLRequest) {
                data, response, error in
                if error != nil {
                    print("error=\(String(describing: error))")
                    return
                }
                print("response = \(String(describing: response))")
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString = \(String(describing: responseString))")
                print("Checked Selected")
            }
            task.resume()
            
             success(true)
         })
       //  closeAction.image = UIImage(named: "tick")
        CompletedAction.title = "Completed"
        CompletedAction.backgroundColor = #colorLiteral(red: 0.4156862745, green: 0.9215686275, blue: 0.7215686275, alpha: 1)

         return UISwipeActionsConfiguration(actions: [CompletedAction])
    }
}

struct PendingAdded {
    var CategoryImage:UIImage?
     var TaskName:String?
     var TaskDate:String?
     var FavouriteStatus:String?
     var Category:String?
    var Id:String?
}

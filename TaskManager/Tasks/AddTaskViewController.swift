//
//  AddTaskViewController.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 11/03/21.
//

import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet weak var Shopbtn: UIButton!
    @IBOutlet weak var ExpenseBtn: UIButton!
    @IBOutlet weak var inboxbtn: UIButton!
    @IBOutlet weak var Notesbtn: UIButton!
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var Homebtn: UIButton!
    @IBOutlet weak var Giftbtn: UIButton!
    @IBOutlet weak var TravelBtn: UIButton!
    @IBOutlet weak var BusinessBtn: UIButton!
    @IBOutlet weak var TasksBtn: UIButton!
    @IBOutlet weak var Appointmetsbtn: UIButton!
    @IBOutlet weak var diarys: UIButton!
    @IBOutlet weak var TaskName: UITextField!
    @IBOutlet weak var addbtton: UIButton!
    @IBOutlet weak var ChooseDate: UITextField!
    private var taskCategory:String?
    var datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        View1.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        View1.layer.shadowOffset = CGSize(width: 0, height: 10)
        View1.layer.shadowOpacity = 1.0
        View1.layer.shadowRadius = 4.0
        View1.layer.cornerRadius = 6.0
        View1.layer.masksToBounds = false
        addbtton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        addbtton.layer.shadowOffset = CGSize(width: 0, height: 3)
        addbtton.layer.shadowOpacity = 1.0
        addbtton.layer.shadowRadius = 10.0
        addbtton.layer.masksToBounds = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        doneselect()
        datepicker()
        TaskName.layer.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        TaskName.layer.borderWidth = 1.5
        TaskName.layer.cornerRadius = 5
        TaskName.borderStyle = .roundedRect
        TaskName.layer.masksToBounds = true
        ChooseDate.layer.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        ChooseDate.layer.borderWidth = 1.5
        ChooseDate.layer.cornerRadius = 5
        ChooseDate.borderStyle = .roundedRect
        ChooseDate.layer.masksToBounds = true
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func ShoppingAction(_ sender: Any) {
        
        Shopbtn.alpha = 1
        Shopbtn.layer.borderWidth = 1
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        
        taskCategory = "Shopping"
    }
    
    @IBAction func Dollar(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 1
        ExpenseBtn.layer.borderWidth = 1
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        taskCategory = "Expense"
    }
    
    @IBAction func inbox(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 1
        inboxbtn.layer.borderWidth = 1
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        taskCategory = "inbox"
    }
    
    @IBAction func Personal(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 1
        Notesbtn.layer.borderWidth = 1
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        taskCategory = "Personal Notes"
    }
    @IBAction func personalDiary(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 1
        diarys.layer.borderWidth = 1
        diarys.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        taskCategory = "Personal Diary"
    }
    
    @IBAction func Appointments(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 1
        Appointmetsbtn.layer.borderWidth = 1
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        taskCategory = "Appointment"
    }
    
    @IBAction func TasksCompleted(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 1
        TasksBtn.layer.borderWidth = 1
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)


        taskCategory = "Tasks"
    }
    
    @IBAction func Business(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 1
        BusinessBtn.layer.borderWidth = 1
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        taskCategory = "Business"
    }
    
    @IBAction func Travel(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 1
        TravelBtn.layer.borderWidth = 1
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        taskCategory = "Travel"
    }
    
    @IBAction func Gift(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 0.5
        Homebtn.layer.borderWidth = 0
        Homebtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Giftbtn.alpha = 1
        Giftbtn.layer.borderWidth = 1
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        taskCategory = "Gift"
    }
    
    @IBAction func Home(_ sender: Any) {
        
        Shopbtn.alpha = 0.5
        Shopbtn.layer.borderWidth = 0
        Shopbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        ExpenseBtn.alpha = 0.5
        ExpenseBtn.layer.borderWidth = 0
        ExpenseBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        inboxbtn.alpha = 0.5
        inboxbtn.layer.borderWidth = 0
        inboxbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Notesbtn.alpha = 0.5
        Notesbtn.layer.borderWidth = 0
        Notesbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Homebtn.alpha = 1
        Homebtn.layer.borderWidth = 1
        Homebtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        Giftbtn.alpha = 0.5
        Giftbtn.layer.borderWidth = 0
        Giftbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TravelBtn.alpha = 0.5
        TravelBtn.layer.borderWidth = 0
        TravelBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        Appointmetsbtn.alpha = 0.5
        Appointmetsbtn.layer.borderWidth = 0
        Appointmetsbtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        diarys.alpha = 0.5
        diarys.layer.borderWidth = 0
        diarys.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        BusinessBtn.alpha = 0.5
        BusinessBtn.layer.borderWidth = 0
        BusinessBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        TasksBtn.alpha = 0.5
        TasksBtn.layer.borderWidth = 0
        TasksBtn.layer.borderColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)

        taskCategory = "Home"
    }
    
    @IBAction func AddTask(_ sender: Any) {
        print("Button Tapped Add")
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {return}
        if !TaskName.text!.trimmingCharacters(in: .whitespaces).isEmpty && !ChooseDate.text!.trimmingCharacters(in: .whitespaces).isEmpty {
            let request = NSMutableURLRequest(url: NSURL(string: "https://appstudio.co/iOS/Task_N.php")! as URL)
            request.httpMethod = "POST"
            let postString = "TaskDate=\(ChooseDate.text ?? "2021-03-16")&username=\(email)&TaskName=\(TaskName.text!)&TaskStatus=Pending&FavouriteStatus=Not Favourite&Category=\(taskCategory ?? "Home")"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task1 = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil {
            print("error=\(String(describing: error))")
            return
            }
            print("response = \(String(describing: response))")
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(String(describing: responseString))")
            }
            task1.resume()
            TaskName.text = ""
            let alert = UIAlertController(title: "Task", message: "Task Added Successfully", preferredStyle: UIAlertController.Style.alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
                }
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Alert", message: "Fill Taskname and Taskdate", preferredStyle: UIAlertController.Style.alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
                }
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
       
    }
    
    func datepicker(){
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        let done=UIBarButtonItem(barButtonSystemItem: .done, target:nil, action:#selector(doneselect))
        toolbar.setItems([done], animated: false)
        ChooseDate.inputAccessoryView=toolbar
        ChooseDate.inputView=datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func doneselect(){
        let dateformat=DateFormatter()
        dateformat.dateStyle = .medium
        dateformat.timeStyle = .none
        dateformat.dateFormat = "yyyy-MM-dd"
        let datestring = dateformat.string(from: datePicker.date)
        print("datestring : \(datestring)")
        ChooseDate.text="\(datestring)"
        self.view.endEditing(true)
    }

    
}


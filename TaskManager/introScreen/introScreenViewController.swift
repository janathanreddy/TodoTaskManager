//
//  introScreenViewController.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 12/03/21.
//

import UIKit

class introScreenViewController: UIViewController{
    
   
    @IBOutlet weak var PageViewController: UIPageControl!
    private var image:[UIImage] = [#imageLiteral(resourceName: "undraw_completed_tasks_vs6q copy"),#imageLiteral(resourceName: "undraw_completed_tasks_vs6q copy"),#imageLiteral(resourceName: "undraw_completed_tasks_vs6q copy")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func introbutton(_ sender: Any) {
        performSegue(withIdentifier: "LoginScreen", sender: self)
    }
    
   
    
   
    
  

}

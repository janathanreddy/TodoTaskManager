//
//  Tabbar.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 10/03/21.
//

import UIKit

@available(iOS 11.0, *)
class Tabbar: UITabBarController {

    
    let button = UIButton.init(type: .custom)
    var username:String?
        override func viewDidLoad() {
            super.viewDidLoad()

            let defaults = UserDefaults.standard
//            // Do any additional setup after loading the view, typically from a nib.
//
////            button.setTitle("+", for: .normal)
////            button.setTitleColor(.black, for: .normal)
////            button.setTitleColor(.yellow, for: .highlighted)
//            button.layer.cornerRadius = 32
////            button.layer.borderWidth = 1
//        //    button.layer.borderColor = UIColor.yellow.cgColor
//            self.view.insertSubview(button, aboveSubview: self.tabBar)
//            let img = UIImage(named: "ADD TASK")
//            button.setImage(img , for: .normal)
//
//            UITabBar.appearance().tintColor = UIColor( red: CGFloat(255/255.0), green: CGFloat(99/255.0), blue: CGFloat(95/255.0), alpha: CGFloat(1.0) )
//            UITabBar.appearance().unselectedItemTintColor = UIColor.black
//            ( red: CGFloat(255/255.0), green: CGFloat(99/255.0), blue: CGFloat(95/255.0), alpha: CGFloat(1.0))

        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
//            // safe place to set the frame of button manually
//            button.frame = CGRect.init(x: self.tabBar.center.x - 70, y: self.view.bounds.height - 130, width: 130, height: 130)
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
  
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }

    
    }
    
   









    


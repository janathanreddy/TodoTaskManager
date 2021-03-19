//
//  IntroViewController.swift
//  TaskManager
//
//  Created by Janarthan Subburaj on 18/03/21.
//

import UIKit

class IntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var PAGECONTROL: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!

    var count = 0
    private var imagearr:[UIImage] = [#imageLiteral(resourceName: "undraw_completed_tasks_vs6q copy@4x"),#imageLiteral(resourceName: "onboardfav"),#imageLiteral(resourceName: "onboardcomplete")]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        PAGECONTROL.numberOfPages = 3
        PAGECONTROL.currentPage = 0
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageSide = self.collectionView.frame.width
            let offset = scrollView.contentOffset.x
            count = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        PAGECONTROL.currentPage = count
            print("currentPage " + count.description )
        }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagearr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! introScreenTableViewCell
        Cell.IntroImage.image = imagearr[indexPath.row]
        return Cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  250, height: 250)
    }
    @IBAction func Loginintro(_ sender: Any) {
        performSegue(withIdentifier: "LoginScreen", sender: self)
    }
    
    
}

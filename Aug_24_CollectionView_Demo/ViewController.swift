//
//  ViewController.swift
//  Aug_24_CollectionView_Demo
//
//  Created by Vishal Jagtap on 08/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var studentCollectionView: UICollectionView!
    var studentNames = ["Suhaan","Pallavi","Meghaa","Aniket", "Komal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        studentCollectionView.delegate = self
        studentCollectionView.dataSource = self
    }
}

extension ViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let studentCollectionViewCell = self.studentCollectionView.dequeueReusableCell(withReuseIdentifier: "StudentCollectionViewCell", for: indexPath) as! StudentCollectionViewCell
        
        studentCollectionViewCell.studentNameLabel.text = studentNames[indexPath.item]
        return studentCollectionViewCell
    }
}


extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
    
        print(screenWidth/3.0)
        
        return CGSize(width: screenWidth/3.0, height: screenWidth/3.0)
    }
}


extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}

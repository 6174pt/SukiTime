//
//  SuggestionViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/07/26.
//

import UIKit

class SuggestionViewController: UIViewController,CatchProtocol,UICollectionViewDataSource{
    
    var index:Int=0
    var carouselView:CarouselView!
    
    let saveData:UserDefaults=UserDefaults.standard
    var filteredArray:[[Any]]=[]
    var runArray:[Any]=[]
    var indexNumber:Int!
    
    
    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        
//        CarouselView(CollectionView)
        let width = self.view.frame.width
        let height = self.view.frame.height
        carouselView = CarouselView(frame: CGRect(x:0, y:0, width:width, height:height))
        carouselView.dataSource = self
        carouselView.center = CGPoint(x:width / 2,y: height / 2)
        self.view.addSubview(carouselView)
        
        
        
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        
    }
    
    
    func goRunVC() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let RunViewController = (storyBoard.instantiateViewController(identifier: "RunViewController")) as! RunViewController
        
        //何個目のタスクがクリックされたかどうか、の値をここでRunVCに渡す。
        RunViewController.indexnumber = indexNumber
        
        self.navigationController?.pushViewController(RunViewController, animated: true)
        
        }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
    
    }
    
    // セクションごとのセル数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        
            return filteredArray.count

    }
    
    // セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carousel", for: indexPath) as! CarouselCell
        cell.contentView.backgroundColor = UIColor.white
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.shadowOffset = CGSize(width: 1,height: 1)
        cell.contentView.layer.shadowColor = UIColor.gray.cgColor
        cell.contentView.layer.shadowOpacity = 0.7
        cell.contentView.layer.shadowRadius = 5
        
        
        configureCell(cell: cell, indexPath: indexPath)
        
        cell.delegate = self
        
        return cell
    }
    
    func configureCell(cell: CarouselCell,indexPath: IndexPath) {
        // indexを修正する
        let index = indexPath.row
        print(filteredArray[index])
        indexNumber = indexPath.row

        print("indexPath",index)
        print(filteredArray[indexNumber])
        print("--------------------------------------------")
        
        
        cell.countLabel.text = filteredArray[index][0] as? String
        cell.dateLabel.text = filteredArray[index][2] as? String

    }
    
    
}

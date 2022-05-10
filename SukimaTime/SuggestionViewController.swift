//
//  SuggestionViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/07/26.
//

import UIKit

class SuggestionViewController: UIViewController,CatchProtocol,UICollectionViewDataSource{
    
    var id:Int = 0
    
    var index:Int=1
    var carouselView:CarouselView!
    
    let saveData:UserDefaults=UserDefaults.standard
    var filteredArray:[[Any]]=[[]]
    var runArray:[Any]=[]
    var indexNumber:Int!
    
    //    @IBOutlet var decide:UIButton!
    @IBOutlet var nextbutton:UIButton!
    @IBOutlet var prevbutton:UIButton!
    //    var decide:UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        carouselView = CarouselView(frame: CGRect(x:0, y:0, width:width, height:height))
        
        carouselView.dataSource = self
        carouselView.center = CGPoint(x:width / 2,y: height / 2)
        self.view.addSubview(carouselView)
        
        
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        print(filteredArray)
        filteredArray.removeFirst()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        print(filteredArray)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func determine(){
        print(filteredArray[index])
        runArray += filteredArray[index]
        saveData.set(runArray, forKey: "run")
        print(runArray)
        
    }
    
    func goRunVC() {
        
        
        
        
//        let storyBoard: UIStoryboard = self.storyboard!
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let RunViewController = (storyBoard.instantiateViewController(identifier: "RunViewController")) as! RunViewController
        
        //何個目のタスクがクリックされたかどうか、の値をここでRunVCに渡す。
        RunViewController.indexnumber = indexNumber
        
//        self.present(RunViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(RunViewController, animated: true)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        if filteredArray[0].isEmpty{
            filteredArray.removeFirst()
        }else{
            
        }
    }
    
    // セクションごとのセル数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        print(filteredArray)
        
        if filteredArray[0].isEmpty{
            filteredArray.removeFirst()
        }else{
            
        }
        
        if filteredArray[0].isEmpty{
            return 0
        }else{
            return filteredArray.count
        }
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
        indexNumber = indexPath.row

        print(index)
        
        
        cell.countLabel.text = filteredArray[index][0] as? String
        cell.dateLabel.text = filteredArray[index][2] as? String

//        print(cell.contentView.layer.shadowOffset)
    }
    
    
}







/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



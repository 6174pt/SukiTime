//
//  SuggestionViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/07/26.
//

import UIKit

class SuggestionViewController: UIViewController /*, UICollectionViewDataSource*/ {

    
    
    @IBOutlet var uiView:UIView!
    /*@IBOutlet var todoLabel:UILabel!
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var dateLabel:UILabel!
    @IBOutlet weak var baseImageView:UIImageView!*/
//    @IBOutlet weak var collectionView:UICollectionView!
//    @IBOutlet weak var collectionViewFlowLayout:UICollectionViewFlowLayout!
    var index:Int=1
    var carouselView:CarouselView!
    
    let saveData:UserDefaults=UserDefaults.standard
    var filteredArray:[[Any]]=[[]]
    var runArray:[Any]=[]
    
    @IBOutlet var decide:UIButton!
    @IBOutlet var nextbutton:UIButton!
    @IBOutlet var prevbutton:UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        carouselView = CarouselView(frame: CGRect(x:0, y:0, width:width, height:height))
        carouselView.center = CGPoint(x:width / 2,y: height / 2)
        self.view.addSubview(carouselView)
        
        carouselView.scrollToFirstItem()
        
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        print(filteredArray)
        /*todoLabel.text=filteredArray[1][0] as? String
        timeLabel.text=filteredArray[1][1] as? String
        dateLabel.text=filteredArray[1][2] as? String*/
        filteredArray.removeFirst()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.dataSource = self
//        collectionView.backgroundColor = UIColor.systemGray6

        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        print(filteredArray)
        /*todoLabel.text=filteredArray[1][0] as? String
        timeLabel.text=filteredArray[1][1] as? String
        dateLabel.text=filteredArray[1][2] as? String?*/
        
        /*baseImageView.backgroundColor = .white
        baseImageView.frame=CGRect(x: view.frame.size.width/2-175, y: view.frame.size.height/2-175, width: 350, height: 350)
        baseImageView.layer.cornerRadius=10
        baseImageView.layer.shadowColor=UIColor.gray.cgColor
        baseImageView.layer.shadowOffset = CGSize(width: 2, height: 2 )
        baseImageView.layer.shadowOpacity = 0.5
        baseImageView.layer.shadowRadius = 10*/
        
        decide.frame=CGRect(x: view.frame.size.width/2-170, y: view.frame.size.height/2+200, width: 340, height: 40)
        decide.backgroundColor = UIColor(named: "Blue2")
        decide.setTitleColor(UIColor.white, for: UIControl.State.normal)
        decide.layer.cornerRadius = decide.frame.height/2
        decide.layer.shadowOffset = CGSize(width: 3, height: 3 )
        decide.layer.shadowOpacity = 0.5
        decide.layer.shadowRadius = 10
        decide.layer.shadowColor = UIColor.gray.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    /*func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(filteredArray.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let todo = cell.contentView.viewWithTag(1) as! UILabel
        let time = cell.contentView.viewWithTag(2) as! UILabel
        let date = cell.contentView.viewWithTag(3) as! UILabel
        cell.backgroundColor = .white
        cell.layer.cornerRadius=10
        cell.layer.shadowColor=UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 2, height: 2 )
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 10
        todo.text = filteredArray[indexPath.row][0] as? String
        time.text = filteredArray[indexPath.row][1] as? String
        date.text = filteredArray[indexPath.row][2] as? String
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: 300, height: 300)
        collectionViewFlowLayout.scrollDirection = .horizontal
//        collectionViewFlowLayout.minimumInteritemSpacing = 50
        collectionViewFlowLayout.minimumLineSpacing = 50
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 16, left: 50, bottom: 16, right: 50)

        return cell
    }*/
    
    /*@IBAction func next(){
        index=index+1
        if index > Int(filteredArray.count-1){
         index=1
        }
        todoLabel.text=filteredArray[index][0] as? String
        timeLabel.text=filteredArray[index][1] as? String
        dateLabel.text=filteredArray[index][2] as? String
        
    }
    
    @IBAction func prev(){
        index=index-1
        if index < 1 {
            index=Int(filteredArray.count-1)
        }
        todoLabel.text=filteredArray[index][0] as? String
        timeLabel.text=filteredArray[index][1] as? String
        dateLabel.text=filteredArray[index][2] as? String
    }*/
    
    @IBAction func determine(){
        print(filteredArray[index])
        runArray += filteredArray[index]
        saveData.set(runArray, forKey: "run")
        print(runArray)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

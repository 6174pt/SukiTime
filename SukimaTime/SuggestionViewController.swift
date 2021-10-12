//
//  SuggestionViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/07/26.
//

import UIKit

class SuggestionViewController: UIViewController {
    
    @IBOutlet var uiView:UIView!
    @IBOutlet var todoLabel:UILabel!
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var dateLabel:UILabel!
    @IBOutlet weak var baseImageView:UIImageView!
    var index:Int=1
    
    let saveData:UserDefaults=UserDefaults.standard
    var filteredArray:[[Any]]=[[]]
    var runArray:[Any]=[]
    
    @IBOutlet var decide:UIButton!
    @IBOutlet var nextbutton:UIButton!
    @IBOutlet var prevbutton:UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        print(filteredArray)
        todoLabel.text=filteredArray[1][0] as? String
        timeLabel.text=filteredArray[1][1] as? String
        dateLabel.text=filteredArray[1][2] as? String
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        print(filteredArray)
        todoLabel.text=filteredArray[1][0] as? String
        timeLabel.text=filteredArray[1][1] as? String
        dateLabel.text=filteredArray[1][2] as? String
        
        baseImageView.backgroundColor = .white
//        baseImageView.frame=CGRect(x: view.frame.size.width/2-175, y: view.frame.size.height/2-175, width: 350, height: 350)
        baseImageView.layer.cornerRadius=10
        baseImageView.layer.shadowColor=UIColor.gray.cgColor
        baseImageView.layer.shadowOffset = CGSize(width: 2, height: 2 )
        baseImageView.layer.shadowOpacity = 0.5
        baseImageView.layer.shadowRadius = 10
        
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
    
    @IBAction func next(){
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
    }
    
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

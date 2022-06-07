//
//  EndViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/08/03.
//

import UIKit

class EndViewController: UIViewController {
    
    @IBOutlet var todoLabel:UILabel!
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var dateLabel:UILabel!
    @IBOutlet weak var baseImageView:UIImageView!
    
    @IBOutlet var deletebutton:UIButton!
    @IBOutlet var retainbutton:UIButton!
    
    let saveData:UserDefaults=UserDefaults.standard
    var runArray:[Any]=[]
    var todoArray:[[Any]]=[[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("End")
        
        runArray=saveData.object(forKey: "run") as! [Any]
        print(runArray)
        print("-----------------------------")
        todoLabel.text=runArray[0] as? String
        timeLabel.text=runArray[1] as? String
        dateLabel.text=runArray[2] as? String
        
        baseImageView.backgroundColor = .white
        baseImageView.frame=CGRect(x: view.frame.size.width/2-175, y: view.frame.size.height/2-25, width: 350, height: 350)
        baseImageView.layer.cornerRadius=10
        baseImageView.layer.shadowColor=UIColor.gray.cgColor
        baseImageView.layer.shadowOffset = CGSize(width: 3, height: 3 )
        baseImageView.layer.shadowOpacity = 0.5
        baseImageView.layer.shadowRadius = 10
        
        setButton(button: deletebutton)
        deletebutton.backgroundColor=UIColor(named: "Blue2")
//        deletebutton.frame=CGRect(x: view.frame.size.width/2-170, y: view.frame.size.height/2+150, width: 340, height: 40)
        deletebutton.layer.cornerRadius=deletebutton.frame.height/2
        
        setButton(button: retainbutton)
        retainbutton.backgroundColor=UIColor(named: "Blue1")
//        retainbutton.frame=CGRect(x: view.frame.size.width/2-170, y: view.frame.size.height/2+215, width: 340, height: 40)
        retainbutton.layer.cornerRadius=retainbutton.frame.height/2
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        
        runArray=saveData.object(forKey: "run") as! [Any]
        todoLabel.text=runArray[0] as? String
        timeLabel.text=runArray[1] as? String
        dateLabel.text=runArray[2] as? String
        
    }
    
    func setButton(button: UIButton!){
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        button.layer.cornerRadius = 20
        button.layer.shadowOffset = CGSize(width: 3, height: 3 )
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.gray.cgColor
    }
    
    @IBAction func delete(){
        todoArray=saveData.object(forKey: "list") as! [[Any]]
        print("消す前",todoArray)
        for i in 0..<Int(todoArray.count) {
            if (todoArray[i][0] as! String) == (runArray[0] as! String) {
                if (todoArray[i][1] as! String) == (runArray[1] as! String){
                    if (todoArray[i][2] as! String) == (runArray[2] as! String){
                        print("消すやつ",todoArray[i])
                        todoArray.remove(at: i)
                        saveData.set(todoArray, forKey: "list")
                        print(("消した後",todoArray))
                        print("delete")
                        break
                    }
                }
            }
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func keep(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

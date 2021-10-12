//
//  SelectViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/07/26.
//

import UIKit

class SelectViewController: UIViewController {
    
    let saveData:UserDefaults=UserDefaults.standard
    var todoArray:[[Any]]=[[]]
    var filteredArray:[[Any]]=[[]]
    var checked5Array:[[Any]]=[[]]
    var checked10Array:[[Any]]=[[]]
    var checked15Array:[[Any]]=[[]]
    var checked30Array:[[Any]]=[[]]
    
    @IBOutlet weak var fiveminuts:UIButton!
    @IBOutlet var tenminuts:UIButton!
    @IBOutlet var fifteenminuts:UIButton!
    @IBOutlet var thirtyminuts:UIButton!
    @IBOutlet var label:UILabel!
    @IBOutlet var subLabel:UILabel!
    
    override func viewWillAppear(_ animated: Bool) {

        presentingViewController?.beginAppearanceTransition(false, animated: animated)

        super.viewWillAppear(animated)
        
        print("viewwillapper")
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        filteredArray=[[]]
        print(filteredArray)
        
        saveData.register(defaults: ["list": [[]] ])
        todoArray=saveData.object(forKey: "list") as! [[Any]]
        
        print(todoArray)
        
        if todoArray.count == 1{
            label.isHidden=false
            subLabel.isHidden=false
        }else{
            label.isHidden=true
            subLabel.isHidden=true
        }
        
        checked5Array=[[]]
        checked10Array=[[]]
        checked15Array=[[]]
        checked30Array=[[]]
        
        if todoArray.count == 1{
        }else{
            if todoArray.count == 2{
                for i in 1...1{
                    if Int(todoArray[i][1] as! String)! == 5{
                        checked5Array += [todoArray[i]]
                    }
                    if Int(todoArray[i][1] as! String)! == 10{
                        checked10Array += [todoArray[i]]
                    }
                    if Int(todoArray[i][1] as! String)! == 15{
                        checked15Array += [todoArray[i]]
                    }
                    if Int(todoArray[i][1] as! String)! == 30{
                        checked30Array += [todoArray[i]]
                    }
                }
            }else{
                for i in 1...Int(todoArray.count-1) {
                    if Int(todoArray[i][1] as! String)! == 5 {
                        checked5Array += [todoArray[i]]
                    }
                    if Int(todoArray[i][1] as! String)! == 10{
                        checked10Array += [todoArray[i]]
                    }
                    if Int(todoArray[i][1] as! String)! == 15{
                        checked15Array += [todoArray[i]]
                    }
                    if Int(todoArray[i][1] as! String)! == 30{
                        checked30Array += [todoArray[i]]
                    }
                }
            }
        }
        
        
        if checked5Array.count == 1{
            fiveminuts.isEnabled=false
            fiveminuts.alpha=0.5
        }else{
            fiveminuts.isEnabled=true
            fiveminuts.alpha=1.0
        }
        
        if checked10Array.count == 1{
            tenminuts.isEnabled=false
            tenminuts.alpha=0.5
        }else{
            tenminuts.isEnabled=true
            tenminuts.alpha=1.0
        }
        
        if checked15Array.count == 1{
            fifteenminuts.isEnabled=false
            fifteenminuts.alpha=0.5
        }else{
            fifteenminuts.isEnabled=true
            fifteenminuts.alpha=1.0
        }
        
        if checked30Array.count == 1{
            thirtyminuts.isEnabled=false
            thirtyminuts.alpha=0.5
        }else{
            thirtyminuts.isEnabled=true
            thirtyminuts.alpha=1.0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton(button: fiveminuts)
        fiveminuts.backgroundColor=UIColor(named: "Blue2")
//        fiveminuts.frame=CGRect(x: view.frame.size.width/2-165, y: view.frame.size.height/2-165, width: 150, height: 150)
        
        setButton(button: tenminuts)
        tenminuts.backgroundColor=UIColor(named: "Blue1")
//        tenminuts.frame=CGRect(x: view.frame.size.width/2+15, y: view.frame.size.height/2-165, width: 150, height: 150)
        
        setButton(button: fifteenminuts)
        fifteenminuts.backgroundColor=UIColor(named: "Blue1")
//        fifteenminuts.frame=CGRect(x: view.frame.size.width/2-165, y: view.frame.size.height/2+15, width: 150, height: 150)
        
        setButton(button: thirtyminuts)
        thirtyminuts.backgroundColor=UIColor(named: "Blue2")
//        thirtyminuts.frame=CGRect(x: view.frame.size.width/2+15, y: view.frame.size.height/2+15, width: 150, height: 150)
        
        
    }
    
    func setButton(button:UIButton!){
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 3, height: 3 )
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.gray.cgColor
    }
    
    
    @objc func get(){
        todoArray=saveData.object(forKey: "list") as! [[Any]]
        print(todoArray)
        todoArray.removeFirst()
        print(todoArray)
    }
    
    @IBAction func five(){
        self.get()
        for i in 0...Int(todoArray.count-1) {
            if Int(todoArray[i][1] as! String)! == 5 {
                filteredArray += [todoArray[i]]
                saveData.set(filteredArray, forKey: "filter")
            }
        }
        print(filteredArray)
    }
    
    @IBAction func ten(){
        self.get()
        for i in 0...Int(todoArray.count-1) {
            if Int(todoArray[i][1] as! String)! == 10 {
                filteredArray += [todoArray[i]]
                saveData.set(filteredArray, forKey: "filter")
            }
        }
        print(filteredArray)
    }
    
    @IBAction func fifteen(){
        self.get()
        for i in 0...Int(todoArray.count-1) {
            if Int(todoArray[i][1] as! String)! == 15 {
                filteredArray += [todoArray[i]]
                saveData.set(filteredArray, forKey: "filter")
            }
        }
        print(filteredArray)
    }
    
    @IBAction func thirty(){
        self.get()
        for i in 0...Int(todoArray.count-1) {
            if Int(todoArray[i][1] as! String)! == 30 {
                filteredArray += [todoArray[i]]
                saveData.set(filteredArray, forKey: "filter")
            }
        }
        print(filteredArray)
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

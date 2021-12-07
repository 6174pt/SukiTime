//
//  ToDoViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/07/26.
//


import Foundation
import UIKit

//protocol TodoViewControllerProtocol {
//    func viewDidDismiss()
//}

class ToDoViewController: UIViewController, UIAdaptivePresentationControllerDelegate{
    
//    var delegate: TodoViewControllerProtocol?
    
    @IBOutlet weak var todoTextField:UITextField!
    @IBOutlet weak var timeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var timeTextField:UITextField!
    @IBOutlet weak var dateTextField:UITextField!
    @IBOutlet weak var add:UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var baseImageView:UIImageView!
    var todonumber:Int=0
    var timenumber:Int=0
    var datenumber:Int=0
    
    var todoArray:[[Any]]=[[]]
    
    let saveData:UserDefaults=UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        presentationController?.delegate = self
        
        saveData.register(defaults: ["list": [[]] ])
        todoArray=saveData.object(forKey: "list") as! [[Any]]
        
        baseImageView.backgroundColor = .white
        baseImageView.frame=CGRect(x: view.frame.size.width/2-175, y: view.frame.size.height/2-175, width: 350, height: 350)
        baseImageView.layer.cornerRadius=10
        baseImageView.layer.shadowColor=UIColor.gray.cgColor
        baseImageView.layer.shadowOffset = CGSize(width: 3, height: 3 )
        baseImageView.layer.shadowOpacity = 0.5
        baseImageView.layer.shadowRadius = 10
        
        add.frame=CGRect(x: view.frame.size.width/2-170, y: view.frame.size.height/2+200, width: 340, height: 40)
        add.backgroundColor = UIColor(named: "Blue2")
        add.setTitleColor(UIColor.white, for: UIControl.State.normal)
        add.layer.cornerRadius = 20
        add.layer.shadowOffset = CGSize(width: 3, height: 3 )
        add.layer.shadowOpacity = 0.5
        add.layer.shadowRadius = 10
        add.layer.shadowColor = UIColor.gray.cgColor
        
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        
        add.isEnabled=false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        
//        print("\(type(of: self)): \(#function)")
        
        todoArray = saveData.object(forKey: "list") as! [[Any]]
        
        setNumber()
        timeTextField.isEnabled=false
        dateTextField.isEnabled=false
        
        }

    
    override func viewDidLayoutSubviews() {
            datePicker.subviews.forEach({ $0.subviews.forEach({ $0.removeFromSuperview() }) })
        }
    
    override func viewDidAppear(_ animated: Bool) {
//        print("\(type(of: self)): \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
        presentingViewController?.endAppearanceTransition()
    }

    
    func setNumber(){
        todoTextField.text=""
        timeTextField.text=""
        dateTextField.text=""
        todonumber=0
        timenumber=0
        datenumber=0
        saveData.set(todonumber, forKey: "todo")
        saveData.set(timenumber, forKey: "time")
        saveData.set(datenumber, forKey: "date")
    }
    
    func judgeNumber(){
        if todonumber == 0{
            add.isEnabled=false
        }else{
            if timenumber == 0{
                add.isEnabled=false
            }else{
                if datenumber == 0{
                    add.isEnabled=false
                }else{
                    add.isEnabled=true
                }
            }
        }
    }
    
    /*func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
//        print("\(type(of: self)): \(#function)")
        return true
    }
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
//        print("\(type(of: self)): \(#function)")
    }
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
//        print("\(type(of: self)): \(#function)")
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
//        print("\(type(of: self)): \(#function)")
//        delegate?.viewDidDismiss()
    }*/
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        self.dateTextField.text = self.format(date: datePicker.date)
        datenumber=1
        saveData.set(datenumber, forKey: "date")
        todonumber = saveData.object(forKey: "todo") as! Int
        timenumber = saveData.object(forKey: "time") as! Int
        judgeNumber()
        }
    
    func format(date:Date)->String{
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            let strDate = dateformatter.string(from: date)
            
            return strDate
        }
    
    @IBAction func tappedSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
                case 0:
                    self.timeTextField.text = "5"
                case 1:
                    self.timeTextField.text = "10"
                case 2:
                    self.timeTextField.text = "15"
                case 3:
                    self.timeTextField.text = "30"
                default:
                    self.timeTextField.text = "-"
                }
        timenumber=1
        saveData.set(timenumber, forKey: "time")
        todonumber = saveData.object(forKey: "todo") as! Int
        datenumber = saveData.object(forKey: "date") as! Int
        judgeNumber()
    }
    
    @IBAction func todoEditChanged(_ sender: Any) {
        todonumber=1
        saveData.set(todonumber, forKey: "todo")
        timenumber = saveData.object(forKey: "time") as! Int
        datenumber = saveData.object(forKey: "date") as! Int
        judgeNumber()
    }
    
    
    @IBAction func addData(){
        todoArray += [[todoTextField.text!, timeTextField.text!, dateTextField.text!]]
        saveData.set(todoArray, forKey: "list")
        setNumber()
        add.isEnabled=false
        print(todonumber)
        let alert: UIAlertController = UIAlertController(title: "完了", message: "ToDoが追加されました", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "OK", style: .default, handler: { action in }
            )
        )
        present(alert, animated: true, completion: nil)
     print(todoArray)
    }
    
    @IBAction func modoru(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func get(){
        todoArray=saveData.object(forKey: "list") as! [[Any]]
        print(todoArray)
    }
    
    @IBAction func reset(){
        todoArray.removeAll()
        todoArray += [[]]
        saveData.set(todoArray, forKey: "list")
        print(todoArray)
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

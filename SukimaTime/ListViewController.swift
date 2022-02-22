//
//  ListViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/10/09.
//

import UIKit

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    
    @IBOutlet weak var table:UITableView!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    var array:[[Any]]=[[]]
//    var minuteArray:[[Any]] = [[]]
    let saveData:UserDefaults=UserDefaults.standard
    var todoArray:[[Any]]=[[]]
    var checked5Array:[[Any]]=[[]]
    var checked10Array:[[Any]]=[[]]
    var checked15Array:[[Any]]=[[]]
    var checked30Array:[[Any]]=[[]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        set()

        table.dataSource = self
        table.delegate=self
        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator=false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
        
        
        table.reloadData()
        
        
        set()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          
        table.reloadData()
      }
    
    
    
    @objc func set(){
        
        print("set")
        todoArray=saveData.object(forKey: "list") as! [[Any]]
        print(todoArray)
        
        if todoArray.count >= 2 {
            if todoArray[0].isEmpty {
                todoArray.removeFirst()
            }
        }
        
        checked5Array = [[]]
        checked10Array = [[]]
        checked15Array = [[]]
        checked30Array = [[]]
        
        if todoArray.count == 1{
            if todoArray[0].isEmpty{
            }else{
                minutecheck()
            }
        }
        
        if todoArray.count >= 2{
            minutecheck()
        }
        
        array=todoArray
        
        print("todoArray")
        print(todoArray)

    }
    
    @objc func minutecheck(){
        print("minutecheck")
        for i in 0...Int(todoArray.count-1){
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
    }
    
    @IBAction func ValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            set()
        case 1:
            set()
            array = checked5Array
        case 2:
            set()
            array = checked10Array
        case 3:
            set()
            array = checked15Array
        case 4:
            set()
            array = checked30Array
        default:
            set()
        }
        
        if todoArray.count >= 2{
            if array[0].isEmpty{
                array.removeFirst()
            }
        }
        
        table.reloadData()
    }
    
//    tableviewのcellの幅
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat {
        return 100
    }
    
//    tableviewのcellの数：
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(array)
        
        if array.isEmpty{
            return 0
        }
        
        if array.count >= 2{
            if array[0].isEmpty{
                array.removeFirst()
                return array.count
            }else{
                return array.count
            }
        }else{
            if array[0].isEmpty{
                return 0
            }else{
                return 1
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=table.dequeueReusableCell(withIdentifier: "Cell") as! ToDoTVCTableViewCell
        
        print(array)
        cell.todoView.layer.cornerRadius=cell.todoView.frame.height/4
        cell.todoView.layer.shadowOffset = CGSize(width: 1, height: 1 )
        cell.todoView.layer.shadowOpacity = 0.2
        cell.todoView.layer.shadowRadius = 10
        cell.todoView.layer.shadowColor = UIColor.gray.cgColor
        cell.todoimg.layer.cornerRadius=cell.todoimg.frame.height/2
        cell.todoLabel?.text = array[indexPath.row][0] as? String
        cell.dateLabel?.text = array[indexPath.row][2] as? String
        cell.minuteLabel?.text = array[indexPath.row][1] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive,
                                        title: "Delete") { (action, view, completionHandler) in
            self.showAlert(deleteIndexPath: indexPath)
            completionHandler(true)
        }
        action.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
    
    func showAlert(deleteIndexPath indexPath: IndexPath) {
        let dialog = UIAlertController(title: "削除",
                                       message: "ToDoを削除しますか？",
                                       preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "削除", style: .default, handler: { (_) in
            
            
            for i in 0...Int(self.todoArray.count-1) {
                if (self.todoArray[i][0] as! String) == (self.array[indexPath.row][0] as! String) {
                    if (self.todoArray[i][1] as! String) == (self.array[indexPath.row][1] as! String){
                        if (self.todoArray[i][2] as! String) == (self.array[indexPath.row][2] as! String){
                            self.todoArray.remove(at: i)
                            self.saveData.set(self.todoArray, forKey: "list")
                            self.array.remove(at: indexPath.row)
                            self.table.deleteRows(at: [indexPath], with: .automatic)
                            
                            break
                        }
                    }
                }
            }
            self.set()

        }))
        dialog.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        self.present(dialog, animated: true, completion: nil)
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

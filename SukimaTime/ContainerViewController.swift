//
//  ContainerViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/10/09.
//

import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet var button:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius=button.frame.height/2
        button.layer.shadowOffset = CGSize(width: 3, height: 3 )
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.gray.cgColor
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func plus(_ sender: Any){
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "add") as! ToDoViewController
        
        nextView.presentationController?.delegate = self
        
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
    }
    
    
}

extension ContainerViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("dismiss")
        
//        ListViewController().segmentedControl.selectedSegmentIndex = 0
        ListViewController().set()
        if ListViewController().todoArray.count >= 2{
            if ListViewController().array[0].isEmpty{
                ListViewController().array.removeFirst()
            }
        }
        print(ListViewController().todoArray.count)
        
        ListViewController().table.reloadData()
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



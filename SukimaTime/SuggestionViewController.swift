//
//  SuggestionViewController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/07/26.
//

import UIKit

class SuggestionViewController: UIViewController,CatchProtocol{
    
    
    var id:Int = 0

    var index:Int=1
    var carouselView:CarouselView!
    
    let saveData:UserDefaults=UserDefaults.standard
    var filteredArray:[[Any]]=[[]]
    var runArray:[Any]=[]
    
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
    
    func catchData(id : Int) {
        if id == 0 {
            let baseVC = self
             let storyboard = UIStoryboard(name: "Hoge", bundle: nil)
             let vc = storyboard.instantiateViewController(withIdentifier: "Tameshi")
             let next = vc
             DispatchQueue.main.async {
                 next.modalPresentationStyle = .fullScreen
                 baseVC.present(next,animated: true)
             }
            
        }
            
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



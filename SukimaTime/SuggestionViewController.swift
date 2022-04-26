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
//             let storyboard = UIStoryboard(name: "Main", bundle: nil)

//            performSegue(withIdentifier: "Run", sender: nil)
            
            /*print(filteredArray[index])
            runArray += filteredArray[index]
            saveData.set(runArray, forKey: "run")
            print(runArray)
            
            let RunViewController = self.storyboard?.instantiateViewController(withIdentifier: "RunViewController") as! RunViewController
            self.present(RunViewController, animated: true, completion: nil)*/
            
//            let vc = storyboard.instantiateInitialViewController() as? RunViewController
//             let next = vc
            
//            next.modalPresentationStyle = .fullScreen
//            self.present(next, animated: true)
//            navigationController?.pushViewController(vc!, animated: true)
//             DispatchQueue.main.async {

//             }
            
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



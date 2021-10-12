//
//  SukimaTimeTabaBarController.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2021/08/27.
//

import UIKit

class SukimaTimeTabaBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
          UITabBar.appearance().backgroundImage = UIImage()
          UITabBar.appearance().shadowImage     = UIImage()
//          UITabBar.appearance().tintColor = UIColor(red:159/255, green:214/255, blue:224/255, alpha:1)

        // Do any additional setup after loading the view.
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

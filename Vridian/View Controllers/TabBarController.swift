//
//  TabBarController.swift
//  Vridian
//
//  Created by Eleanor on 1/23/19.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = ImpactNavController(rootViewController: ImpactViewController())
        
        firstViewController.tabBarItem = UITabBarItem(title: "Impact", image: UIImage(named: "impact-tab"), tag: 0)
        
        let secondViewController = LoggingNavController(rootViewController: LoggingViewController())
        
        secondViewController.tabBarItem = UITabBarItem(title: "Log", image: UIImage(named: "log-tab"), tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Karla-Bold", size: 11)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Karla-Bold", size: 11)!], for: .selected)
        
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().isOpaque = true
        
        viewControllers = tabBarList
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

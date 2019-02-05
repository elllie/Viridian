//
//  TypeAViewController.swift
//  Vridian
//
//  Created by Eleanor on 2/5/19.
//

import UIKit

class TypeAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let back = UIButton(frame: CGRect(x: 20, y: 50, width: 20, height: 40))
        back.setTitle("<", for: .normal)
        back.titleLabel?.font = UIFont(name: "Karla-Bold", size: 36)
        back.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        back.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.view.addSubview(back)
        
        let title = UILabel(frame: CGRect(x: 55, y: 50, width: 220, height: 40))
        title.font = UIFont(name: "Karla-Bold", size: 36)
        title.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(title)
    }
    
    @objc func backAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
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

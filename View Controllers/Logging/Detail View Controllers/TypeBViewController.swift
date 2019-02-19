//
//  TypeAViewController.swift
//  Vridian
//
//  Created by Eleanor on 2/5/19.
//

import UIKit

class TypeBViewController: UIViewController {
    
    var titleLabelText: String?
    var iconViewImage: UIImage?
    var howManyLabelText: String?
    let tipLabelIndent: String = "          "
    var tipLabelText: String?
    let twentyFive = (UIScreen.main.bounds.width) / 2.5 // this used to be /4 hence 25 but im too lazy to change the variable name
 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let back = UIButton(frame: CGRect(x: 20, y: 50, width: 20, height: 40))
        back.setTitle("<", for: .normal)
        back.titleLabel?.font = UIFont(name: "Karla-Bold", size: 36)
        back.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        back.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.view.addSubview(back)
        
        let done = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 100, y: 55, width: 60, height: 40))
        done.setTitle("Done", for: .normal)
        done.titleLabel?.font = UIFont(name: "Karla-Regular", size: 24)
        done.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        done.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        self.view.addSubview(done)
        
        let titleLabel = UILabel(frame: CGRect(x: 55, y: 50, width: (UIScreen.main.bounds.width - 150), height: 100))
        titleLabel.font = UIFont(name: "Karla-Bold", size: 36)
        titleLabel.text = titleLabelText
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(titleLabel)
        
        let iconView = UIImageView(frame: CGRect(x: 20, y: (titleLabel.frame.height + 75), width: UIScreen.main.bounds.width - 40, height: 100))
        iconView.image = iconViewImage
        iconView.contentMode = .scaleAspectFit
        iconView.isUserInteractionEnabled = false
        self.view.addSubview(iconView)
        
       // here is where I have a little picture
//        let thanksPic = UIImageView(frame: CGRect(x: ((twentyFive * 1.5) - 22.5), y: (titleLabel.frame.height + 75), width: 125, height: 100))
        
        let tip = UILabel(frame: CGRect(x: 55, y: (titleLabel.frame.height + 225), width: 25, height: 25))
        tip.font = UIFont(name: "Karla-Bold", size: 14)
        tip.text = "Tip:"
        tip.sizeToFit()
        self.view.addSubview(tip)
        
        let tipLabel = UILabel(frame: CGRect(x: 55, y: (titleLabel.frame.height + 225), width: UIScreen.main.bounds.width - 110, height: UIScreen.main.bounds.height - 475))
        tipLabel.text = String(tipLabelIndent + (tipLabelText ?? ""))
        tipLabel.font = UIFont(name: "Karla-Regular", size: 14)
        tipLabel.numberOfLines = 0
        tipLabel.sizeToFit()
        self.view.addSubview(tipLabel)
    }
    
    @objc func backAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonTapped(sender: UIButton!) {
        print(Activity.CurrentActivity?.name as Any)
        self.navigationController?.popViewController(animated: true)
    }


}


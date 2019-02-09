//
//  TypeAViewController.swift
//  Vridian
//
//  Created by Eleanor on 2/5/19.
//

import UIKit

class TypeAViewController: UIViewController, UITextFieldDelegate {
    
    var titleLabelText: String?
    var iconViewImage: UIImage?
    var howManyLabelText: String?
    var tipLabelText: String?
    let twentyFive = (UIScreen.main.bounds.width) / 2.5 // this used to be /4 hence 25 but im too lazy to change the variable name
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text ?? "ooo")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 2
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let back = UIButton(frame: CGRect(x: 20, y: 50, width: 20, height: 40))
        back.setTitle("<", for: .normal)
        back.titleLabel?.font = UIFont(name: "Karla-Bold", size: 36)
        back.setTitleColor(UIColor(named: "darkTint"), for: .normal)
        back.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.view.addSubview(back)
        
        let titleLabel = UILabel(frame: CGRect(x: 55, y: 50, width: (UIScreen.main.bounds.width - 100), height: 100))
        titleLabel.font = UIFont(name: "Karla-Bold", size: 36)
        titleLabel.text = titleLabelText
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(titleLabel)
        
        let iconView = UIImageView(frame: CGRect(x: 20, y: (titleLabel.frame.height + 75), width: twentyFive, height: 100))
        iconView.image = iconViewImage
        iconView.contentMode = .scaleAspectFit
        iconView.isUserInteractionEnabled = false
        self.view.addSubview(iconView)
        
        
        let howManyInput = UITextField(frame: CGRect(x: (twentyFive * 1.5), y: (titleLabel.frame.height + 125), width: 75, height: 50))
        howManyInput.drawPlaceholder(in: CGRect(x: (twentyFive * 1.5), y: (titleLabel.frame.height + 125), width: 75, height: 50))
        howManyInput.placeholder = "#"
        howManyInput.text = "1"
        howManyInput.textAlignment = .center
        howManyInput.font = UIFont(name: "Karla-Bold", size: 36)
        howManyInput.borderStyle = .roundedRect
        howManyInput.delegate = self
        howManyInput.keyboardType = .numberPad
        self.view.addSubview(howManyInput)
        
        let howManyLabel = UILabel(frame: CGRect(x: (howManyInput.frame.origin.x - 22.5), y: (titleLabel.frame.height + 75), width: 125, height: 50))
        howManyLabel.font = UIFont(name: "Karla-Bold", size: 14)
        howManyLabel.textAlignment = .center
        howManyLabel.numberOfLines = 0
        howManyLabel.text = howManyLabelText
        self.view.addSubview(howManyLabel)
        
        //tips
        
        print(Activity.CurrentActivity?.multiAdd ?? true) // assumes multi adder bc more common
    }
    
    @objc func backAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }


}


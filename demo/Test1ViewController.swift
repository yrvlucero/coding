//
//  ViewController.swift
//  demo
//
//  Created by Yngwie Reigh Vincent Lucero on 18/4/18.
//  Copyright © 2018 Yngwie Reigh Vincent Lucero. All rights reserved.
//

import UIKit

class Test1ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    var indeces = [String.Index]()
    var message = "Position: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func find(_ sender: Any) {
        view.endEditing(true)
        guard let string = textView.text else {
            return
        }
        if string.isEmpty {
            resultLabel.text = "Empty String"
            return
        }
        guard let index = findA(string: string, index: string.startIndex) else {
            resultLabel.text = "\(message) N/A"
            return
        }
        resultLabel.text = "\(message) \(index)"
    }
    
    func findA(string: String, index: String.Index) -> Int? {
        let character: Character = "a"
        if index == string.endIndex{
            return nil
        }
        
        if string[index] ==  character {
            return index.encodedOffset + 1
        }else{
            return findA(string: string, index: string.index(after: index))
        }
    }
    
}

extension UIViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


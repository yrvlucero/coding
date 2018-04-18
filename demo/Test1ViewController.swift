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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func find(_ sender: Any) {
        guard let index = findA(string: textView.text) else {
            resultLabel.text = "\(message) N/A"
            return
        }
        resultLabel.text = "\(message) \(index)"
    }
    
    func findA(string: String) -> Int? {
        let letter: Character = "a"
        return string.index(of: letter)?.encodedOffset.advanced(by: 1)
    }
    
}


//
//  Test2ViewController.swift
//  demo
//
//  Created by Yngwie Reigh Vincent Lucero on 18/4/18.
//  Copyright © 2018 Yngwie Reigh Vincent Lucero. All rights reserved.
//

import UIKit


class Test2ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func report(_ sender: Any) {
        view.endEditing(true)
        guard let string = textView.text else {
            return
        }
        guard let counts = countChar(string: string) else {
            return
        }
        displayCountsAsString(counts: counts)
    }

    
    func countChar(string: String) -> [Character: Int]? {
        let arr = string
        var counts: [Character: Int] = [:]
        
        for item in arr {
            counts[item] = (counts[item] ?? 0) + 1
        }
        return counts
    }
    
    func displayCountsAsString(counts: [Character: Int]) {
        var total = 0
        var string = "=========\n==Report==\n"
        for (key, value) in counts {
            string = "\(string)\(key): \(value)\n"
            total = total + value
        }
        string = "\(string)Total Characters: \(total)"
        resultLabel.text = string
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

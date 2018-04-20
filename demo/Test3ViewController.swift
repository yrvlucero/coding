//
//  Test3ViewController.swift
//  demo
//
//  Created by Yngwie Reigh Vincent Lucero on 18/4/18.
//  Copyright © 2018 Yngwie Reigh Vincent Lucero. All rights reserved.
//

import UIKit
import Expression


class Test3ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let message = calculateString(string: textView.text) {
            resultLabel.text = message
        }
    }
    
    func calculateString(string: String) -> String? {
        let expression = Expression(string)
        var message = ""
        do {
            var result = try expression.evaluate()
            if result.isInfinite {
                message = "Division by Zero"
                return message
            }
            result = result.rounded(.towardZero)
            message = String(result) ?? "N/A"
        }catch {
            //TO DO: Handle errors based on requirements or specifications
            message = "Syntax Error"
        }
        return message
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

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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(_ sender: Any) {
        let double = calculateString(string: textView.text)
    }
    
    func calculateString(string: String) -> Callback<Dou> {
        let expression = Expression(string)
        var message = ""
        do {
            let result = try expression.evaluate()
            return result
        }catch {
            let err: Expression.Error = error as! Expression.Error
            switch  err {
            case .undefinedSymbol:
                message = "Syntax Error"
                break
            case .unexpectedToken:
                message = "Syntax Error"
                break
            case .arityMismatch:
                message = "Syntax Error"
                break
            case .arrayBounds:
                message = "Syntax Error"
                break
            case .missingDelimiter:
                message = "Syntax Error"
                break
            case .message:
                message = "Syntax Error"
                break
            default:
                print("ERROR", err.description)
                break
            }
        }
        resultLabel.text = message
        return 0.0
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

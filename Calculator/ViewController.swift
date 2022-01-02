//
//  ViewController.swift
//  Calculator
//
//  Created by Connor Reed on 1/2/22.
//

import UIKit

class ViewController: UIViewController {
    var input:String = ""
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func addToInput(char:String){
        input += char;//add new char to end of input string
        //update display
        self.inputLabel.text = input
        
    }
    @IBAction func zeroPressed(_ sender: Any) {
        self.addToInput(char: "0");
    }
    @IBAction func calculate(_ sender: Any) {
        let res = evaluate(input: input)
        self.resultLabel.text = String(res)
    }
    

}


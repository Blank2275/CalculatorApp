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
    @IBAction func onePressed(_ sender: Any) {
        self.addToInput(char: "1");
    }
    @IBAction func twoPressed(_ sender: Any) {
        self.addToInput(char: "2");
    }
    @IBAction func threePressed(_ sender: Any) {
        self.addToInput(char: "3");
    }
    @IBAction func fourPressed(_ sender: Any) {
        self.addToInput(char: "4");
    }
    @IBAction func fivePressed(_ sender: Any) {
        self.addToInput(char: "5");
    }
    @IBAction func sixPressed(_ sender: Any) {
        self.addToInput(char: "6");
    }
    @IBAction func sevenPressed(_ sender: Any) {
        self.addToInput(char: "7");
    }
    @IBAction func eightPressed(_ sender: Any) {
        self.addToInput(char: "8");
    }
    @IBAction func ninePressed(_ sender: Any) {
        self.addToInput(char: "9");
    }
    @IBAction func dotPressed(_ sender: Any) {
        self.addToInput(char: ".");
    }
    @IBAction func powPressed(_ sender: Any) {
        self.addToInput(char: "^");
    }
    @IBAction func plusPressed(_ sender: Any) {
        self.addToInput(char: "+");
    }
    @IBAction func subPressed(_ sender: Any) {
        self.addToInput(char: "-");
    }
    @IBAction func timesPressed(_ sender: Any) {
        self.addToInput(char: "×");
    }
    @IBAction func divPressed(_ sender: Any) {
        self.addToInput(char: "÷");
    }
    @IBAction func negPressed(_ sender: Any) {
        self.addToInput(char: "˗");
    }
    @IBAction func openPressed(_ sender: Any) {
        self.addToInput(char: "(")
    }
    @IBAction func closePressed(_ sender: Any) {
        self.addToInput(char: ")")
    }
    
    //non character buttons
    @IBAction func clear(_ sender: Any) {
        self.input = ""
        self.inputLabel.text = ">"
        self.resultLabel.text = "result"
    }
    @IBAction func backspace(_ sender: Any) {
        if self.input.count > 0{
            self.input = String(self.input.dropLast(1))
            self.inputLabel.text = self.input
        }
        if self.input.count == 0{
            self.inputLabel.text = ">"
        }
    }
    @IBAction func calculate(_ sender: Any) {
        var res:Float = 0
        self.resultLabel.text = String(res)
    }
    

}


//
//  ViewController.swift
//  HoroscopeProject
//
//  Created by Oscar Victoria Gonzalez  on 1/13/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var horoscopeLabel: UILabel!
    
    private let list = ["aries","taurus","gemini", "cancer","leo","libra","scorpio","sagittarius","capricorn","aquarius","pisces"].sorted()
    
    
    private var listName: String?
    
    var horoscope: Horoscopes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        textField.delegate = self
        listName = list.first
        retrieve()
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customSegue" {
            guard let listVC = segue.destination as? HoroscopeVC else {
                fatalError("error")
            }
            listVC.title = self.listName
        }
    }
    
    @IBAction func submit(_ sender: UIButton) {
        self.performSegue(withIdentifier: "customSegue", sender: nil)
    }
    
    @IBAction func enter(_ sender: UIButton) {
        horoscopeLabel.text = "Horoscope: \(listName ?? "")"
        let name = textField.text?.capitalized
        let greeting = "Hello, \(name ?? "")!"
        nameLable.text = greeting
        resignFirstResponder()
        updateUI()
    
        
        
    }
    
    
    let defaults = UserDefaults.standard
    
    
    func updateUI() {
        defaults.set(textField.text, forKey: Keys.userName)
        defaults.set(horoscopeLabel.text, forKey: Keys.sign)
        defaults.set(listName, forKey: Keys.listName)
    }
    
    func retrieve() {
        let name = defaults.value(forKey: Keys.userName) as? String ?? ""
        nameLable.text = "Hello, \(name)"
        
        let signs = defaults.value(forKey: Keys.sign) as? String ?? ""
        horoscopeLabel.text = signs
        
        let list = defaults.value(forKey: Keys.listName) as? String ?? ""
        listName = list
        
    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        listName = list[row]
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
}

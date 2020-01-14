//
//  HoroscopeVC.swift
//  HoroscopeProject
//
//  Created by Oscar Victoria Gonzalez  on 1/13/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class HoroscopeVC: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    
    func loadHoroscope() {
        HoroscopeAPIClient.getHoroscopes(horoscope: title ?? "") { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let sign):
                DispatchQueue.main.async {
                    self.textView.text = sign.horoscope
                }
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHoroscope()
        
    }
    
    
    
}

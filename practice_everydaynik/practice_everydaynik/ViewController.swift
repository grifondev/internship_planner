//
//  ViewController.swift
//  practice_everydaynik
//
//  Created by Дмитрий Мицкевич on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var buttonTitle: String? = ""
    
    @IBOutlet weak var l01: UILabel!
    @IBAction func buttonsTime(_ sender: UIButton) {
        buttonTitle = sender.titleLabel?.text
        openDealWindow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func openDealWindow() {
        let windowDeal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dealScrn") as! dealScreen // 1
                
        self.addChild(windowDeal) // 2
        windowDeal.view.frame = self.view.frame  // 3
        self.view.addSubview(windowDeal.view) // 4
                
        windowDeal.didMove(toParent: self) // 5
        
        windowDeal.windowTime.text = buttonTitle!
    }


}


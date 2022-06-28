//
//  dealScreen.swift
//  practice_everydaynik
//
//  Created by Дмитрий Мицкевич on 28.06.2022.
//

import UIKit

class dealScreen: UIViewController {
    
    @IBOutlet weak var windowTime: UILabel!
    @IBOutlet weak var windowDate: UILabel!
    @IBOutlet weak var window: UIView!
    
    @IBAction func updateButton(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeWindowBeautiful()
    }
    
    
    func makeWindowBeautiful(){
        window.layer.cornerRadius = 25
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
}

//
//  CalendarCell.swift
//  everydaynik
//
//  Created by Дмитрий Мицкевич on 02.07.2022.
//  Copyright © 2022 Дмитрий Мицкевич. All rights reserved.
//

import UIKit

var previousButton: UIButton = UIButton()

class CalendarCell: UICollectionViewCell
{
    
    @IBAction func buttonDay(_ sender: UIButton)
    {
        makeThisDaySelected(sender)
    }
    @IBOutlet weak var buttonDayName: UIButton!
    
    func makeThisDaySelected(_ sender: UIButton)
    {
        previousButton.backgroundColor = UIColor.white
        sender.layer.cornerRadius = sender.frame.height / 2
        sender.clipsToBounds = true
        sender.backgroundColor = UIColor.blue
        previousButton = sender
        selectedFromCalendar.day = Int(sender.currentTitle!)!
    }
}

//
//  ViewController.swift
//  practice_everydaynik
//
//  Created by Дмитрий Мицкевич on 27.06.2022.
//

import UIKit

struct selectedDateByUser
{
    var day: Int = 1
    var month: String = "January"
    var year: String = "1970"
}

var selectedFromCalendar: selectedDateByUser = selectedDateByUser()

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var buttonTitle: String? = ""
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBAction func nextMonth(_ sender: Any)
    {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        previousButton.backgroundColor = UIColor.white
        setMonthView()
    }
    
    @IBAction func previousMonth(_ sender: Any)
    {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        previousButton.backgroundColor = UIColor.white
        setMonthView()
    }
    
    @IBOutlet weak var l01: UILabel!
    @IBAction func buttonsTime(_ sender: UIButton) {
        buttonTitle = sender.titleLabel?.text
        openDealWindow()
    }
    
    var selectedDate = Date()
    var totalSquares = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
        // Do any additional setup after loading the view.
    }
    
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setMonthView()
    {
        totalSquares.removeAll()
        
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while(count <= 42)
        {
            if(count <= startingSpaces || count - startingSpaces > daysInMonth)
            {
                totalSquares.append("")
            }
            else
            {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        selectedFromCalendar.month = CalendarHelper().monthString(date: selectedDate)
        selectedFromCalendar.year = CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        
        cell.buttonDayName.setTitle(totalSquares[indexPath.item], for: .normal)
        
        return cell
    }
    
    func openDealWindow() {
        let windowDeal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dealScrn") as! dealScreen
                
        self.addChild(windowDeal)
        windowDeal.view.frame = self.view.frame
        self.view.addSubview(windowDeal.view)
                
        windowDeal.didMove(toParent: self)
        
        windowDeal.windowTime.text = buttonTitle!
        windowDeal.windowDate.text = String(selectedFromCalendar.day) + " " + selectedFromCalendar.month + " " + selectedFromCalendar.year
    }

    
    override open var shouldAutorotate: Bool
    {
        return false
    }

}

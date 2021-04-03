//
//  ViewController.swift
//  Calender
//
//  Created by 朱偉綸 on 2021/3/28.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateCollectionView: UICollectionView!
    
    var calenderInfo:CalenderDateInfo?
    
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    let blue = UIColor(red: 176/255, green: 224/255, blue: 255/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
        
        calenderInfo = CalenderDateInfo(currentYear: currentYear, currentMonth: currentMonth, colorOfNormalCalender: blue, colorOfToday: UIColor.brown)
        setUp()
        
    }
    
    
    
    @IBAction func nextMonth(_ sender: UIButton) {
        calenderInfo!.currentMonth += 1
        if calenderInfo!.currentMonth == 13{
            calenderInfo!.currentMonth = 1
            calenderInfo!.currentYear += 1
        }
        setUp()
    }
    
    
    @IBAction func previousMonth(_ sender: UIButton) {
        calenderInfo!.currentMonth -= 1
        if calenderInfo!.currentMonth == 0{
            calenderInfo!.currentMonth = 12
            calenderInfo!.currentYear -= 1
        }
        setUp()
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calenderInfo!.numberOfDaysInThisMonth + calenderInfo!.howManyDaysShouldIAddFromFirstFrame
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        guard let textLabel = cell.contentView.subviews[0] as? UILabel else { return cell }

        textLabel.text = calenderInfo?.text(indexPathRow: indexPath.row)
        textLabel.textColor = calenderInfo?.textColor(indexPathRow: indexPath.row)
        cell.backgroundColor = calenderInfo?.backgroudColor(indexPathRow: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("chu")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (dateCollectionView.frame.size.width - 2 * 6) / 7
        return CGSize(width: width, height: (dateCollectionView.frame.size.height - 10) / 6)
    }
    
    func setUp(){
        dateLabel.text = calenderInfo!.MonthOfLabel
        dateCollectionView.reloadData()
    }


}


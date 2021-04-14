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
    @IBOutlet weak var weekLabel: UIStackView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var calenderInfo: CalenderDateInfo?
    var backgroundView: BackgroundView?
    
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    let colorOfCal = UIColor(hexString: "#FFFFCC", alpha: 1)
    let colorOfToday = UIColor(hexString: "#FFFF00", alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekLabel.arrangedSubviews.map {
            $0.backgroundColor = UIColor(hexString: "#FFCC00", alpha: 1)
        }
        buttonType()
        
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
        
        calenderInfo = CalenderDateInfo(currentYear: currentYear, currentMonth: currentMonth, colorOfNormalCalender: colorOfCal, colorOfToday: colorOfToday)
        
        backgroundView = BackgroundView()
        self.view.addSubview(backgroundView!)
        
        setUp()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backgroundView?.frame = UIScreen.main.bounds
        dateCollectionView.reloadData()
        print("test")
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
        return 42
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
        if calenderInfo!.ifActive(indexPathRow: indexPath.row){
            print("chu")
            backgroundView!.isHidden = false
            backgroundView!.checkIfisHidden = false
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (dateCollectionView.frame.size.width - 1 * 6) / 7
        var height = (dateCollectionView.frame.size.height - 5) / 6
        if deviceCurrentOrientation() == 5 || deviceCurrentOrientation() == 6{
            height =
                ((dateCollectionView.frame.size.height)/2 - 5) / 6
        }
        
        
        return CGSize(width: width, height: height)
    }
    
    func setUp(){
        dateLabel.text = calenderInfo!.MonthOfLabel
        dateCollectionView.reloadData()
    }
    
    func buttonType(){
        previousButton.layer.cornerRadius = 23
        nextButton.layer.cornerRadius = 23
        
        previousButton.backgroundColor = UIColor(hexString: "#f5f5f5", alpha: 0.5)
        nextButton.backgroundColor = UIColor(hexString: "#f5f5f5", alpha: 0.5)
    }
    
    func deviceCurrentOrientation() -> Int{
        let deviceCurrentOrientation: UIDeviceOrientation = UIDevice.current.orientation
        switch deviceCurrentOrientation {
            case .faceDown:
                print("faceDown...")
                return 1
            case .faceUp:
                print("faceUp...")
                return 2
            case .landscapeLeft:
                print("landscapeLeft...")
                return 3
            case .landscapeRight:
                print("landscapeRight...")
                return 4
            case .portrait:
                print("portrait...")
                return 5
            case .portraitUpsideDown:
                print("portraitUpsideDown...")
                return 6
            case .unknown:
                print("unknown...")
                return 7
            @unknown default:
                return 8
        }
    }
    
    
    


}


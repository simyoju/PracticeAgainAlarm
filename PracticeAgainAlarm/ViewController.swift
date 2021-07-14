//
//  ViewController.swift
//  Practice_Alarm
//
//  Created by simyo on 2021/07/09.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    let timerSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    var alarm:String?
    var current:String?
    
    @IBOutlet weak var currTimeLabel: UILabel!
    @IBOutlet weak var alarmTimeLabel: UILabel!
    @IBOutlet weak var forCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 아 아까 타이머 함수를 두개 써서 충돌난거구나
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timerSelector, userInfo: nil, repeats: true)
        
        //₩let playlist = Video()
//        playlist.Key = "y16yGwQR5nE"
//        videos.append(playlist)
    }
    
    
    @IBAction func setAlarm(sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        alarm = formatter.string(from: datePickerView.date)
        alarmTimeLabel.text = "알람: " + formatter.string(from: datePickerView.date)
    }
   
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        current = formatter.string(from: date as Date)
        currTimeLabel.text = "현재: " + formatter.string(from: date as Date)
        
        doAlarm()
    }
    
    func doAlarm() {
        if current != alarm {
            forCheck.text = "loading.."
        } else {
            forCheck.text = "done!!"
            getPlaylist()
        }
    }
    
    func getPlaylist(){
        let url = URL(string: "https://www.youtube.com/watch?v=y16yGwQR5nE")
        let safariView:SFSafariViewController = SFSafariViewController(url: url as! URL)
        present(safariView, animated: true, completion: nil)
    }
}


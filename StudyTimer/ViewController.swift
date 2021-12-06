//
//  ViewController.swift
//  StudyTimer
//
//  Created by 남지훈 on 2021/12/06.
//

import UIKit

enum TimerState{
    case start
    case pause
    case end
}


class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var toggleBtn: UIButton!
    
    var duration = 60
    var timer: DispatchSourceTimer?
    var timerState: TimerState = .end
    var currentSecond = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleBtn()
    }

    @IBAction func tapToggleBtn(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
       
        
        switch self.timerState {
        case .end:
            self.currentSecond = self.duration
            self.datePicker.isHidden = true
            self.outletHidden(isHidden: false)
            self.cancleBtn.isEnabled = true
            self.toggleBtn.isSelected = true
            self.timerState = .start
            self.startTimer()
        case .start:
            
            self.toggleBtn.isSelected = false
            self.timerState = .pause
            self.timer?.suspend()
        case .pause:
            self.toggleBtn.isSelected = true
            self.timerState = .start
            self.timer?.resume()
        default:
            break
        }
    }
    
    @IBAction func tapCancleBtn(_ sender: UIButton) {
        
        switch self.timerState {
        case .start, .pause:
            stopTimer()
           
        default:
            break
        }
    }
    
    
    func outletHidden(isHidden: Bool) {
        self.timeLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configureToggleBtn() {
        self.toggleBtn.setTitle("일시정지", for: .selected)
        self.toggleBtn.setTitle("시작", for: .normal)
    }
    
    
    func startTimer() {
        if self.timer == nil{
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(wallDeadline: .now(), repeating: 1)
            self.timer?.setEventHandler(handler: {[weak self] in
                self?.currentSecond -= 1
                if self?.currentSecond ?? 0 <= 0 {
                    self?.stopTimer()
                }
            })
        }
        self.timer?.resume()
    }
    
    
    func stopTimer() {
        if self.timerState == .pause {
            self.timer?.resume()
        }
        self.timer?.cancel()
        self.timer = nil
        
        self.datePicker.isHidden = false
        self.outletHidden(isHidden: true)
        self.cancleBtn.isEnabled = false
        self.toggleBtn.isSelected = false
        self.timerState = .end
    }
}


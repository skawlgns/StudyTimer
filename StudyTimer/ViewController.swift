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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleBtn()
    }

    @IBAction func tapToggleBtn(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
       
        
        switch self.timerState {
        case .end:
            self.datePicker.isHidden = true
            self.outletHidden(isHidden: false)
            self.cancleBtn.isEnabled = true
            self.toggleBtn.isSelected = true
            self.timerState = .start
        case .start:
            self.toggleBtn.isSelected = false
            self.timerState = .pause
            
        case .pause:
            self.toggleBtn.isSelected = true
            self.timerState = .start
        default:
            break
        }
    }
    
    @IBAction func tapCancleBtn(_ sender: UIButton) {
        
        switch self.timerState {
        case .start, .pause:
            self.datePicker.isHidden = false
            self.outletHidden(isHidden: true)
            self.cancleBtn.isEnabled = false
            self.toggleBtn.isSelected = false
            self.timerState = .end
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
    
}


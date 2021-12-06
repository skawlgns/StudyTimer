//
//  ViewController.swift
//  StudyTimer
//
//  Created by 남지훈 on 2021/12/06.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var toggleBtn: UIButton!
    
    var duration = 60
    var timer: DispatchSourceTimer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapToggleBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func tapCancleBtn(_ sender: UIButton) {
        
    }
    
    
}


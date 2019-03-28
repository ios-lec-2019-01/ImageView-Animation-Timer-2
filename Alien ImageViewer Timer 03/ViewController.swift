//
//  ViewController.swift
//  Alien ImageViewer Timer 03
//
//  Created by 김종현 on 28/03/2019.
//  Copyright © 2019 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var alienImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    var count = 1
    var isAnimating = false
    
    // Timer 객체 생성
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alienImageView.image = UIImage(named: "Image\(count)")
        countLabel.text = String(count)
    }

    @IBAction func playBtnPressed(_ sender: Any) {
        print("playBtnPressed")
       
        if isAnimating == true { return }
        else { isAnimating = true }
       
        myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
        myTimer.invalidate()
        
        isAnimating = false
    }
    
    @IBAction func stopBtnPressed(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        
        isAnimating = false
    }
    
    @objc func doAnimation() {
        
        if count == 5 {
            count = 0
        }
        count+=1
        
        alienImageView.image = UIImage(named: "Image\(count)")
        countLabel.text = String(count)
    }
    
    
}


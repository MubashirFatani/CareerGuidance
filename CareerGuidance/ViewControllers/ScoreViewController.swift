//
//  ScoreViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 17/05/2023.
//

import UIKit
import GradientCircularProgress

class ScoreViewController: UIViewController {

    @IBOutlet weak var lowView: UIView!
    @IBOutlet weak var AverageView: UIView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var highView: UIView!
    
    //MARK: Progress View porperties
    var score: Double = 1
    var timer: Timer?
    var v: Double = 0.0
    let progress = GradientCircularProgress()
    var progressView: UIView?
    var style = GreenLightStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addProgressView()
    }
    
    
    //MARK: Progress View helpers methods
    func addProgressView() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
        
        lowView.layer.cornerRadius = 25
        AverageView.layer.cornerRadius = 25
        highView.layer.cornerRadius = 25
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            if self.score >= 0 && self.score <= 39 {
                self.style.startArcColor = .red
                self.style.endArcColor = .red
            }
            else if self.score >= 40 && self.score <= 69 {
                self.style.startArcColor = UIColor(named: "CustomYellowColor")!
                self.style.endArcColor = UIColor(named: "CustomYellowColor")!
            }
            else {
                self.style.startArcColor = UIColor(named: "CustomGreenColor")!
                self.style.endArcColor = UIColor(named: "CustomGreenColor")!
            }
            self.style.baseLineWidth = 32
            
            self.progressView = self.progress.showAtRatio(frame: self.scoreView.bounds, display: true, style: self.style)
            self.progressView?.layer.cornerRadius = 12.0
            self.scoreView.addSubview(self.progressView!)
            
            self.startProgressAtRatio()
        }
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showUniversities(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UniversityDataViewController") as! UniversityDataViewController
        vc.studentPercentage = score
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func startProgressAtRatio() {
        v = 0.0
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(updateProgressAtRatio),
            userInfo: nil,
            repeats: true
        )
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    @objc func updateProgressAtRatio() {
        v += 0.01
        
        progress.updateRatio(CGFloat(v))
        
        if v > (score/100.0) {
            timer!.invalidate()
            
        }
    }


}

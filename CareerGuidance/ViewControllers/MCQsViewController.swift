//
//  MCQsViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 28/05/2023.
//

import UIKit

class MCQsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            let button = UIButton(type: .system)
            button.setTitle("SUBMIT", for: .normal)
            button.addTarget(self, action: #selector(self.btnSubmitTapped), for: .touchUpInside)
            button.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width * 0.4, height: 50)
            self.tableView.tableFooterView = button
        }
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func btnSubmitTapped() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScoreViewController")as! ScoreViewController
        vc.score = 62
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension MCQsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MCQsTableViewCell", for: indexPath) as! MCQsTableViewCell
        
        cell.lblQuestion.text = indexPath.row % 2 == 0 ? "\(indexPath.row + 1): Molecules of oxygen in the atmosphere absorb solar radiation in bands centred at about 80 nm, 650 nm and 1000 nm. In which parts of the electromagnetic spectrum are these absorption bands?" : "\(indexPath.row + 1): An asteroid of mass 103 kg is moving towards a space station at 1 m s1. It is proposed to stop it by firing a 1 MW laser at it. For how long must the laser be fired? You may assume that the surface of the asteroid is perfectly reflective, all photons are incident perpendicular to the surface of the asteroid, and a photon’s momentum is related to its energy by p = Ec , where c = 3 ⇥ 108 m s1 is the speed of light."
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension MCQsViewController: MCQsTableViewCellDelegate {
    func answerViewTapped(ansOption: Int, indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MCQsTableViewCell
        cell.imgOption1.image = UIImage(named:  ansOption == 1 ? "radioSelected" : "radioUnselected")
        cell.imgOption2.image = UIImage(named:  ansOption == 2 ? "radioSelected" : "radioUnselected")
        cell.imgOption3.image = UIImage(named:  ansOption == 3 ? "radioSelected" : "radioUnselected")
        cell.imgOption4.image = UIImage(named:  ansOption == 4 ? "radioSelected" : "radioUnselected")
    }
}

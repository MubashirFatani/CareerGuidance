//
//  MCQsViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 28/05/2023.
//

import UIKit
import FirebaseFirestore

enum AptitudeTestType {
    case ecat
    case mcat
}

class MCQsViewController: UIViewController {
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    var questionsArray: [QuestionDataClass] = []
    var testType: AptitudeTestType!
    var hsscPercentage: Double = 0.0
    
    var count = 1800
    var timer = Timer()
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        getQuestions()
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {

        if(count > 0){
            let minutes = String(format: "%.2d", count / 60)
            let seconds = String(format: "%.2d", count % 60)
            lblTime.text = minutes + ":" + seconds
            count -= 1
        }
        else {
            showResult()
        }
    }
    
    func getQuestions() {
        
        let storage = Firestore.firestore()
        storage.collection("Questions").getDocuments { snapshots, error in
            
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            guard let questions = snapshots?.documents else {
                print("No documents found")
                return
            }
            
            for question in questions {
                let questionData = question.data()
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: questionData, options: [])
                    let decoder = JSONDecoder()
                    let question = try decoder.decode(QuestionDataClass.self, from: jsonData)
                    if self.testType == .ecat {
                        if question.subject != "Biology" && question.subject != "Computer" {
                            self.questionsArray.append(question)
                        }
                    }
                    else if self.testType == .mcat {
                        if question.subject != "Maths" && question.subject != "Computer" {
                            self.questionsArray.append(question)
                        }
                    }
                    
                } catch {
                    print("Error decoding user: \(error)")
                }
            }
            self.questionsArray.shuffle()
            self.tableView.reloadData()
            self.startTimer()
        }
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    func calculateResult() -> Double {
        var correctAnswer = 0
        
        for question in questionsArray {
            if question.userSelectedAnswer == question.correctAnswer {
                correctAnswer += 1
            }
        }
        
        let ecatPercentage = (Double(correctAnswer) / Double(questionsArray.count)) * 100.0
        return (ecatPercentage * 0.55) + (hsscPercentage * 0.45)
    }
    
    func showResult() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScoreViewController")as! ScoreViewController
        vc.score = calculateResult()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnPrevTapped(_ sender: UIButton) {
        if questionIndex > 0 {
            questionIndex -= 1
            tableView.reloadData()
        }
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        if questionIndex < questionsArray.count - 1 {
            questionIndex += 1
            tableView.reloadData()
        }
    }
    
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
        showResult()
    }
}

extension MCQsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsArray.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MCQsTableViewCell", for: indexPath) as! MCQsTableViewCell
        
        let question = questionsArray[questionIndex]
        
        cell.lblQuestion.text = "\(questionIndex + 1). \(question.questions)"
        cell.lblOption1.text = question.answers[0]
        cell.lblOption2.text = question.answers[1]
        cell.lblOption3.text = question.answers[2]
        cell.lblOption4.text = question.answers[3]
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        cell.imgOption1.image = UIImage(named:  question.userSelectedAnswerIndex == 0 ? "radioSelected" : "radioUnselected")
        cell.imgOption2.image = UIImage(named:  question.userSelectedAnswerIndex == 1 ? "radioSelected" : "radioUnselected")
        cell.imgOption3.image = UIImage(named:  question.userSelectedAnswerIndex == 2 ? "radioSelected" : "radioUnselected")
        cell.imgOption4.image = UIImage(named:  question.userSelectedAnswerIndex == 3 ? "radioSelected" : "radioUnselected")
        
        btnSubmit.isHidden = questionIndex != questionsArray.count - 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension MCQsViewController: MCQsTableViewCellDelegate {
    func answerViewTapped(ansOption: Int, indexPath: IndexPath) {
        var question = self.questionsArray[questionIndex]
        question.userSelectedAnswer = question.answers[ansOption - 1]
        question.userSelectedAnswerIndex = ansOption - 1
        questionsArray[questionIndex] = question
        self.tableView.reloadData()
    }
}

//
//  QuestionDataClass.swift
//  CareerGuidance
//
//  Created by Murtaza on 11/06/2023.
//

import Foundation

struct QuestionDataClass: Decodable {
    
    let questions: String
    let answers: [String]
    let correctAnswer: String
    let sector: String
    let subject: String
    var userSelectedAnswer: String?
    var userSelectedAnswerIndex: Int?
    var selectedAnswerIndex: Int?
    
}

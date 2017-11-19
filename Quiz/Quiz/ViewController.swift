//
//  ViewController.swift
//  Quiz
//
//  Created by Jong-Yun on 2017. 11. 7..
//  Copyright © 2017년 Jong-Yun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    // 상수 : 질문들이 담긴 배열
    let questions: [String] = ["From what is cognac made?",
                               "What is 7+7?",
                               "What is the capital of Vermont?"]
    // 상수 : 답변들이 담긴 배열
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    // 질문의 배열 index 값
    var currentQuestionIndex: Int = 0
    
    // 다음 문제를 보여주는 버튼을 클릭했을 시의 액션
    @IBAction func showNextQuestion(sender: AnyObject){
        // 다음 질문을 위한 질문의 배열 index값을 증가시킨다.
        currentQuestionIndex += 1
        
        // 준비된 마지막 질문일 경우에 처음 질문을 보여주기 위해, 값을 초기화시킴
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        // 상수 : 질문은 현재 질문의 배열 index값으로 질문 레이블의 텍스트를 바꿔줌
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        // 질문이 변경되어, 답변 레이블의 텍스트값을 초기화시킴
        answerLabel.text = "???"
    }
    
    // 해당 질문의 답변을 보여주는 버튼
    @IBAction func showAnswer(sender: AnyObject){
        // 선택된 질문의 배열 index값으로 짝이 맞는 답변을 찾아냄
        let answer: String = answers[currentQuestionIndex]
        // 답변 레이블의 텍스트 값을 변경해줌
        answerLabel.text = answer
        
    }
    
    // viewDidLoad를 override 함
    override func viewDidLoad() {
        super.viewDidLoad()
        // view가 맨 처음 로드될때 질문 레이블에 첫 질문을 보여줌
        questionLabel.text = questions[currentQuestionIndex]
    }
    
}


//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Immanuella Umoren on 3/10/24.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var AnswerButton1: UIButton!
    @IBOutlet weak var AnswerButton2: UIButton!
    @IBOutlet weak var AnswerButton3: UIButton!
    @IBOutlet weak var AnswerButton4: UIButton!
    @IBOutlet weak var questionNumberAndCategoryLabel: UILabel!
    
    //Question Structure
    struct Question {
        let questionText: String
        let answers: [String]
        let correctAnswer: String
        let category: String
    }
    
    //Questions
    var questions = [
        Question(questionText: "What is 2+2?", answers: ["3", "4", "5", "6"], correctAnswer: "4", category: "Math"),
        Question(questionText: "Who wrote 'Hamlet'?", answers: ["Charles Dickens", "William Shakespeare", "Leo Tolstoy", "Mark Twain"], correctAnswer: "William Shakespeare", category: "Literature"),
        Question(questionText: "What is the capital of France?", answers: ["Berlin", "Madrid", "Paris", "Lisbon"], correctAnswer: "Paris", category: "Countries"),
        Question(questionText: "Which element has the chemical symbol 'O'?", answers: ["Gold", "Oxygen", "Silver", "Iron"], correctAnswer: "Oxygen", category: "Science"),
        Question(questionText: "In what year did the first man land on the Moon?", answers: ["1965", "1969", "1971", "1973"], correctAnswer: "1969", category: "History"),
        Question(questionText: "What is the largest planet in our Solar System?", answers: ["Earth", "Jupiter", "Mars", "Neptune"], correctAnswer: "Jupiter", category: "Science"),
        Question(questionText: "What is the process by which plants make their food?", answers: ["Photosynthesis", "Respiration", "Digestion", "Transpiration"], correctAnswer: "Photosynthesis", category: "Biology"),
        Question(questionText: "What is the hardest natural substance on Earth?", answers: ["Gold", "Iron", "Diamond", "Quartz"], correctAnswer: "Diamond", category: "Science"),
        Question(questionText: "Who is known as the father of computers?", answers: ["Charles Babbage", "Alan Turing", "Bill Gates", "Steve Jobs"], correctAnswer: "Charles Babbage", category: "History"),
        Question(questionText: "What is the boiling point of water?", answers: ["90°C", "95°C", "100°C", "105°C"], correctAnswer: "100°C", category: "Science"),
    ]
    
    
    var currentQuestionIndex = 0
    var score = 0
    
    
    func loadQuestion() {
        if currentQuestionIndex < questions.count {
            let currentQuestion = questions[currentQuestionIndex]
            QuestionLabel.text = currentQuestion.questionText
            questionNumberAndCategoryLabel.text = "Question: \(currentQuestionIndex + 1)/\(questions.count)  \n\(currentQuestion.category)"
                    
            
            AnswerButton1.setTitle(currentQuestion.answers[0], for: .normal)
            AnswerButton2.setTitle(currentQuestion.answers[1], for: .normal)
            AnswerButton3.setTitle(currentQuestion.answers[2], for: .normal)
            AnswerButton4.setTitle(currentQuestion.answers[3], for: .normal)
        } else {
            
        }
    }
    
    
    func showFinalScore(){
        let alert = UIAlertController(title: "Quiz Complete", message: "Your score is \(score)/\(questions.count).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            // Reset the quiz
            self.restartQuiz()
        }))
        self.present(alert, animated: true)
    }
    
    func restartQuiz(){
            currentQuestionIndex = 0
            score = 0
            
            loadQuestion()
    }
    
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == questions[currentQuestionIndex].correctAnswer {
            score += 1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            sender.backgroundColor = UIColor.clear
            
            if self.currentQuestionIndex < self.questions.count - 1 {
                self.currentQuestionIndex += 1
                self.loadQuestion()
            } else {
                self.showFinalScore()
            }
            
            
        }
    }
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadQuestion()
        QuestionLabel.layer.cornerRadius = 10
        QuestionLabel.layer.masksToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

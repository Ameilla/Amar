//
//  t_ques_8.swift
//  MOCA
//
//  Created by Amar Dwarakacherla on 04/03/24.
//

import UIKit

class t_ques_8: UIViewController {
    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var nextbar: UIView!
    @IBOutlet weak var submitButtonTapped: UIButton!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    var id: String?
    var task1=0
    var task2=0
    var task3=0
    var task4=0
    var task5=0
    var img = UIImage()
    var image = UIImage()

    @IBOutlet weak var quesContent: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet var optionButtons: [UIButton]!
    var QuestionTrial1 : QuestionModel?
    var selectedOption: String?
    var correctAnswer: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bar.layer.cornerRadius = 25
        bar.layer.masksToBounds=true
        nextbar.layer.cornerRadius = 17
        print(id ?? "")
        option4.layer.cornerRadius = 10
        option2.layer.cornerRadius = 10
        option3.layer.cornerRadius = 10
        option1.layer.cornerRadius = 10
        option1.layer.borderWidth = 1.0
        option2.layer.borderWidth = 1.0
        option3.layer.borderWidth = 1.0
        option4.layer.borderWidth = 1.0
        submitButtonTapped.layer.cornerRadius = 10
        GetAPI()

       
    }
    func GetAPI() {
        let apiURL = APIList.t_QuestionsApi
        print(apiURL)
        APIHandler().getAPIValues(type: QuestionModel.self, apiUrl: apiURL, method: "GET") { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.QuestionTrial1 = data
                    let questionIndex = 7
                    let question = self.QuestionTrial1?.questions[questionIndex]
                    self.quesLabel.text = question?.question
                    self.type.text = question?.type
                    self.quesContent.text = question?.quesContent
                    self.optionButtons[0].setTitle(question?.options[0] ?? "", for: .normal)
                    self.optionButtons[1].setTitle(question?.options[1] ?? "", for: .normal)
                    self.optionButtons[2].setTitle(question?.options[2] ?? "", for: .normal)
                    self.optionButtons[3].setTitle(question?.options[3] ?? "", for: .normal)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Warning", message: "Something Went Wrong", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .destructive) { _ in
                        print("API Error")
                    })
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
    }
    
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        // Deselect all buttons
        let buttonBackgroundColor = UIColor(
            red: CGFloat(0xD0) / 255.0,
            green: CGFloat(0xED) / 255.0,
            blue: CGFloat(0xCD) / 255.0,
            alpha: 1.0
        )
        for button in optionButtons {
            button.isSelected = false
            button.backgroundColor = buttonBackgroundColor
            button.setTitleColor(.black, for: .normal) // Set text color to black for better visibility
        }
        
        // Select the tapped button
        sender.isSelected = true
        sender.backgroundColor = .green
        // Store the selected option
        selectedOption = sender.title(for: .normal)
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let selectedOption = selectedOption, let correctAnswer = self.QuestionTrial1?.questions[7].answer else {
            // No option selected or question data not available
            print("Please select an option.")
            return
        }
        print("Selected Option: \(selectedOption)")
            print("Correct Answer: \(correctAnswer)")
        if selectedOption == correctAnswer{
            task5=task5+3
            // Correct option selected
            print("Correct option selected.")
        } else {
            // Incorrect option selected
            print("Incorrect.")
        }
        if let imageData = img.pngData() {
            print("Image Data: \(imageData)")
        } else {
            print("Failed to convert image to data.")
        }
        let storyBoard: UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "t_ques_9") as! t_ques_9
        vc.id=id
        vc.task1=task1
        vc.task2=task2
        vc.task3=task3
        vc.task4=task4
        vc.task5=task5
        vc.img = img
        vc.image=image
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


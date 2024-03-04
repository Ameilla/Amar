

import UIKit

class t_ques_1: UIViewController {

    var id: String?
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var op3: UIImageView!
    @IBOutlet weak var Op2: UIImageView!
    @IBOutlet weak var r5: UIView!
    @IBOutlet weak var r4: UIView!
    @IBOutlet weak var r3: UIView!
    @IBOutlet weak var r2: UIView!
    @IBOutlet weak var r1: UIView!
    @IBOutlet weak var nextbar: UIView!
    @IBOutlet weak var op1: UIImageView!
    @IBOutlet weak var next1: UIButton!
    @IBOutlet weak var bor: UIView!
    
    @IBOutlet var optionButtons: [UIButton]!
    var QuestionTrial1 : QuestionModel?
    var selectedOption: String?
    var correctAnswer: String?
    var task1=0

    override func viewDidLoad() {
        super.viewDidLoad()
        print(id ?? "")
        
        self.navigationController?.isNavigationBarHidden=true

        bor.layer.cornerRadius = 25
        bor.layer.masksToBounds=true
        nextbar.layer.cornerRadius = 17
        r1.layer.cornerRadius=r1.frame.height/2;
        r2.layer.cornerRadius=r2.frame.height/2;
        r3.layer.cornerRadius=r3.frame.height/2;
        r4.layer.cornerRadius=r4.frame.height/2;
        r5.layer.cornerRadius=r5.frame.height/2;
        next1.layer.cornerRadius = 10
        op1.alpha = 0.2
        Op2.alpha = 0.1
        op3.alpha = 0.2
        
        option4.layer.cornerRadius = 10
        option2.layer.cornerRadius = 10
        option3.layer.cornerRadius = 10
        option1.layer.cornerRadius = 10
        
        option1.layer.borderWidth = 1.0
        option2.layer.borderWidth = 1.0
        option3.layer.borderWidth = 1.0
        option4.layer.borderWidth = 1.0
        GetAPI()
        
//        optionA.layer.cornerRadius=optionA.frame.height/2;
//        optionB.layer.cornerRadius=optionB.frame.height/2;
//        optionC.layer.cornerRadius=optionC.frame.height/2;
//        optionD.layer.cornerRadius=optionD.frame.height/2;
//
//        option1.layer.cornerRadius = 15
//        option2.layer.cornerRadius = 15
//        option3.layer.cornerRadius = 15
//        option4.layer.cornerRadius = 15
        
    }
    func GetAPI() {
        let apiURL = APIList.t_QuestionsApi

        // Prepare POST parameters if needed
        let parameters: [String: String] = [:
            // Add your POST parameters here if required
            // "key1": value1,
            // "key2": value2,
        ]

        APIHandler().postAPIValues(type: QuestionModel.self, apiUrl: apiURL, method: "POST", formData: parameters) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.QuestionTrial1 = data
                    let questionIndex = 0
                    let question = self.QuestionTrial1?.questions[questionIndex]
                    self.quesLabel.text = question?.question
                    self.optionButtons[0].setTitle(question?.options[0] ?? "", for: .normal)
                    self.optionButtons[1].setTitle(question?.options[1] ?? "", for: .normal)
                    self.optionButtons[2].setTitle(question?.options[2] ?? "", for: .normal)
                    self.optionButtons[3].setTitle(question?.options[3] ?? "", for: .normal)
                    self.type.text = question?.type
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
            button.setTitleColor(.black, for: .normal)
        }
        // Select the tapped button
        sender.isSelected = true
        sender.backgroundColor = .green
        // Store the selected option
        selectedOption = sender.title(for: .normal)
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let selectedOption = selectedOption, let correctAnswer = self.QuestionTrial1?.questions[0].answer else {
            // No option selected or question data not available
            print("Please select an option.")
            return
        }
        print("Selected Option: \(selectedOption)")
            print("Correct Answer: \(correctAnswer)")
        if selectedOption == correctAnswer{
            // Correct option selected
            task1=task1+5
            print("Correct option selected.")
        } else {
            // Incorrect option selected
            print("Incorrect.")
        }
        let storyBoard: UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "t_ques_2_draw") as! t_ques_2_draw
        vc.id=id
        vc.task1=task1
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



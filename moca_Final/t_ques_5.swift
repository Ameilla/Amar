//
//  t_ques_5.swift
//  MOCA
//
//  Created by Amar Dwarakacherla on 04/03/24.
//

import UIKit

class t_ques_5: UIViewController {
    var id: String?
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var nextbar: UIView!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var type: UILabel!
    var task1 = 0
    var task2 = 0
    var task3 = 0
    var img = UIImage()
    var image = UIImage()
    @IBOutlet var optionButtons: [UIButton]!
    var Question: Question5Model?
    var QuestionTrial1: QuestionModel?
    var selectedOption: String?
    var correctAnswer: String?
    
    var t1: String?
    var t2: String?
    var t3: String?
    var t4: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bar.layer.cornerRadius = 25
        bar.layer.masksToBounds=true
        nextbar.layer.cornerRadius = 17
//        task3 = task3 + 1
        print(id ?? "")
        submit.layer.cornerRadius = 10
        GetAPI()
    }
    
    func GetAPI() {
        let apiURL = APIList.t_Question5Api
        print(apiURL)
        
        // Prepare POST parameters if needed
        let parameters: [String: Any] = [:
            // Add your POST parameters here if required
            // "key1": value1,
            // "key2": value2,
        ]

        APIHandler().postAPIValues(type: Question5Model.self, apiUrl: apiURL, method: "POST", formData: parameters) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.Question = data
                    // Set tags and images for buttons
                    if let questionData = self.Question?.data.first {
                        self.type.text = questionData.type
                        self.quesLabel.text = questionData.ques
                        self.correctAnswer = questionData.answer
                        
                        self.setButtonImage(self.optionButtons[0], withImageData: questionData.option1!)
                        self.optionButtons[0].tag = 1
                        
                        self.setButtonImage(self.optionButtons[1], withImageData: questionData.option2!)
                        self.optionButtons[1].tag = 2
                        
                        self.setButtonImage(self.optionButtons[2], withImageData: questionData.option3!)
                        self.optionButtons[2].tag = 3
                        
                        self.setButtonImage(self.optionButtons[3], withImageData: questionData.option4!)
                        self.optionButtons[3].tag = 4
                    }
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

    func setButtonImage(_ button: UIButton, withImageData imageDataString: String) {
        guard let imageData = Data(base64Encoded: imageDataString),
              let originalImage = UIImage(data: imageData) else {
            return
        }

        // Resize the image to fit the button's bounds
        let resizedImage = resizeImage(originalImage, targetSize: button.bounds.size)

        // Set the resized image to the button
        button.setImage(resizedImage, for: .normal)

        // Update the content mode of the button's image view
        button.imageView?.contentMode = .scaleAspectFill
    }

    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let newSize: CGSize

        // Choose the aspect ratio to fit the target size
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        // Deselect all buttons
        for button in optionButtons {
            button.isSelected = false
            button.backgroundColor = .clear
        }
        // Select the tapped button
        sender.isSelected = true
        sender.backgroundColor = .green

        // Store the selected option
        selectedOption = String(sender.tag)
    }
    @IBAction func submit(_ sender: Any) {
        guard let selectedOption = selectedOption, !selectedOption.isEmpty else {
                print("Please select an option.")
                return
            }
        // Check if the selected option is correct
        if selectedOption == correctAnswer {
                   print("Correct option selected.")
                   // Increment your task count or perform other actions for a correct answer
                   task3=task3+5
               } else {
                   print("Incorrect option selected.")
                   // Handle the case when the selected option is incorrect
               }
               let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyBoard.instantiateViewController(withIdentifier: "t_ques_6") as! t_ques_6
               vc.id = id
               vc.task1 = task1
               vc.task2 = task2
               vc.task3 = task3
               vc.img = img
               vc.image = image
               self.navigationController?.pushViewController(vc, animated: true)
    }
}

       


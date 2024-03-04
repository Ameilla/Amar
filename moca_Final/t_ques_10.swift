//
//  t_ques_10.swift
//  MOCA
//
//  Created by Amar Dwarakacherla on 04/03/24.
//
import UIKit

class t_ques_10: UIViewController {
    var id: String?
    @IBOutlet weak var nextbar: UIView!
    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var SubmitBtn: UIButton!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    var image = UIImage()
    var task1=0
    var task2=0
    var task3=0
    var task4=0
    var task5=0
    var task6=0
    var task7=0
    var result=0
    var interpretation=""
    var img = UIImage()
    var UpdateResult : ResultModel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var quesLabel: UILabel!

    @IBOutlet var optionButtons: [UIButton]!
    var QuestionTrial1 : QuestionModel?
    var selectedOption: String?
    var correctAnswer: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(id ?? "")
        bar.layer.cornerRadius = 25
        bar.layer.masksToBounds=true
        nextbar.layer.cornerRadius = 17
        print(task1)
        print(task2)
        print(task3)
        print(task4)
        print(id ?? "")
        option4.layer.cornerRadius = 10
        option2.layer.cornerRadius = 10
        option3.layer.cornerRadius = 10
        option1.layer.cornerRadius = 10
        option1.layer.borderWidth = 1.0
        option2.layer.borderWidth = 1.0
        option3.layer.borderWidth = 1.0
        option4.layer.borderWidth = 1.0
        SubmitBtn.layer.cornerRadius = 10
//        task7=task7+1
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
                    let questionIndex = 9
                    let question = self.QuestionTrial1?.questions[questionIndex]
                    self.quesLabel.text = question?.question
                    self.type.text = question?.type
//                    self.quesContent.text = question?.quesContent
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
    
    @IBAction func SubmitBtn(_ sender: Any) {
        guard let selectedOption = selectedOption, let correctAnswer = self.QuestionTrial1?.questions[9].answer else {
            // No option selected or question data not available
            print("Please select an option.")
            return
        }
        print("Selected Option: \(selectedOption)")
            print("Correct Answer: \(correctAnswer)")
        if selectedOption == correctAnswer{
            task7=task7+6
            // Correct option selected
            print("Correct option selected.")
        } else {
            // Incorrect option selected
            print("Incorrect.")
        }
        result = task1 + task2 + task3 + task4 + task5 + task6 + task7
        let number = result

        if number >= 7 && number <= 8 {
            interpretation="Normal Cognitive"
        }
        else if number >= 5 && number <= 6
        {
            interpretation="Mild Cognitive impairment"
        }
        else if number >= 3 && number <= 4
        {
            interpretation="Moderate Cognitive impairment"
        }
        else {
            interpretation="Severe Cognitive impairment"
        }
        print(result)
        GettAPI()
        
        let storyBoard: UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Results") as! Results
        vc.id=id
        vc.task1=task1
        vc.task2=task2
        vc.task3=task3
        vc.task4=task4
        vc.task5=task5
        vc.task6=task6
        vc.task7=task7
        vc.img = img
        vc.image=image
        vc.result=result
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension t_ques_10 {
    func GettAPI() {
        let apiURL = APIList.ResultApi
        print(apiURL)
        // Convert images to data
        guard let imgData = img.pngData(), let imageData = image.pngData() else {
            print("Failed to convert images to data.")
            return
        }
        // Convert task data to strings
        let idString = id ?? ""
        let task1String = String(task1)
        let task2String = String(task2)
        let task3String = String(task3)
        let task4String = String(task4)
        let task5String = String(task5)
        let task6String = String(task6)
        let task7String = String(task7)
        let resultString = String(result)
        let inter = String(interpretation)
        print(inter)
        print(resultString)// Add result value
        // Create a unique boundary string
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = Data()
        // Append task data to the request body
        for (key, value) in [
            "iD": idString,
            "task1": task1String,
            "task2": task2String,
            "task3": task3String,
            "task4": task4String,
            "task5": task5String,
            "task6": task6String,
            "task7": task7String,
            "result": resultString,
            "interpretation": inter
        ] {
            body.append(contentsOf: "--\(boundary)\r\n".data(using: .utf8)!)
            body.append(contentsOf: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append(contentsOf: "\(value)\r\n".data(using: .utf8)!)
        }
        // Append images as files
        for (index, imageData) in [imgData, imageData].enumerated() {
            let fieldName = "image\(index + 1)"
            let fileName = "\(UUID().uuidString).jpg"  // Generate a unique file name
            body.append(contentsOf: "--\(boundary)\r\n".data(using: .utf8)!)
            body.append(contentsOf: "Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            body.append(imageData)
            body.append("\r\n".data(using: .utf8)!)
        }
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        // Set up the request
        var request = URLRequest(url: URL(string: apiURL)!)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        // Perform the request
        URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            // Handle the response
            if let data = data {
                print("Response Data:", String(data: data, encoding: .utf8) ?? "")
                // Handle the response data if needed
            }
            if let error = error {
                print("Error:", error)
            }
        }.resume()
    }
}


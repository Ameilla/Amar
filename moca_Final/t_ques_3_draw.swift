//
//  t_ques_3_draw.swift
//  MOCA
//
//  Created by Amar Dwarakacherla on 04/03/24.
//





import UIKit
import PencilKit

class t_ques_3_draw: UIViewController {
    var id: String?
    var task1=0
    var img: UIImage?
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var canvas: PKCanvasView!
    private var toolPicker: PKToolPicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(id ?? "123456")
        nextBtn.layer.cornerRadius = 10
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupCanvas()
    }

    private func setupCanvas() {
        // Create an individual PKToolPicker instance
        toolPicker = PKToolPicker()

        if view.window != nil {
            toolPicker.setVisible(true, forFirstResponder: canvas)
            toolPicker.addObserver(canvas)
            canvas.becomeFirstResponder()
            canvas.layer.borderWidth = 1.0
                    canvas.layer.borderColor = UIColor.black.cgColor
                    canvas.layer.cornerRadius = 10.0 // Adjust the corner radius as needed
                    canvas.clipsToBounds = true
        }
    }

    @IBAction func clearBtnTapped(_ sender: UIBarButtonItem) {
        canvas.drawing = PKDrawing()
    }

    @IBAction func nextBtn(_ sender: Any) {
        // Capture the drawing as an image
        let image = canvas.drawing.image(from: canvas.bounds, scale: UIScreen.main.scale)

        // Print the image
        if let imageData = img!.pngData() {
            print("Image Data: \(imageData)")
        } else {
            print("Failed to convert image to data.")
        }

        // Instantiate the next view controller
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "t_ques_4") as! t_ques_4
        vc.id = id
        vc.image=image
        vc.task1=task1
        vc.img = img! // Pass the image to the next view controller
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

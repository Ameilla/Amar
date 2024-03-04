//
//  LanguageVC.swift
//  MOCA
//
//  Created by Amar Dwarakacherla on 04/03/24.
//

import UIKit

class LanguageVC: UIViewController {
    var id: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func English(_ sender: Any) {
        let storyBoard: UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ques_1") as! ques_1
        vc.id=id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
    @IBAction func Tamil(_ sender: Any) {
        let storyBoard: UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "t_ques_1") as! t_ques_1
        vc.id=id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

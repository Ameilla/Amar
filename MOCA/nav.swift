//
//  nav.swift
//  MOCA
//
//  Created by AMAR on 30/10/23.
//

import UIKit

class nav: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nxt(_ sender: Any) {
        let storyBoard: UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ques_1") as! ques_1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

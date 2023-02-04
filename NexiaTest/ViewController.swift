//
//  ViewController.swift
//  NexiaTest
//
//  Created by icarus on 03/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.saveButton.layer.cornerRadius = 10
        self.saveButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }


}


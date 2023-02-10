//
//  ViewController.swift
//  NexiaTest
//
//  Created by icarus on 03/02/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    private var benevitsVC = BenevitsController()
    private var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordText.delegate = self
        saveButton.isEnabled = false
        self.saveButton.layer.cornerRadius = 10
        self.saveButton.layer.masksToBounds = true
        checklogin()
    }
    
  
    
    public func makeAlert(titleInput : String, messageinput : String){
        let alert = UIAlertController(title: titleInput, message: messageinput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Error", style: UIAlertAction.Style.default) { (UIAlertAction) in
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
  
   public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let UsernameInput = (usernameText.text! as NSString).replacingCharacters(in: range, with: string)
    let PasswordInput = (passwordText.text! as
                            NSString).replacingCharacters(in: range, with: string)
    if UsernameInput.isEmpty && PasswordInput.isEmpty {
        saveButton.backgroundColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 0.5)
        saveButton.isEnabled = false
        saveButton.alpha = 0.5
    } else {
        saveButton.backgroundColor = UIColor(red: 236/255, green: 80/255, blue: 86/255, alpha: 1.0)
        saveButton.isEnabled = true
        saveButton.alpha = 1.0
    }
     return true
    }
    
    public func checklogin(){
        
        if UserDefaults.standard.bool(forKey: "username") && UserDefaults.standard.bool(forKey: "password") == false {
            print("no one is logged")
        }else if UserDefaults.standard.bool(forKey: "username") && UserDefaults.standard.bool(forKey: "password") == true  {
            
            UserDefaults.standard.removeObject(forKey: "userName")
            UserDefaults.standard.removeObject(forKey: "password")
        }

    }
    
    @IBAction func loginClicked(_ sender: Any) {

        if usernameText.text == "61917612998" && passwordText.text == "Contrasena01"  {
            defaults.setValue("61917612998‬", forKey: "userName")
            defaults.setValue("Contrasena01", forKey: "password")
            
            performSegue(withIdentifier: "toSecondVC", sender: nil)
            self.navigationItem.setHidesBackButton(true, animated: true)

        } else if usernameText.text == "61998018420‬" && passwordText.text == "Contrasena02" {

            defaults.setValue("61998018420‬", forKey: "userName")
            defaults.setValue("Contrasena02", forKey: "password")
            
            performSegue(withIdentifier: "toSecondVC", sender: nil)
            self.navigationItem.setHidesBackButton(true, animated: true)

        } else {
            self.makeAlert(titleInput: "Error!", messageinput: "Usuario y/o Contraseña incorrectos")
        }
        
        
        //MARK: ---------------HERES THE CODE OF LOGIN------
      /*
        guard let url = URL(string: "https://qa-api.socioinfonavit.com/api/v2/member/authentication") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Cotent-Type")
        let body : [String:String] = [
            "credentials":"aduxNxGoBQuIRG0HMP6NorwYaIUJ6Ur+RO7gj1CSf5r8iuWet4L+xQbbKQbRjpwY52qBV8VQTLVRghr4hchKK/bShdFCyipugYlc2o3FVyuLWqGY5KfkRIDknVKR7wb8uBjIjociDNRg/jFwF9soLC4k9tUHCMrrPdjaOAoAgV49S3IC2IPTkyWEXNPmjKq35aczHseFiOcBFLel7DVz3zPt0ghcOQ0Ke6wQ35O/qEqCFtpLhLk+jWVznTNeUn5r+xZRvxivALYRmP84s5PTn6hE8lDtubPJ+B3g73O7Nbqu62NLmu2ACa55NvUfP3b0nROpD3DoAcgFFwALgKWwzw=="
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        //make the request
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                performSegue(withIdentifier: "toSecondVC", sender: nil)
                self.navigationItem.setHidesBackButton(true, animated: true)
                print("SUCCESS: \(response)")
            }catch {
                self.makeAlert(titleInput: "Error!", messageinput: "\(error)")
                print(error)
            }
        }
        task.resume()
         */
    }
}




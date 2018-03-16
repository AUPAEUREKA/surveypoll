//
//  ViewController.swift
//  surveypoll
//
//  Created by Henintsoa Miora on 08/03/2018.
//  Copyright © 2018 Hauret Xiong. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet var nameText : UITextView!
    @IBOutlet var passText : UITextView!
    @IBOutlet var loginButton : UIButton!
    @IBOutlet var spinWheel : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(LoginController.dissmissKeyboard))
        
        view.addGestureRecognizer(swipe)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func performAuthentificaion()
    {
        spinWheel.startAnimating()
        
        loginButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) // A remplacer par une requete URL
        {
            self.spinWheel.stopAnimating()
            self.performSegue(withIdentifier: "connexion", sender: self)
        }
        /* URL REQUEST */
        
    }
 
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        if sender is LoginController
        {
            return true
        }
        else if (identifier == "connexion")
        {
            performAuthentificaion()
        }
        
        return false
        
    }
    
    func validateInfos( userName: String, pass : String) -> Bool
    {
        let reg = "\\A\\w{4,18}\\Z"
        
        let test = NSPredicate(format : "SELF MATCHES %@", reg)
        return test.evaluate(with: userName) && pass.isEmpty == false
        
    }
    
    @IBAction func userTextChanged()
    {
        if ( validateInfos(userName: nameText.text! , pass : passText.text!) )
        {
            loginButton.isEnabled = true
        }else
        {
            loginButton.isEnabled = false
        }
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
     
     
        var controller = segue.destination as! MyViewController
        controller.user =
    }
 */

}


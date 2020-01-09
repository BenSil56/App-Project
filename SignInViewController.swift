//
//  SignInViewController.swift
//  SSSAS
//
//  Created by Chase Albritton on 8/10/19.
//  Copyright © 2019 Chase Albritton. All rights reserved.
//

import UIKit
import MessageUI

class SignInViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        print("Sign in button tapped")
        
        // Validate required fields are not empty - Meaning if any of the text fields are empty, then an alert will pop up, telling the user to try again.
        if (usernameTextField.text?.isEmpty)! ||
            (userPasswordTextField.text?.isEmpty)!
        {
            //display message and return
            displayMessage(userMessage: "All fields are required to fill in")
            return
        }
        
        
//        else {
//
//        // *** SKIPS LOGIN FOR NOW ***
//         DispatchQueue.main.sync {
//            let myDay =
//                self.storyboard?.instantiateInitialViewController(withIdentifier: "MyDayViewController") as! MyDayViewController
//            let appDelegate = UIApplication.shared.delegate
//            appDelegate?.window??.rootViewController = myDay
//
//        }
//        }
    }
    
    @IBAction func clickHereButtonTapped(_ sender: Any) {
         print("Click Here button tapped")
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([
            "afodrie@sssas.org", "ptang@sssas.org"])
        mailComposerVC.setSubject("Login Issues")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Error", message: "Your device could not send an email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async
            {
            let alertController = UIAlertController(title: "Try Again", message: userMessage, preferredStyle: .alert)

            let OKAction = UIAlertAction(title: "OK", style: .default)
            { (action:UIAlertAction!) in
                //code will activate after OK button is tapped
                print("OK button tapped")
                DispatchQueue.main.async
                    {
                    self.dismiss(animated: true, completion: nil)
                    }
                }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
  
   
}

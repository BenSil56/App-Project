//
//  ViewController.swift
//  SSSAS
//
//  Created by Chase Albritton on 8/10/19.
//  Copyright © 2019 Chase Albritton. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
   
    @IBAction func clickHereButtonTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func sendEmail(_ sender: Any) {
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
    
    
}


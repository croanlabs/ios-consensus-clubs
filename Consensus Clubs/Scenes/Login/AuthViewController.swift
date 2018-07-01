//
//  AuthViewController.swift
//  SwifterDemoiOS
//
//  Copyright (c) 2014 Matt Donnelly.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import Accounts
import Social
import SwifteriOS
import SafariServices

class AuthViewController: UIViewController, SFSafariViewControllerDelegate {
    
    var swifter: Swifter

    // Default to using the iOS account framework for handling twitter auth
    let useACAccount = false

    required init?(coder aDecoder: NSCoder) {
//        self.swifter = Swifter(consumerKey: "nLl1mNYc25avPPF4oIzMyQzft",
//                               consumerSecret: "Qm3e5JTXDhbbLl44cq6WdK00tSUwa17tWlO8Bf70douE4dcJe2")
        self.swifter = Swifter(consumerKey: "DLL5DZISP2j5p0JfhdyOcdf6j",
                               consumerSecret: "aAOm2rE9XAX9w4rGVWa23rsQOhvCkLO6pP8apVtL98OPv23Hqd")
//        self.swifter = Swifter(consumerKey: "adKigHthR7xod8rWCLXzrphr7",
//                               consumerSecret: "dky79W581Sfju3PUk0d9iajwv66ApZmHzRoC0iMTLJQsQjffsD")
        
        
        super.init(coder: aDecoder)
    }

    @IBAction func didTouchUpInsideLoginButton(_ sender: AnyObject) {
        let failureHandler: (Error) -> Void = { error in
            self.alert(title: "Error", message: error.localizedDescription)
            
        }

        if useACAccount {
            let accountStore = ACAccountStore()
            let accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)

            // Prompt the user for permission to their twitter account stored in the phone's settings
            accountStore.requestAccessToAccounts(with: accountType, options: nil) { granted, error in
                guard granted else {
                    self.alert(title: "Error", message: error!.localizedDescription)
                    return
                }
                
                let twitterAccounts = accountStore.accounts(with: accountType)!
                
                if twitterAccounts.isEmpty {
                    self.alert(title: "Error", message: "There are no Twitter accounts configured. You can add or create a Twitter account in Settings.")
                } else {
                    let twitterAccount = twitterAccounts[0] as! ACAccount
                    self.swifter = Swifter(account: twitterAccount)
                    self.fetchClubsHomeStream()
                }
            }
        } else {
            let url = URL(string: "consensusclubs://success")!
            swifter.authorize(withCallback: url, presentingFrom: self, success: { _, _ in
                self.fetchClubsHomeStream()
            }, failure: failureHandler)
        }
    }

    func fetchClubsHomeStream() {
//        let failureHandler: (Error) -> Void = { error in
//            self.alert(title: "Error", message: error.localizedDescription)
//        }
        
        let listClubsViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    
        self.navigationController?.pushViewController(listClubsViewController, animated: true)

    }

    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @available(iOS 9.0, *)
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }


}

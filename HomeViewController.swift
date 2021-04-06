//
//  HomeViewController.swift
//  SwiftWithRN
//
//  Created by Kapil Khedkar on 05/04/21.
//

import UIKit
import React

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameTextField : UITextField!
    
    @IBOutlet weak var messageTextField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // MARK: - Clicks
    @IBAction func submitButtonTapped(sender: UIButton) {
        
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
          let mockData:NSDictionary = ["messages":
              [
                ["name": nameTextField.text!, "msg": messageTextField.text!]
              ]
          ]

          let rootView = RCTRootView(
              bundleURL: jsCodeLocation,
              moduleName: "RNShowMsg",
              initialProperties: mockData as [NSObject : AnyObject],
              launchOptions: nil
          )
          let vc = UIViewController()
          vc.view = rootView
          self.present(vc, animated: true, completion: nil)
        
    }


}


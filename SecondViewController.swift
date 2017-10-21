//
//  SecondViewController.swift
//  SwiftControllerCommunicationLab
//
//  Created by allen3_huang on 21/10/2017.
//  Copyright © 2017 allen3_huang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    var delegate: CommunicationDelegate?
    var firstVC: FirstViewController?
    @objc dynamic var changeValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let firstVC = firstVC {
            addObserver(firstVC, forKeyPath: "changeValue", options: .new, context: nil)
            
            NotificationCenter.default.addObserver(firstVC, selector: #selector(firstVC.receiveNotification(_:)), name: NSNotification.Name(rawValue:"MyKey"), object: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func notifyFirstClick(_ sender: Any) {
        //1. delegate
        delegate?.notifyFirstView(value: "100")
        
        //2. KVO
        changeValue = "newValue"
        
        //3. Notification
        NotificationCenter.default.post(name: NSNotification.Name("MyKey"), object: "100")
    }
    
    deinit {
         if let firstVC = firstVC {
            NotificationCenter.default.removeObserver(firstVC, name: NSNotification.Name("MyKey"), object: nil)
            
            removeObserver(firstVC, forKeyPath: "changeValue")
        }
    }
    
}

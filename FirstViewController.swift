//
//  ViewController.swift
//  SwiftControllerCommunicationLab
//
//  Created by allen3_huang on 21/10/2017.
//  Copyright © 2017 allen3_huang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, CommunicationDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController

        secondVC.delegate = self
        secondVC.firstVC = self
    }
    

    func notifyFirstView(value: String){
        print("notifyFirstView:\(value)")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let object = object as? NSObject else{
            print("object is nil")
            return
        }
        
        let value = object.value(forKeyPath: keyPath!)
        print(value!)
    }
    
    @objc func receiveNotification(_ notification: Notification) {
        
        if let value = notification.object as? String {
            print(value)
        }
    }
}


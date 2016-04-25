//
//  SliderMenuLogoutViewController.swift
//  CarRescue
//
//  Created by jacky nguyen on 4/16/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit

class SliderMenuLogoutViewController: UIViewController {
    
    var listViewController:[UIViewController] = [UIStoryboard.LoginController()!, UIStoryboard.SignUpController()!]
    
    var containerViewController:ContainerViewController!
    
    override func viewDidLoad() {
        
    }
    @IBAction func SignUpTapped(sender: AnyObject) {
        containerViewController.currentViewController = listViewController[0]
    }
    
    @IBAction func onLogginTapped(sender: AnyObject) {
         containerViewController.currentViewController = listViewController[0]
    }
    
}

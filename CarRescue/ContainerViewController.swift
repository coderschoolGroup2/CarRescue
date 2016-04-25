//
//  ContainerViewController.swift
//  CarRescue
//
//  Created by jacky nguyen on 4/16/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    var originLeftConstraint:CGFloat!
    
    var menuViewController: UIViewController! {
        didSet(oldView) {
            self.view.layoutIfNeeded()
            
            if oldView != nil {
                oldView.willMoveToParentViewController(nil)
                oldView.view.removeFromSuperview()
                oldView.didMoveToParentViewController(nil)
            }
            
            menuViewController.willMoveToParentViewController(self)
            menuView.addSubview(menuViewController.view)
            menuViewController.didMoveToParentViewController(self)
            
            menuViewController.view.frame = CGRectMake(0, 50, menuView.frame.size.width, menuView.frame.size.height);
        }
    }
    
    var currentViewController :UIViewController! {
        didSet(oldView) {
            
            //ContentView.addSubview(currentViewController.view)
            self.view.layoutIfNeeded()
            
            if oldView != nil {
                oldView.willMoveToParentViewController(nil)
                oldView.view.removeFromSuperview()
                oldView.didMoveToParentViewController(nil)
            }
            
            currentViewController.willMoveToParentViewController(self)
            contentView.addSubview(currentViewController.view)
            currentViewController.didMoveToParentViewController(self)
            
            currentViewController.view.frame = CGRectMake(0, 0, contentView.frame.size.width, contentView.frame.size.height);
        }

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }
    
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    override func viewDidAppear(animated: Bool) {
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "CarRescue");
        let menuItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: nil, action: "onMenuTapped:");
        navItem.leftBarButtonItem = menuItem;
        
        
        let navBackgroundImage:UIImage! = UIImage(named: "images")
        //navBar.setBackgroundImage(navBackgroundImage, forBarMetrics: .Default)
        
        navBar.barTintColor = UIColor.blueColor()
        navBar.tintColor = UIColor.whiteColor()
        

        navBar.setItems([navItem], animated: false);
    }
    
    @IBAction func onMenuTapped(sender: UIBarButtonItem) {
        if self.leftConstraint.constant == 0 {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.leftConstraint.constant = self.view.frame.width - 60
                self.view.layoutIfNeeded()
            });
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.leftConstraint.constant = 0
                self.view.layoutIfNeeded()
            });
        }
        
    }
    
    @IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
        let transition = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == .Began {
            
            originLeftConstraint = leftConstraint.constant
            
        } else if sender.state == .Changed {
            
            leftConstraint.constant = originLeftConstraint + transition.x
            
        } else if sender.state == .Ended {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                if velocity.x > 0 {
                    self.leftConstraint.constant = self.view.frame.width - 60
                } else {
                    self.leftConstraint.constant = 0
                }
                self.view.layoutIfNeeded()
            })
            
            
        }
        
    }
}

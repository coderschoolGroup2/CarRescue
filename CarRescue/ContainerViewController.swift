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
            //ContentView.addSubview(currentViewController.view)
            self.view.layoutIfNeeded()
            
            if oldView != nil {
                oldView.willMoveToParentViewController(nil)
                oldView.view.removeFromSuperview()
                oldView.didMoveToParentViewController(nil)
            }
            
            menuViewController.willMoveToParentViewController(self)
            menuView.addSubview(menuViewController.view)
            menuViewController.didMoveToParentViewController(self)
            
            menuViewController.view.frame = CGRectMake(0, 0, menuView.frame.size.width, menuView.frame.size.height);
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
            
            UIView.animateWithDuration(0.5) { () -> Void in
                self.leftConstraint.constant = 0
                self.view.layoutIfNeeded()
                
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.blueColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
    }
    
    @IBAction func onMenuTapped(sender: UIBarButtonItem) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.leftConstraint.constant = self.view.frame.width - 60
            self.view.layoutIfNeeded()
        });
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
                if velocity.x < 0 {
                    self.leftConstraint.constant = 0
                }
                self.view.layoutIfNeeded()
            })
            
        }
        
        
    }
}

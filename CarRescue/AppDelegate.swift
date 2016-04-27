//
//  AppDelegate.swift
//  CarRescue
//
//  Created by DEREK DO on 6/4/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit
import Parse
import Bolts
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
      
            // Initialize Parse.
            let configuration = ParseClientConfiguration {
                $0.applicationId = "u4VziidX73RcMp7RFfL5MKC6vXK86fsZKXTLVdkS"
                $0.clientKey = "te92Tk0r7IVP2hwxiVopPg56SQzYRqANQMxUI7U"
            }
            Parse.initializeWithConfiguration(configuration)
        
        var locationManager: CLLocationManager! = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
//        let containerViewController = UIStoryboard.ContainerController()
//        
//        containerViewController!.menuViewController = UIStoryboard.MenuLogoutController()
//        containerViewController!.currentViewController = UIStoryboard.MapController()

        
      // window?.rootViewController = containerViewController
   //    window?.rootViewController = mapViewController
        
        //let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 360, height: 44))
//        let navBar: UINavigationBar = UINavigationBar()
//        containerViewController!.view.addSubview(navBar);
//        let navItem = UINavigationItem(title: "SomeTitle");
//        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: nil, action: "selector");
//        navItem.rightBarButtonItem = doneItem;
//        navBar.setItems([navItem], animated: false);
//        
        
        //menuViewController.containerViewController = vc
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func ContainerController() -> ContainerViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("ContainerViewController") as? ContainerViewController
    }

    
    class func MenuLoginController() -> SliderMenuLoginViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("SliderMenuLoginViewController") as? SliderMenuLoginViewController
    }
    
    class func MenuLogoutController() -> SliderMenuLogoutViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("SliderMenuLogoutViewController") as? SliderMenuLogoutViewController
    }
    
    class func MapController() -> MapViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("MapViewController") as? MapViewController
    }
    
}




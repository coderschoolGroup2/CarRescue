//
//  MapViewController.swift
//  CarRescue
//
//  Created by jacky nguyen on 4/15/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blueColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
    }
//      func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
//            locationManager.startUpdatingLocation()
//        }
//    }
//    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            let span = MKCoordinateSpanMake(0.1, 0.1)
//            let region = MKCoordinateRegionMake(location.coordinate, span)
//            mapView.setRegion(region, animated: false)
//        }
//    }
    
//    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
//    {
//        let location = locations.last
//        
//        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
//        
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
//        
//        self.mapView.setRegion(region, animated: true)
//        
//        self.locationManager.stopUpdatingLocation()
//    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location = locations[0] as! CLLocation
        
        print(location)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    
}

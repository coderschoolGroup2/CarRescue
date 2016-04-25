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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate,UIGestureRecognizerDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager : CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set current location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action:"handleTap:")
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)

        
    }
    
    func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        
        let location = gestureReconizer.locationInView(mapView)
        let coordinate = mapView.convertPoint(location,toCoordinateFromView: mapView)
        
        // Add annotation:
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "new location"
        mapView.addAnnotation(annotation)
        
        
        let request = MKDirectionsRequest()
        
        request.source = MKMapItem.mapItemForCurrentLocation()
        let pm = MKPlacemark(coordinate: CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude), addressDictionary: nil)
        request.destination = MKMapItem(placemark: pm)
        request.requestsAlternateRoutes = false
        
        let directions = MKDirections(request: request)
        
        directions.calculateDirectionsWithCompletionHandler { (response:MKDirectionsResponse?, error:NSError?) -> Void in
            
            if error != nil {
                // Handle error
            } else {
                self.showRoute(response!)
            }

        }
        
        
        let VC1 = self.storyboard!.instantiateViewControllerWithIdentifier("CreateNewLocationViewController") as! CreateNewLocationViewController
        let navController = UINavigationController(rootViewController: VC1)
        self.presentViewController(navController, animated:true, completion: nil)
    }
    
    func showRoute(response: MKDirectionsResponse) {
        
        for route in response.routes {
            
            mapView.addOverlay(route.polyline,
                level: MKOverlayLevel.AboveRoads)
        }
    }

    @IBAction func onAddNewLocationTapped(sender: AnyObject) {
        //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let VC1 = self.storyboard!.instantiateViewControllerWithIdentifier("CreateNewLocationViewController") as! CreateNewLocationViewController
        let navController = UINavigationController(rootViewController: VC1)
        self.presentViewController(navController, animated:true, completion: nil)
    }
    
    @IBAction func onTapped(sender: UITapGestureRecognizer) {
        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let center = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    
   }

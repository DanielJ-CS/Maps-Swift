//
//  ViewController.swift
//  Maps
//
//  Created by Daniel Jiang on 2016-05-10.
//  Copyright © 2016 appfish. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var lat:CLLocationDegrees = 40.7
        var long:CLLocationDegrees = -73.9
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Niagara Falls"
        annotation.subtitle = "One day..."
        map.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        
        print("Gesture Recognized")
        
        var touchPoint = gestureRecognizer.locationInView(self.map)//gives point user has pressed on relative to the map
        
        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = " New place"
        annotation.subtitle = "One day..."
        map.addAnnotation(annotation)

        
        
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


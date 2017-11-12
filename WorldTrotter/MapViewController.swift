//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by UCode on 11/12/17.
//  Copyright © 2017 Map App. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("MapViewController Loaded")
        
        mapView = MKMapView()
        
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Sattelite"])
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        segmentedControl.addTarget(self, action: Selector("mapTypeChanged"), for: .valueChanged)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 32.0)
        let leadingContraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0)
        
        topConstraint.isActive = true
        leadingContraint.isActive = true
        trailingConstraint.isActive = true
        
        mapView.mapType = .standard
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapTypeChanged(segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        }
        else if segmentedControl.selectedSegmentIndex == 1 {
            mapView.mapType = .hybrid
        }
        
        else if segmentedControl.selectedSegmentIndex == 2 {
            mapView.mapType = .satellite
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

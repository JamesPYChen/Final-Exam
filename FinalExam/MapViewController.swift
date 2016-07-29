//
//  MapViewController.swift
//  FinalExam
//
//  Created by jamespoyu on 2016/7/28.
//  Copyright © 2016年 AlphaCamp. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    var detailBook: Book!

    @IBOutlet weak var bookMap: MKMapView!
    override func viewDidLoad() {
        
        bookMap.delegate = self
        bookMap.showsCompass = true
        bookMap.showsScale = true
        bookMap.showsTraffic = true
        super.viewDidLoad()
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(detailBook.Address!, completionHandler: {
            placemarks ,error in
            
            if error != nil{
                print(error)
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.detailBook.BookName
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    
                    self.bookMap.showAnnotations([annotation], animated: true)
                    self.bookMap.selectAnnotation(annotation,animated: true)
                }
            }
        })

        // Do any additional setup after loading the view.
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation){
            return nil
        }
        
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)as? MKPinAnnotationView
        
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
        }
        return annotationView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

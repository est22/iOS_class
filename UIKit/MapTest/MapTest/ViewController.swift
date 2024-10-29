//
//  ViewController.swift
//  MapTest
//
//  Created by Lia An on 10/29/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = CLLocationCoordinate2D(latitude: 37.33497077406045, longitude: -122.00896684549421)
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.mapType = .standard
        mapView.setRegion(region, animated: true)
        mapView.delegate = self // for annotation reuse
    }
    @IBAction func actShowPin(_ sender: Any) {
        let location = CLLocationCoordinate2D(latitude: 37.33497077406045, longitude: -122.00896684549421)
        let annotation = CustomAnnotation(coordinate: location, title: "Apple Park", subtitle: "I'm here!", url: "https://www.apple.com", thumbnail:"applepark")
        mapView.addAnnotation(annotation)
//        let pin = MKPointAnnotation()
//        pin.coordinate = location
//        pin.title = "센터 위치"
//        pin.subtitle = "I'm here!"
//        mapView.addAnnotation(pin)
    }
    
    @IBAction func mapTypeDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            mapView.preferredConfiguration = MKImageryMapConfiguration()
        case 2:
            mapView.preferredConfiguration = MKHybridMapConfiguration()
        default:
            mapView.preferredConfiguration = MKStandardMapConfiguration()

        }
    }
    

}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CustomAnnotation else { fatalError() }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            let imageView = UIImageView(image: UIImage(named: annotation.thumbnail))
            imageView.contentMode = .scaleAspectFit
            annotationView?.leftCalloutAccessoryView = imageView
            annotationView?.canShowCallout = true
            
        }
        annotationView?.annotation = annotation
        
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? CustomAnnotation else { return }
        print(annotation.url)
        
        if let url = URL(string: annotation.url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
    }
}

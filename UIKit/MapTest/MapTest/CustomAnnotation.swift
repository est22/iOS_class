//
//  CustomAnnotation.swift
//  MapTest
//
//  Created by Lia An on 10/29/24.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let url: String
    let thumbnail: String
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, url: String, thumbnail: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.url = url
        self.thumbnail = thumbnail
    
    }
    
}

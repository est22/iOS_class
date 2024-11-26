//
//  ViewController.swift
//  notification-test
//
//  Created by Lia An on 11/21/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func actInterval(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Interval Notification"
        content.subtitle = "This is a subtitle"
        content.body = "설정하신 인터벌 노티피케이션을 알려드립니다."
        content.userInfo = ["name": "정년이"]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) {
            (error) in
            if let error {
                print("알림설정에 실패했습니다.")
            }
            print("알림설정에 성공했습니다.")
        }
    }
    
    @IBAction func actCalendar(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Calendar Notification"
        content.subtitle = "This is a subtitle"
        content.body = "설정하신 캘린더 노티피케이션을 알려드립니다."
        content.userInfo = ["name": "정년이"]
        
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        
        var dateComponents = DateComponents()
    
        dateComponents.hour = 14
        dateComponents.minute = 56
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        
        
    }
    
    @IBAction func actLocation(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Location Notification"
        content.subtitle = "This is a subtitle"
        content.body = "설정하신 위치 기반 노티피케이션을 알려드립니다."
//        content.userInfo = ["name": "정년이"]
        
        let center = CLLocationCoordinate2D(latitude: 37, longitude: -122)
        let region = CLCircularRegion(center: center, radius: 1000, identifier: "iOS study")
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
    }
}


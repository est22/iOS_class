//
//  ContentView.swift
//  notification-test-swiftui
//
//  Created by Lia An on 11/21/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Interval Notification"){
                intervalTrigger()
            }
            Button("Calendar Notification"){
                calendarTrigger()
            }
            Button("Location Notification"){}
        }.onAppear(perform: {
            requestNotificationPermission()
        })
        .padding()
    }
    
    func requestNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("알림 권한이 허용되었습니다.")
            } else {
                print("알림 권한이 거부되었습니다.")
            }
            
        }
    }
    
    func intervalTrigger(){
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
    
    func calendarTrigger(){
        let content = UNMutableNotificationContent()
        content.title = "Calendar Notification"
        content.subtitle = "This is a subtitle"
        content.body = "설정하신 캘린더 노티피케이션을 알려드립니다."
        content.userInfo = ["name": "정년이"]
        
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        
        var dateComponents = DateComponents()
    
        dateComponents.hour = 15
        dateComponents.minute = 28
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func locationTrigger(){
        let content = UNMutableNotificationContent()
        content.title = "Location Notification"
        content.subtitle = "This is a subtitle"
        content.body = "설정하신 위치 기반 노티피케이션을 알려드립니다."
        content.userInfo = ["name": "정년이"]
        
        let center = CLLocationCoordinate2D(latitude: 37, longitude: -122)
        let region = CLCircularRegion(center: center, radius: 1000, identifier: "iOS study")
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

#Preview {
    ContentView()
}

//
//  NotificationService.swift
//  plantApp
//
//  Created by hajer on 06/06/1448 AH.
//

import UserNotifications


class NotificationService{
    
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in }
    }
    
    func schedualReminder(plant:Plant){
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your \(plant.plantName) "
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400 * Double(plant.wateringDays.days), repeats:true)
        
        let request = UNNotificationRequest(identifier: plant.notificationID, content: content, trigger:trigger)
        UNUserNotificationCenter.current().add(request)}
    
    func cancelReminder (plant: Plant){
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [plant.notificationID])
    }
    
}

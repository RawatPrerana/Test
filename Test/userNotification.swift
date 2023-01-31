//
//  userNotification.swift
//  Test
//
//  Created by Prerana on 25/01/23.
//

import SwiftUI
import UserNotifications
import AVFoundation

class NotificationManager{
    
    static let instance = NotificationManager()
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error{
                print("Error: \(error)")
            }else{
                print("Success")
            }
        }
    }
    
    func scheduleNotification1(){
        let content = UNMutableNotificationContent()
        content.title = "First notification!"
        content.subtitle = "Created notification"
        content.sound = UNNotificationSound(named:  UNNotificationSoundName(rawValue: "Calypso.caf") )
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct userNotification: View {
    @State var sound : UNNotificationSound
    var sound2: UNNotificationSound
    var istapped = false
    var body: some View {
        VStack{
            Button("Request Permission"){
                NotificationManager.instance.requestAuthorization()
            }
            Button("Request Notification"){
                    NotificationManager.instance.scheduleNotification1()
            }
            
            Button("Notification Settings") {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    // Ask the system to open that URL.
                    UIApplication.shared.open(url)
                }
            }
        }
    }
}

func notificationSounds(){
    let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.xxx.xxx")
    let soundsURL = containerURL!.appendingPathComponent("Library/Sounds/", isDirectory: true)
        if !FileManager.default.fileExists(atPath: soundsURL.path) {
            try! FileManager.default.createDirectory(atPath: soundsURL.path, withIntermediateDirectories: true)
        }
        
        if FileManager.default.fileExists(atPath: soundsURL.path) {
            do {
                try FileManager.default.copyItem(at: soundsURL, to: soundsURL.appendingPathComponent(soundsURL.lastPathComponent))
            } catch {
                // Exception
            }
        }
}

struct userNotification_Previews: PreviewProvider {
    static var previews: some View {
        userNotification(sound: .default, sound2: .default)
    }
}

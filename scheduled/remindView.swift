//
//  remindView.swift
//  scheduled
//
//  Created by labuser on 11/18/17.
//  Copyright © 2017 labuser. All rights reserved.
//

import Foundation
import UIKit
import EventKit

class ReminderViewController: UIViewController {
    var datePicker: UIDatePicker!
    let eventStore = EKEventStore()
    let calendar = Calendar.current
    var calendars: [EKCalendar] = []
    
    
    override func viewDidLoad() {
        checkCalendarAuthorizationStatus()
    }
    
    
    //MARK: Authorization stuff
    func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        switch (status) {
        case EKAuthorizationStatus.notDetermined:
            // This happens on first-run
            requestAccessToCalendar()
        case EKAuthorizationStatus.authorized:
            break
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
            requestAccessToCalendar()
        }
    }
    func loadCalendars() {
        self.calendars = eventStore.calendars(for: EKEntityType.event)
    }
    
    func requestAccessToCalendar() {
        eventStore.requestAccess(to: EKEntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in
            
            if accessGranted == true {
                DispatchQueue.main.async(execute: {
                    self.loadCalendars()
                })
            } else {
            }
        })
    }
    
    var placeholderDate = ""
    var convertedDate:Date = Date.distantFuture
    var className = "PlaceHolder"
    
    //MARK: DATA HANDLING 
    
    /*
     
 
     */
    func convertDate(){
        print("CONVERT")
        let isoDate = (placeholderDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: isoDate) //according to date format your date string
        print(date!) //Convert String to Date
        convertedDate = date!
    }
    
    
    //MARK: USER INPUT
    
    /*
 
     
     */
    @IBAction func setReminder(_ sender: Any) {
        convertDate()
        let date = convertedDate
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let reminder = EKReminder(eventStore: self.eventStore)
        reminder.title = self.className
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let alarm = EKAlarm()
        alarm.absoluteDate = convertedDate
        reminder.priority = 3
        reminder.addAlarm(alarm)
        let dueComponents = calendar.dateComponents([.day, .month, .year], from: date)
        
        reminder.dueDateComponents = dueComponents
        reminder.calendar = eventStore.defaultCalendarForNewReminders()
        do {
            print("my reminder")
            print(reminder)
            try eventStore.save(reminder,
                                commit: true)
        } catch let error {
            print("Reminder failed with error \(error.localizedDescription)")
        }
    }
    
    
    @IBAction func returnToSchedule(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
        print("details did disappear")
    }
}

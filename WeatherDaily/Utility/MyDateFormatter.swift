//
//  MyDateFormatter.swift
//  WeatherDaily
//
//  Created by Israa on 19/05/2024.
//

import Foundation
class MyDateFormatter {
    
    static func formattedDate(from dateString: String) -> String? {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        inputDateFormatter.locale = Locale(identifier: "en_US_POSIX")
                guard let date = inputDateFormatter.date(from: dateString) else {
    
            return nil
        }
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "EEE dd MMM yyyy hh:mm a"
        outputDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let formattedDate = outputDateFormatter.string(from: date)
        
        return formattedDate
    }
    
    
    static func isToday(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let inputDate = dateFormatter.date(from: date) else {
            return "Invalid date"
        }
        
        let today = Calendar.current.startOfDay(for: Date())
                let inputDay = Calendar.current.startOfDay(for: inputDate)
        
        if inputDay == today {
            return "Today"
        } else {
            dateFormatter.dateFormat = "EE"
            let shortName = dateFormatter.string(from: inputDate)
            return shortName
        }
    }
    
    
    static func checkDayOrNight() -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: currentDate)

        var sunriseComponents = components
        sunriseComponents.hour = 6
        sunriseComponents.minute = 0
        
        var sunsetComponents = components
        sunsetComponents.hour = 17
        sunsetComponents.minute = 30
        
        if let sunrise = calendar.date(from: sunriseComponents),
           let sunset = calendar.date(from: sunsetComponents) {
            
            if currentDate >= sunrise && currentDate <= sunset {
                return true // It's daytime
            }
        }
        
        return false // It's nighttime
    }

    
   static func getDisplayedHoursOfDay(hours:[Hour])->[Hour]{
        var newHours : [Hour] = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let currentDateString = dateFormatter.string(from: Date.now)
        
        let currentDate = dateFormatter.date(from: currentDateString)
        
        for item in hours{
            let itemDate = dateFormatter.date(from: item.time)
            let thresholdDate = Calendar.current.date(byAdding: .minute, value: 45, to: itemDate ?? Date.now) ?? Date.now
            
            if currentDate?.compare(thresholdDate) == .orderedAscending{
                newHours.append(item)
            }
        }
        return newHours
        
    }

    
   static func getHourFormat(dateTime: String, isUpcoming: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let currentDateTime = dateFormatter.string(from: Date())
        let currentDate = currentDateTime.components(separatedBy: " ")[0]
        let currentHour = Int(currentDateTime.components(separatedBy: " ")[1].components(separatedBy: ":")[0]) ?? 0
        
        let date = dateTime.components(separatedBy: " ")[0]
       let hour = dateTime.components(separatedBy: " ")[1].components(separatedBy: ":")[0]
        let inputHour = Int(hour) ?? 0
        
        let hourToCompare = isUpcoming ? inputHour - 1 : inputHour
                if (currentHour == inputHour || currentHour == hourToCompare) && currentDate == date {
            return "Now"
        } else {
            let formattedHour: String
            if inputHour == 0 {
                formattedHour = "12:00 AM"
            } else if inputHour < 12 {
                formattedHour = "\(inputHour):00 AM"
            } else if inputHour == 12 {
                formattedHour = "12:00 PM"
            } else {
                formattedHour = "\(inputHour - 12):00 PM"
            }
            return formattedHour
        }
    }



}

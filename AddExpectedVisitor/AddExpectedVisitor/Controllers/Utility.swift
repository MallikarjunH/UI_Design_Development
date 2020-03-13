//
//  Utility.swift
//  AddExpectedVisitor
//
//  Created by Mallikarjun on 13/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import Foundation

let kDateFormat = "yyyy-MM-dd HH:mm:ss"

extension Date {
    
    var serverDate: String {
        
        let df = DateFormatter()
        
        df.timeZone = TimeZone(abbreviation: "GMT")
        df.dateFormat = kDateFormat
        let dateStr = df.string(from: self)
        
        return dateStr
    }
    
    var localDate: DTStruct {
        
        let df = DateFormatter()
        df.timeZone = TimeZone.ReferenceType.system
        df.locale = Locale.autoupdatingCurrent
        
        df.dateStyle = .medium
        let localDate = df.string(from: self)
        df.dateStyle = .none
        df.timeStyle = .short
        let localTime = df.string(from: self)
        
        let dfTemp = DateFormatter()
        dfTemp.dateFormat = "dd MMM"
        let dateWithOutYear = dfTemp.string(from: self)
        return DTStruct(localDate, time: localTime, dateWithOutYear: dateWithOutYear)
    }
}

extension String {
    
    var localDate: DTStruct {
        
        let df = DateFormatter()
        df.dateFormat = kDateFormat
        df.timeZone = TimeZone(abbreviation: "GMT")
        guard let gmtDate = df.date(from: self) else { return DTStruct("", time: "", dateWithOutYear: "") }
        
        df.timeZone = TimeZone.ReferenceType.system
        df.locale = Locale.autoupdatingCurrent
        
        df.dateStyle = .medium
        let localDate = df.string(from: gmtDate)
        df.dateStyle = .none
        df.timeStyle = .short
        let localTime = df.string(from: gmtDate)
        
        let dfTemp = DateFormatter()
        dfTemp.dateFormat = "dd MMM"
        let dateWithOutYear = dfTemp.string(from: gmtDate)
        
        return DTStruct(localDate, time: localTime, dateWithOutYear: dateWithOutYear)
    }
    
    var localDateString: String {
        
        let df = DateFormatter()
        df.dateFormat = kDateFormat
        df.timeZone = TimeZone(abbreviation: "GMT")
        
        guard let date = df.date(from: self) else { return "" }
        
        df.timeZone = TimeZone.ReferenceType.system
        df.locale = Locale.autoupdatingCurrent
        
        return df.string(from: date)
    }
}


struct DateTime {
    
    var serverDate: String
    var localDate: DTStruct
    var sDate: Date?
    var lDate: Date?
    
    init(serverDate: String) {
        
        guard !serverDate.isEmpty else {
            self.serverDate = ""
            self.localDate = DTStruct("", time: "", dateWithOutYear: "")
            return
        }
        
        
        if serverDate.count == 19 {
            self.serverDate = serverDate
        }
        else if serverDate.count == 10 {
            self.serverDate = "\(serverDate) 00:00:00"
        }
        else {
            self.serverDate = serverDate
        }
        self.localDate = self.serverDate.localDate
        
        let df1 = DateFormatter()
        df1.dateFormat = kDateFormat
        lDate = df1.date(from: self.serverDate)
        
        let df2 = DateFormatter()
        df2.dateFormat = kDateFormat
        df2.timeZone = TimeZone(abbreviation: "GMT")
        sDate = df2.date(from: self.serverDate)
    }
    
    init(date: Date) {
        
        self.localDate = date.localDate
        self.serverDate = date.serverDate
        
        let df = DateFormatter()
        df.dateFormat = kDateFormat
        
        let str = df.string(from: date)
        df.timeZone = TimeZone(abbreviation: "GMT")
        lDate = df.date(from: str)
        
        sDate = date
    }
}

extension DateTime: Comparable {
    
    public static func ==(lhs: DateTime, rhs: DateTime) -> Bool {
        return lhs.serverDate == rhs.serverDate
    }
    
    public static func <(lhs: DateTime, rhs: DateTime) -> Bool {
        return lhs.serverDate < rhs.serverDate
    }
    
    public static func >(lhs: DateTime, rhs: DateTime) -> Bool {
        return lhs.serverDate > rhs.serverDate
    }
    
    public static func <=(lhs: DateTime, rhs: DateTime) -> Bool {
        return lhs.serverDate <= rhs.serverDate
    }
    
    public static func >=(lhs: DateTime, rhs: DateTime) -> Bool {
        return lhs.serverDate >= rhs.serverDate
    }
}


struct DTStruct {
    var date: String
    var dateWithOutYear: String
    var time: String
    
    init(_ date: String, time: String, dateWithOutYear: String) {
        self.date = date
        self.time = time
        self.dateWithOutYear = dateWithOutYear
    }
}

enum DateFormatEnum {
    case ymdhmsFormat1
    case ymdhmsFormat2
    case ymdFormat1
    
    func getFormat() -> String{
        switch self {
        case .ymdhmsFormat1:
            return "yyyy-MM-dd HH:mm:ss"
        case .ymdhmsFormat2:
            return "yyyy/MM/dd HH:mm:ss"
        case .ymdFormat1:
            return "yyyy-MM-dd"
        }
    }
}

class DataUtil{
    
    static let dateFormatter = NSDateFormatter()
    
    //現在時刻を任意の形式で取得します
    static func getNowDateByFormat(format : DateFormatEnum) -> String{
        let now = NSDate()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = format.getFormat()
        return dateFormatter.stringFromDate(now)
    }
    
    //日付形式の変換を行います
    static func convertFormat(targetDate : String, toFormat : DateFormatEnum) -> String {
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        if let date = dateFormatter.dateFromString(targetDate) {
            dateFormatter.dateFormat = toFormat.getFormat()
            return  dateFormatter.stringFromDate(date)
        }
        return targetDate
    }
    
    //日付の各要素を返却します
    static func getDateElement(targetDate : String) -> (year : String, month : String, day: String, hour : String, minute : String, second : String){
        var retrunElement = (year : "", month : "", day: "", hour : "", minute : "", second : "")
        if let date = dateFormatter.dateFromString(targetDate){
            let calendar = NSCalendar.currentCalendar()
            let component = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: date)
            retrunElement.year = component.year.description
            retrunElement.month = component.month.description
            retrunElement.day = component.day.description
            retrunElement.hour = component.hour.description
            retrunElement.minute = component.minute.description
            retrunElement.second = component.second.description
        }
        return retrunElement
    }
}

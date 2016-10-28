import Foundation

class GATrackingManager {
    
    // GA初期設定(必ず一度実行する)
    static func initGa() {
        let gai = GAI.sharedInstance()
        gai.trackUncaughtExceptions = true
        
        if let path = NSBundle.mainBundle().pathForResource("GoogleService-Info", ofType: "plist") {
            if let propertyList = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
                let trackingId = propertyList["TRACKING_ID"] as! String
                gai.trackerWithTrackingId(trackingId)
            }
        }
    }
    
    class func sendScreenTracking(screenName : String) {
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.set(kGAIScreenName, value: screenName)
        tracker.send(GAIDictionaryBuilder.createScreenView().build() as [NSObject: AnyObject])
        tracker.set(kGAIScreenName, value: nil)
    }
    
    class func sendEventTracking(category : String, action : String, label : String, value : NSNumber?) {
        let tracker = GAI.sharedInstance().defaultTracker
        let event = GAIDictionaryBuilder.createEventWithCategory(category,
            action: action,
            label: label,
            value: value).build()
        tracker.send(event as [NSObject : AnyObject])
    }
}

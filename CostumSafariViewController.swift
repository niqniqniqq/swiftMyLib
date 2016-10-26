import Foundation
import SafariServices

class CostumSafariViewController : SFSafariViewController, SFSafariViewControllerDelegate{
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if #available(iOS 10.0, *) {
            //色変更とかここで
        }
        UIApplication.sharedApplication().statusBarStyle = .Default
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(false)
        
        UIApplication.sharedApplication().statusBarStyle = .Default
    }
    
    //利用するUIActivityを選択
    func safariViewController(controller: SFSafariViewController, activityItemsForURL URL: NSURL, title: String?) -> [UIActivity] {
        return [UIActivity()]
    }
    
    //読込みが完了した際に呼び出される処理
    func safariViewController(controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
    }
    
    //Doneボタンを押した時に呼ばれる
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
    }
}


import UIKit
import ZendeskSDKMessaging
import ZendeskSDKLogger
import ZendeskSDK

public class ZendeskMessaging: NSObject {
    
    let TAG = "[ZendeskMessaging]"
    
    private var zendeskPlugin: SwiftZendeskMessagingPlugin? = nil
    private var channel: FlutterMethodChannel? = nil
    var rvc: UIViewController? = nil
    

    init(flutterPlugin: SwiftZendeskMessagingPlugin, channel: FlutterMethodChannel) {
        self.zendeskPlugin = flutterPlugin
        self.channel = channel
    }
    
    func initialize(channelKey: String) {
        
        
        print("\(self.TAG) - Channel Key - \(channelKey)\n")
        Zendesk.initialize(withChannelKey: channelKey, messagingFactory: DefaultMessagingFactory()){ result in
            if case let .failure(error) = result {
                self.zendeskPlugin?.isInitialize = false
                print("\(self.TAG) - initialize failure - \(error.localizedDescription )\n")
            } else {
                self.zendeskPlugin?.isInitialize = true
                print("\(self.TAG) - initialize success")
            }
        }
    }

    @objc public func dismissChat() {
        guard let r = rvc else { return }
        r.dismiss(animated: true, completion: nil)
        print("\(self.TAG) - closing")
    }

    func show(rootViewController: UIViewController?) {
   
        
        guard let messagingViewController = Zendesk.instance?.messaging?.messagingViewController() else { return }
        guard let rootViewController = rootViewController else { return }
        rvc = rootViewController
        



        
        let navController = UINavigationController(rootViewController: messagingViewController)

        let rightBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(dismissChat))

        messagingViewController.navigationItem.rightBarButtonItem = rightBarButton
        rootViewController.present(navController, animated: true, completion: nil)

        

        print("\(self.TAG) - show")
    }


    


    func invalidate() {

        Zendesk.invalidate()
        print("\(self.TAG) - invalidate")
    }
    
}

public class TestClass {


    @objc func onTap() {
        print("it worked")
    }
}

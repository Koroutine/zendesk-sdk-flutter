import Flutter
import UIKit

public class SwiftZendeskMessagingPlugin: NSObject, FlutterPlugin {
    
  let TAG = "[SwiftZendeskMessagingPlugin]"

  private var channel: FlutterMethodChannel
    
  var isInitialize = false
  var zendeskMessaging: ZendeskMessaging? = nil

  init(channel: FlutterMethodChannel) {
      self.channel = channel
  }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zendesk_messaging", binaryMessenger: registrar.messenger())
    let instance = SwiftZendeskMessagingPlugin(channel: channel)
    registrar.addMethodCallDelegate(instance, channel: channel)
    registrar.addApplicationDelegate(instance)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        let arguments = call.arguments as? Dictionary<String, Any>
        //
       
        //
        switch(method){
        // chat sdk method channels
        case "initialize":
            if (isInitialize) {
                print("\(TAG) - Messaging is already initialize!\n")
                return
            }
            let channelKey: String = (arguments?["channelKey"] ?? "") as! String
            self.zendeskMessaging = ZendeskMessaging(flutterPlugin: self, channel: channel)
            self.zendeskMessaging?.initialize(channelKey: channelKey)
            break;
        case "show":
            if (!isInitialize) {
                print("\(TAG) - Messaging needs to initialize first.\n")
            }
            self.zendeskMessaging?.show(rootViewController: UIApplication.shared.delegate?.window??.rootViewController)
            break
        case "invalidate":
            if (!isInitialize) {
                print("\(TAG) - Messaging needs to initialize first.\n")
            }
            self.zendeskMessaging?.invalidate()
            break
        default:
            break
        }
        result(nil)
  }
}

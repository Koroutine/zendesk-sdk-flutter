#import "ZendeskMessagingPlugin.h"
#if __has_include(<zendesk_sdk_flutter/zendesk_sdk_flutter-Swift.h>)
#import <zendesk_sdk_flutter/zendesk_sdk_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "zendesk_sdk_flutter-Swift.h"
#endif

@implementation ZendeskMessagingPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftZendeskMessagingPlugin registerWithRegistrar:registrar];
}
@end

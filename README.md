# Zendesk SDk Flutter

Currently only supports Messaging on Zendesk V2 SDK
 
- **Better UI (Native)**
- **Chat history**
- **Answer Bot**

-------------------

## Setup 
### 1. Enable agent work-space
### 2. Enable Messaging
### 3. Add channel and get key

## How to use?
### Initialize
``` dart
 final String androidChannelKey = '';
 final String iosChannelKey = '';

  @override
  void initState() {
    super.initState();
    ZendeskMessaging.initialize(
      androidChannelKey: androidChannelKey,
      iosChannelKey: iosChannelKey,
    );
  }
```
> just use initialize() one time

### Show
```dart
ZendeskMessaging.show();
```
> You can use in onTap()



## Future Function

- Push Notifications


## Link
- [Zendesk messaging Help](https://support.zendesk.com/hc/en-us/sections/360011686513-Zendesk-messaging)
- [Agent Workspace for messaging](https://support.zendesk.com/hc/en-us/articles/360055902354-Agent-Workspace-for-messaging)
- [Working with messaging in your Android and iOS SDKs](https://support.zendesk.com/hc/en-us/articles/1260801714930-Working-with-messaging-in-your-Android-and-iOS-SDKs)



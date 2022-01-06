import android.content.Intent
import android.util.Log
import com.koroutine.zendesk_sdk_flutter.ZendeskMessagingPlugin
import io.flutter.plugin.common.MethodChannel
import zendesk.messaging.android.FailureCallback
import zendesk.android.Zendesk
import zendesk.messaging.android.DefaultMessagingFactory
import zendesk.messaging.android.MessagingError
import zendesk.messaging.android.SuccessCallback

class ZendeskMessaging(private val plugin: ZendeskMessagingPlugin, private val channel: MethodChannel) {

    private val tag = "[ZendeskMessaging]"

    fun initialize(channelKey: String) {
        println("$tag - Channel Key - $channelKey")
        Zendesk.initialize(
            context = plugin.activity!!,
            channelKey = channelKey,
            successCallback = { zendesk ->
                 println("$tag - Initialization Success")
            },
            failureCallback = { error ->
                // Tracking the cause of exceptions in your crash reporting dashboard will help to triage any unexpected failures in production
                 println("$tag - Initialization Failed")
            },
            messagingFactory = DefaultMessagingFactory()
        )
    }

    fun show() {
        Zendesk.instance.messaging.showMessaging(plugin.activity!!, Intent.FLAG_ACTIVITY_NEW_TASK)
        println("$tag - show")
    }

}

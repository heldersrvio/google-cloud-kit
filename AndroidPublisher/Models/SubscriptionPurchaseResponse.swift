import Core
import Foundation

public struct GoogleCloudSubscriptionPurchaseV2: GoogleCloudModel {
    public var kind: String?
	public var regionCode: String?
	public var startTime: String?
	public var subscriptionState: GoogleCloudSubscriptionState?
	public var latestOrderId: String?
	public var linkedPurchaseToken: String?
	public var acknowledgementState: GoogleCloudSubscriptionAcknowledgementState?
}

public enum GoogleCloudSubscriptionState: String, GoogleCloudModel {
	case unspecified = "SUBSCRIPTION_STATE_UNSPECIFIED"
	case pending = "SUBSCRIPTION_STATE_PENDING"
	case active = "SUBSCRIPTION_STATE_ACTIVE"
	case paused = "SUBSCRIPTION_STATE_PAUSED"
	case inGracePeriod = "SUBSCRIPTION_STATE_IN_GRACE_PERIOD"
	case onHold = "SUBSCRIPTION_STATE_ON_HOLD"
	case canceled = "SUBSCRIPTION_STATE_CANCELED"
	case expired = "SUBSCRIPTION_STATE_EXPIRED"
}

public enum GoogleCloudSubscriptionAcknowledgementState: String, GoogleCloudModel {
	case unspecified = "ACKNOWLEDGEMENT_STATE_UNSPECIFIED"
	case pending = "ACKNOWLEDGEMENT_STATE_PENDING"
	case acknowledged = "ACKNOWLEDGEMENT_STATE_ACKNOWLEDGED"
}


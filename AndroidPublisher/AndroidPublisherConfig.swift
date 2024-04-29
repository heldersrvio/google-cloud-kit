import Core

public struct GoogleCloudAndroidPublisherConfiguration: GoogleCloudAPIConfiguration {
    public var scope: [GoogleCloudAPIScope]
    public let serviceAccount: String
    public let project: String?
    public let subscription: String? = nil

    public init(scope: [GoogleCloudAndroidPublisherScope], serviceAccount: String, project: String?) {
        self.scope = scope
        self.serviceAccount = serviceAccount
        self.project = project
    }

    public static func `default`() -> GoogleCloudAndroidPublisherConfiguration {
        return GoogleCloudAndroidPublisherConfiguration(scope: [.androidPublisher],
                                                 serviceAccount: "default",
                                                 project: nil)
    }
}

public enum GoogleCloudAndroidPublisherScope: GoogleCloudAPIScope {
    case androidPublisher

    public var value: String {
        switch self {
        case .androidPublisher: return "https://www.googleapis.com/auth/androidpublisher"
        }
    }
}

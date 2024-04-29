import Core
import Foundation
import AsyncHTTPClient
import NIO

public final class GoogleCloudAndroidPublisherClient {
    
    public var purchases: PurchasesAPI
    var androidPublisherRequest: GoogleCloudAndroidPublisherRequest
    
    public init(credentials: GoogleCloudCredentialsConfiguration,
                config: GoogleCloudAndroidPublisherConfiguration,
                httpClient: HTTPClient,
                eventLoop: EventLoop,
                base: String = "https://androidpublisher.googleapis.com/androidpublisher") throws {
        let refreshableToken = OAuthCredentialLoader.getRefreshableToken(credentials: credentials,
                                                                         withConfig: config,
                                                                         andClient: httpClient,
                                                                         eventLoop: eventLoop)
        
        guard let projectId = ProcessInfo.processInfo.environment["GOOGLE_PROJECT_ID"] ??
                              ProcessInfo.processInfo.environment["PROJECT_ID"] ??
                              (refreshableToken as? OAuthServiceAccount)?.credentials.projectId ??
                              config.project ?? credentials.project else {
            throw GoogleCloudAndroidPublisherError.projectIdMissing
        }
        
        androidPublisherRequest = GoogleCloudAndroidPublisherRequest(httpClient: httpClient,
                                                       eventLoop: eventLoop,
                                                       oauth: refreshableToken,
                                                       project: projectId)
        
        purchases = GoogleCloudAndroidPublisherPurchasesAPI(request: androidPublisherRequest, endpoint: base)
    }
    
    public func hopped(to eventLoop: EventLoop) -> GoogleCloudAndroidPublisherClient {
        androidPublisherRequest.eventLoop = eventLoop
        return self
    }
}

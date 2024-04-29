import AsyncHTTPClient
import NIO
import Foundation

public protocol PurchasesAPI {
    func get(packageName: String, token: String) -> EventLoopFuture<GoogleCloudSubscriptionPurchaseV2>
}

public final class GoogleCloudAndroidPublisherPurchasesAPI: PurchasesAPI {
    
    let endpoint: String
    let request: GoogleCloudAndroidPublisherRequest
    
    init(request: GoogleCloudAndroidPublisherRequest,
         endpoint: String) {
        self.request = request
        self.endpoint = endpoint
    }
    
    private var applicationsPath: String {
        "\(endpoint)/v3/applications"
    }
    
    public func get(packageName: String, token: String) -> EventLoopFuture<GoogleCloudSubscriptionPurchaseV2> {
        request.send(method: .GET, path: "\(applicationsPath)/\(packageName)/purchases/subscriptionsv2/tokens/\(token)")
    }
}

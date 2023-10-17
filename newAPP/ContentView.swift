import SwiftUI
import SystemConfiguration

class InternetConnection{
    static func isConnected() -> Bool {
            guard let reachability = SCNetworkReachabilityCreateWithName(nil, "www.apple.com") else {
                return false
            }
 
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(reachability, &flags)

            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)
            let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
            let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)

            return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
        }
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            if InternetConnection.isConnected(){
                HelloView(checkInternet: true)
            } else{
                HelloView(checkInternet: false)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

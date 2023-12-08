import NetworkExtension

class VPNPacketTunnelProvider: NEPacketTunnelProvider {

    override func startTunnel(options: [String : NSObject]?, completionHandler: @escaping (Error?) -> Void) {
        // Your VPN setup code here
        let dnsSettings = NEDNSSettings(servers: ["https://dns.adguard.com/dns-query", "dns.adguard.com"])
        setTunnelNetworkSettings(createTunnelNetworkSettings(dnsSettings: dnsSettings), completionHandler: completionHandler)
    }

    private func createTunnelNetworkSettings(dnsSettings: NEDNSSettings) -> NEPacketTunnelNetworkSettings {
        let settings = NEPacketTunnelNetworkSettings(tunnelRemoteAddress: "94.140.14.14")
        settings.dnsSettings = dnsSettings
        // Configure other network settings as needed
        return settings
    }
}

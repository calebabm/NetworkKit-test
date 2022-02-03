import XCTest
@testable import NetKitLocal
import Network

@available(macOS 14.0, *)
class HostAndClientServiceTests: XCTestCase {
    
    var networkService: LocalNetworkService!
    var ipString: String!
    var portNumber: UInt16!
    
    override func setUpWithError() throws {
        networkService = LocalNetworkService(.hostAndClient)
        ipString = "192.168.86.170"
        portNumber = 45901
        try networkService.hostConnections(on: portNumber)
        try networkService.establishConnection(to: ipString, on: portNumber)
    }
    
    //MARK: Host Service Tests
    func testValidHost() {
        XCTAssertNotNil(networkService.hostService)
    }
    
    func testValidPort() {
        XCTAssertNotNil(NWEndpoint.Port(rawValue: portNumber))
    }
    
    func testHostConnection() {
        XCTAssertNoThrow(try? networkService.hostConnections(on: portNumber))
    }
    
    func testListenerState() {
        XCTAssert(
            networkService.hostService?.listener?.state != .waiting(.posix(.ECONNREFUSED)) ||
            networkService.hostService?.listener?.state != .failed(.posix(.EADDRINUSE))
        )
    }
    
    func testListenerCreated() {
        XCTAssertNotNil(networkService.hostService?.listener)
    }
    
    func testListenerQueueThread() {
        XCTAssert(networkService.hostService?.listener?.listener?.queue == .global(qos: .default))
    }
    
    func testValidListenerStateHandler() {
        XCTAssertNotNil(networkService.hostService?.listener?.listener?.stateUpdateHandler)
    }
    
    func testValidListenerConnectionHandler() {
        XCTAssertNotNil(networkService.hostService?.listener?.listener?.newConnectionHandler)
    }
    
    //MARK: Client Service Tests
    func testValidClient() {
        XCTAssertNotNil(networkService.clientService)
    }
    
    func testClientConnection() {
        XCTAssertNoThrow(try networkService.establishConnection(to: ipString, on: portNumber))
    }
    
    func testURL() {
        XCTAssertNotNil(IPv4Address(ipString))
    }
    
    func testConnectionsInitialState() {
        XCTAssert(
            networkService.clientService?.publishedConnections[ipString]?.connection.state != .waiting(.posix(.ECONNREFUSED)) ||
            networkService.clientService?.publishedConnections[ipString]?.connection.state != .failed(.posix(.EADDRINUSE))
        )
    }
    
    func testConnectionStateHandler() {
        XCTAssertNotNil(networkService.clientService?.publishedConnections[ipString]?.connection.stateUpdateHandler)
    }
    
    func testConnectionDefaultParameters() {
        XCTAssertNotNil(networkService.clientService?.publishedConnections[ipString]?.connection.parameters)
    }
    
    func testConnectionQueueThread() {
        XCTAssert(networkService.clientService?.publishedConnections[ipString]?.connection.queue == .global(qos: .default))
    }
    
}

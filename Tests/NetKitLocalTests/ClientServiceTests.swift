import XCTest
import Network
@testable import NetKitLocal

@available(macOS 14.0, *)
class ClientServiceTests: XCTestCase {
    
    var networkService: LocalNetworkService!
    var ipString: String!
    var portNumber: UInt16!
    
    override func setUpWithError() throws {
        networkService = LocalNetworkService(.client)
        ipString = "192.168.86.170"
        portNumber = 45901
        try networkService.establishConnection(to: ipString, on: portNumber)
    }
    
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

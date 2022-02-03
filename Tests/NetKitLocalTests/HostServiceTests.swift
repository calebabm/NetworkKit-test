import XCTest
@testable import NetKitLocal
import Network

@available(macOS 14.0, *)
class HostServiceTests: XCTestCase {
    
    var networkService: LocalNetworkService!
    var portNumber: UInt16!
    
    override func setUpWithError() throws {
        networkService = LocalNetworkService(.host)
        portNumber = 45901
        try networkService.hostConnections(on: portNumber)
    }
    
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
}

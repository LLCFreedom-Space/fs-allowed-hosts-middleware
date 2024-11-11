import XCTVapor
import XCTest
import Vapor
@testable import AllowedHostsMiddleware

final class AllowedHostsMiddlewareTests: XCTestCase {
    //  swiftlint: disable implicitly_unwrapped_optional
    var app: Application!
    //  swiftlint: enable implicitly_unwrapped_optional
    let port = 8080
    let hostname = "127.0.0.1"

    override func setUp() async throws {
        app = try await Application.make(.testing)
        app.get("order") { _ -> String in
            return "done"
        }
    }

    override func tearDown() async throws {
        try await app.asyncShutdown()
    }

    func testSuccess() throws {
        app.middleware.use(AllowedHostsMiddleware())
        app.allowedHosts = [hostname]
        try app.testable(method: .running(hostname: hostname, port: port)).test(.GET, "/order") { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "done")
        }
    }

    func testNotAcceptable() throws {
        app.middleware.use(AllowedHostsMiddleware())
        app.allowedHosts = [hostname]
        try app.testable().test(.GET, "/order") { res in
            XCTAssertEqual(res.status, .notAcceptable)
        }
    }

    func testUnauthorized() throws {
        app.middleware.use(AllowedHostsMiddleware())
        app.allowedHosts = ["example.com"]
        try app.testable(method: .running(hostname: hostname, port: port)).test(.GET, "/order") { res in
            XCTAssertEqual(res.status, .unauthorized)
        }
    }
}

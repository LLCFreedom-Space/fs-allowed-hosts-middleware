import XCTVapor
import XCTest
import Vapor
@testable import AllowedHostsMiddleware

final class AllowedHostsMiddlewareTests: XCTestCase {
    var app: Application!

    override func setUp() async throws {
        app = try await Application.make(.testing)
    }

    override func tearDown() async throws {
        try await app.asyncShutdown()
    }

    func testSuccess() throws {
        app.middleware.use(AllowedHostsMiddleware())
        app.allowedHosts = ["127.0.0.1"]
        app.get("order") { req -> String in
            return "done"
        }
        try app.testable(method: .running(hostname: "127.0.0.1", port: 8080)).test(.GET, "/order") { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "done")
        }
    }

    func testNotAcceptable() throws {
        app.middleware.use(AllowedHostsMiddleware())
        app.allowedHosts = ["127.0.0.1"]
        app.get("order") { req -> String in
            return "done"
        }
        try app.testable().test(.GET, "/order") { res in
            XCTAssertEqual(res.status, .notAcceptable)
        }
    }

    func testUnauthorized() throws {
        app.middleware.use(AllowedHostsMiddleware())
        app.allowedHosts = ["example.com"]
        app.get("order") { req -> String in
            return "done"
        }
        try app.testable(method: .running(hostname: "127.0.0.1", port: 8080)).test(.GET, "/order") { res in
            XCTAssertEqual(res.status, .unauthorized)
        }
    }
}

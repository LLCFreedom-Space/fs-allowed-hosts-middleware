// FS Allowed Hosts Middleware
// Copyright (C) 2024  FREEDOM SPACE, LLC

//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published
//  by the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

//
//  AllowedHostsMiddleware.swift
//  
//
//  Created by Mykola Buhaiov on 14.06.2024.
//

import Vapor

/// Allowed Hosts Middleware
public struct AllowedHostsMiddleware: AsyncMiddleware {
    /// Initialize middleware
    public init() {}
    /// Responds to an incoming request by validating allow host and checking if this host has access.
    /// - Parameters:
    ///   - request: The incoming request that contains internet protocol address.
    ///   - next: Next `Responder` in the chain, potentially another middleware or the main router.
    /// - Throws:
    ///   - `HostError.notAcceptable` if the ip address is missing.
    ///   - `HostError.unauthorizedAccessAttempt` if the ip address not allow to get access.
    /// - Returns: A `Response` object resulting from processing the request.
    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        request.logger.debug("IpAddress headers - \(String(describing: request.headers))")
        guard let ipAddress = request.remoteAddress?.ipAddress else {
            request.application.logger.error("Access attempt without an authorized IP address")
            throw HostError.notAcceptable
        }
        if !request.application.allowedHosts.contains(ipAddress) {
            request.application.logger.error("Unauthorized access attempt from IP address: \(ipAddress)")
            throw HostError.unauthorizedAccessAttempt
        }
        return try await next.respond(to: request)
    }
}

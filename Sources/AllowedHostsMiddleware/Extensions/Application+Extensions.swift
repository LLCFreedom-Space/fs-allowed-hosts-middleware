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
//  Application+Extensions.swift
//
//
//  Created by Mykola Buhaiov on 14.06.2024.
//

import Vapor

extension Application {
    /// Stores and manages a list of allowed hostnames for the application.
    /// This extension adds a typed storage property `allowedHosts` to the `Application`
    /// instance. It uses Vapor's `StorageKey` mechanism to safely store and retrieve
    /// an array of allowed hostnames, typically used for validating incoming requests
    /// or enforcing CORS/security rules. If the value is not found in storage, an
    /// error is logged and an empty array is returned.
    /// A `AllowedHostsKey` conform to StorageKey protocol
    private struct AllowedHostsKey: StorageKey {
        /// Less verbose typealias for `[String]`.
        typealias Value = [String]
    }

    /// Gets or sets the list of allowed hosts for the application.
    /// Accesses an array of strings representing allowed hostnames stored
    /// in the application's storage. If accessed before a value is set,
    /// the function logs an error and returns an empty array. Values assigned
    /// to this property are persisted in `Application.Storage` via the
    /// `AllowedHostsKey`.
    public var allowedHosts: [String] {
        get {
            guard let allowedHosts = storage[AllowedHostsKey.self] else {
                self.logger.error("No allowed hosts value")
                return []
            }
            return allowedHosts
        }
        set { storage[AllowedHostsKey.self] = newValue }
    }
}

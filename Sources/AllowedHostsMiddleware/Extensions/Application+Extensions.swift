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

/// Extension for core type representing a Vapor application.
extension Application {
    /// A `AllowedHostsKey` conform to StorageKey protocol
    private struct AllowedHostsKey: StorageKey {
        /// Less verbose typealias for `[String]`.
        typealias Value = [String]
    }

    /// Setup `allowedHosts` in application storage
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

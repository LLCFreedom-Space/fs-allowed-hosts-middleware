[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
![GitHub release (with filter)](https://img.shields.io/github/v/release/LLCFreedom-Space/fs-allowed-hosts-middleware)
 [![Read the Docs](https://readthedocs.org/projects/docs/badge/?version=latest)](https://llcfreedom-space.github.io/fs-allowed-hosts-middleware/)
![example workflow](https://github.com/LLCFreedom-Space/fs-allowed-hosts-middleware/actions/workflows/lint.yml/badge.svg?branch=main)
![example workflow](https://github.com/LLCFreedom-Space/fs-allowed-hosts-middleware/actions/workflows/test.yml/badge.svg?branch=main)
 [![codecov](https://codecov.io/github/LLCFreedom-Space/fs-allowed-hosts-middleware/graph/badge.svg?token=2EUIA4OGS9)](https://codecov.io/github/LLCFreedom-Space/fs-allowed-hosts-middleware)
 
# FS Allowed Hosts Middleware

The Allowed Hosts Middleware setting is essential for security. It helps prevent HTTP Host header attacks, where a malicious user might send requests with a fake Host header to trick the server or access it under unintended domain names.
Here's why Allowed Hosts Middleware is important:
## Host Header Protection:
The Host header in HTTP requests is typically used to determine which domain a user is trying to access.
By validating this header against HOSTS, ensures that the request is coming from a trusted source.
## Security Against DNS Rebinding:
If a web application does not restrict the hostnames it serves, attackers could exploit it through techniques like DNS rebinding to bypass security boundaries. HOSTS helps prevent these attacks by only allowing requests from explicitly trusted domains.
## Error Prevention:
If a request is made with an unexpected Host header, raises a 406 NotAcceptable error.
If a request is made with an untrusted Host header, raises a 401 Unauthorized error.
This provides an extra layer of security and reliability by ensuring the application only serves traffic for intended hosts.
## How It Works
While HOSTS is not a middleware itself, it's checked at an early stage request-handling process, before most middleware is even executed. When receives a request, it compares the Host header against HOSTS. If there’s no match, the request is rejected.

## Swift version

The latest version of AllowedHostsMiddleware requires **Swift 5.9** and **MacOS v13** or later. You can download this version of the Swift binaries by following this [link](https://swift.org/download/).

## Usage

### Swift Package Manager

#### Add dependencies using the version
Add the `AllowedHostsMiddleware` package to the dependencies within your application’s `Package.swift` file. Substitute `"x.x.x"` with the latest `AllowedHostsMiddleware` [release](https://github.com/LLCFreedom-Space/fs-allowed-hosts-middleware/releases).
```swift
.package(url: "https://github.com/LLCFreedom-Space/fs-allowed-hosts-middleware.git", from: "x.x.x")
```
Add `AllowedHostsMiddleware` to your target's dependencies:
```swift
.target(name: "AllowedHostsMiddleware", dependencies: ["AllowedHostsMiddleware"]),
```
#### Import package
```swift
import AllowedHostsMiddleware
```

#### Add dependencies using the branch
Add the `AllowedHostsMiddleware` package to the dependencies within your application’s `Package.swift` file. Substitute `"name branch"` with the latest `AllowedHostsMiddleware` [release](https://github.com/LLCFreedom-Space/fs-allowed-hosts-middleware/releases).
```swift
.package(url: "https://github.com/LLCFreedom-Space/fs-allowed-hosts-middleware.git", branch: "name branch")
```
Add `AllowedHostsMiddleware` to your target's dependencies:
```swift
.target(name: "AllowedHostsMiddleware", dependencies: ["AllowedHostsMiddleware"]),
```
#### Import package
```swift
import AllowedHostsMiddleware
```

## Getting Started
An example of a method call from this library 
First you need to setup allowed hosts in field - `allowedHosts`
```
app.allowedHosts = ["first-host", "second-host"]
```
After you setup you need to call middleware in configuration
```
app.middleware.use(AllowedHostsMiddleware)

```
To access the methods that are in this library, you need to call the application, since this library is an extension to the application

## Links

LLC Freedom Space – [@LLCFreedomSpace](https://twitter.com/llcfreedomspace) – [support@freedomspace.company](mailto:support@freedomspace.company)

Distributed under the GNU AFFERO GENERAL PUBLIC LICENSE Version 3. See [LICENSE.md][license-url] for more information.

 [GitHub](https://github.com/LLCFreedom-Space)

[swift-image]:https://img.shields.io/badge/swift-5.9-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-GPLv3-blue.svg
[license-url]: LICENSE

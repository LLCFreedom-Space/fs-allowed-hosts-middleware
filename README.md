# FS Allowed Hosts Middleware

Quick implementation of allowed hosts middleware.

## Swift version

The latest version of AllowedHostsMiddleware requires **Swift 5.8** and **MacOS v13** or later. You can download this version of the Swift binaries by following this [link](https://swift.org/download/).

## Usage

### Swift Package Manager

#### Add dependencies using the version
Add the `AllowedHostsMiddleware` package to the dependencies within your application’s `Package.swift` file. Substitute `"x.x.x"` with the latest `AllowedHostsMiddleware` [release](https://github.com/LLCFreedom-Space/fs-allowed-hosts-middleware/releases).
```swift
.package(url: "https://github.com/LLCFreedom-Space/fs-allowed-hosts-middleware.git", from: "x.x.x")
```
Add `FSGetAppStatus` to your target's dependencies:
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

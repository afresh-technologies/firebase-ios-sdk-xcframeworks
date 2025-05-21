// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "FirebaseVertexAI",
      targets: ["FirebaseVertexAITarget"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "FirebaseVertexAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseVertexAI"
      ],
      path: "Sources/FirebaseVertexAI"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_AppAuth.xcframework.zip",
      checksum: "3715473c93d6038df5c7164f864df46900488044a646754def23aeb6332f418b"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_AppCheckCore.xcframework.zip",
      checksum: "8d94161a7ba3e23a683008f1f02f906bf991263a56eb86d397253432ee1d3fe4"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FBLPromises.xcframework.zip",
      checksum: "dc06576ee0a8afc116cfcfd3008284f4e885f1cf8e5d92e37d118938c8c44a2f"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "ccf544e5ec2e660bc7eb01d071acab4644b0158cae9732848dc76d1cdac1d7a8"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAI.xcframework.zip",
      checksum: "852264b802db89628772a90583e72c2eabd3e5980267711d16fac58d319d2328"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "ae5804222258c289ce37baef08e47041f2441e87a5f59f268eda725714819d5d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "f1889faf560ec792733b2dc122b3bb81b89bd2d28bbfbff24c440001723d1679"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "97bdee6cf2a17ed9f79d5c65e309a598a8fcdbe7da6d73c99cd538e34489d4f3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "4fa84cbffe6de1fbf12ce9ef16537a178cb17ea96ede6155f3247eeccb990fa9"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "197ba28e1bbbf51ca960456481565e36d783608ffdeb00626ca41613156abf2c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "92342bd9d0f52b54ff7fe965dc641b270ca380d1cf270cf537ea26e578cc5b99"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d43ba768ec3c90b86f42cd218a31adef8d81b05cd151e3717d2a3b33c65a0f81"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCore.xcframework.zip",
      checksum: "8615a706d6beb7b32a827754a4bc0cea9488f1d1befe0aaefdcd033492709ac0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "428acd6ba4f82df33d06c8fda925d209e5c75e51ba4c0944be47f78915e89938"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3b71390fcb73bc5b9b0b1436d4139928fab96c7c8be5653bd35b9194e8ba9105"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e968e9f6ecc4c11edfce8306d0681996e9bad6422263fe32f305683cd7bfda92"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "7725e280b8b92253947e28ed0fb3ff5f00a055bcc5838020832dc8595d3b6f45"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "be0bd86d11a5a093c6e5431e551e46128b9bef17c6b2d5a968cd66cb821d1e1c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "25ec66884dc1a3effb9efbce83a7650c79cb926ead6cd502e8db727569755524"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "b789eaa8fde57701812db3722d75b9cb15bd6b4e8bd883524703e6feb812e299"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "c1b0aa31cf422bd07be2cddd4de6364034d6462b2633ed8ad6120550c2db4c3f"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c74d804aa2426f51fd5cf3bd6aa7abaae0237854e00322aa3fce8d695a95c06e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9ebc88bd4dd0248e54c1bf1af44275442f80515d42890f288e60cef33aec0c7c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6b2ef0ec5d9390d5c862d87cac888698778b6735aa5db8296cdc50c8c8fce043"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e3c3506d9b977a59cba031194cfde9ed63ac6127e6e5b7423b831f6008789f50"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "189436fb37d76c854d23608e45d69c52986a0634344b14f833415209c66ca0fe"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "d49f441ba3ca4357a08b6255a131a9925a26f9bed789c4ea925ed2f1a1fa574e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "0218881b13d34d6e0e82c28f348a5ff5e46e6183497b5a07312ea477de9704bd"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1a794d4f0c48374e121b21819038f5eb08ba024fe05b268482c8c3c3ddef1a28"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "fc68fea337644d1881a85e8062a94781fb16db336429264cfbf4eb30eabe5127"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d689991e68de051889051b3c7cc5f183bb1edda6586eee939e19eb7461c51a8a"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "1e19b6922beec68fc463c4111274cd760c4b8ff21fe2b1f303896e49a9f4533e"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "f01b3b71eba5d9ac40290861f939b7696a3c241ff185f7fd32c9c1f2f14ef197"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "7c73b6b4037407239b25907cbf0c5e62a10f18e119f2211a9ce1557cad2b4273"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "bc580192a7f7e0ec85de5a8d10ecf045cf63281b9ce8f653031074bde012017a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "6b02824bcb4160726ee889067fdc3755b819553caf055f9a5eb6372d1409a6d3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a413def06254b1471071a75f99a3d9ff26b6ad860d3c280dad69da788863a0d3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "9cb76dc213da6f5884a26a4ec53d420d43a944530d7d350e65fefd99f00fc406"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "42e1e1916017fad4b0a154fc6e2b5cf3d0dcff06b8a749aad65e0b77f5f1a7e1"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleMobileAds.xcframework.zip",
      checksum: "1c640ea464c293255c1c164ead253b02e16a69c3a40d8bc3b3593643e077b902"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "07c34732fd7edb8b23bf7c44c1eb58696279e457eb8a7f1328787b001c85f983"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "b6a586e92dc85dad2ff5f7b2157c7aa2cb37d0d896676e98f9d9cf761bda7a95"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_Promises.xcframework.zip",
      checksum: "a57504024c77f8fec7c8cfde3d4ab829e9eb4191ac8f0706612f53be4dfd61b0"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c45ad0f9cd8f00d62f20d768ed2aa2db33c69f09593e7b423d0bb619a6954777"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_SwiftProtobuf.xcframework.zip",
      checksum: "b527b7c5c45a6f1d693a2c279ac7aaa1f682822008c86af84443f723545a339e"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f615d9a31bea487d552addd99e991766c5aa11d634dc7dec82faf0a9fde7719a"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_absl.xcframework.zip",
      checksum: "9edf54050e3b551a2db4d8f27042e3756d80a1d9c3d8546a07122896198373d0"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_grpc.xcframework.zip",
      checksum: "5d70779699b8d8535a32cdfe637b0e7d600bea1142534a6bc81d9349caead403"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_grpcpp.xcframework.zip",
      checksum: "6277ba4bc10bc74dfe5c89adfaf25f35696d0eaf0f0be35bb170f03ab034380d"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_leveldb.xcframework.zip",
      checksum: "32566188e34c09ef17324bf35599f9ef11f314be4b9c688a08056d9851d9c534"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_nanopb.xcframework.zip",
      checksum: "41806d4016e24d357a8f904b359d96c5f6dd2a01d47761b4e06cc01e7fdad599"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_openssl_grpc.xcframework.zip",
      checksum: "5318a579b0a025fa986c7c0293e70f6b2cba172e8edb84c1ff013a292398c105"
    )
  ]
)
    
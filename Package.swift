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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppAuth.xcframework.zip",
      checksum: "8dd37ef611e28a7ec79564b8500b309a3a54e02d31ec31154fe6d0c4d54925d6"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppCheckCore.xcframework.zip",
      checksum: "58b128c916060ec59b1e6d2c586f3af1e84d26aea3e1f411f456630a7ff2e141"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FBLPromises.xcframework.zip",
      checksum: "c6da5df10ffd54fc6ddac765baa849473bea74904365c973948aa44713d1718e"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "06ddb39ae3688544bbc44fe85f27787d0d36c00552306568f32e882030ac363a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "b7559c34c3e3734dccec1e0858bc5de995e9d497ad6ae2e403f393057a9adb4a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "290944f87f552c09d9bd1e2473abf25833d2a7ad489a2aadfad02176b3d224e4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "e330905337a4ae6087dc61c37fd96368f791900ca7a390ec797318fc69360fc1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1a1dd600979767465e3247c132959df194e0446cc82ff07d1a0afcc88c62f145"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "ad098a81dca230fd6f3deceba92b57387d03c6b367cbe07cb5728ac02b4ae878"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "3149aba344b4552c7d629fa3b7afce24ddac9cc83e52f03f3ec32cd3684e58f6"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "3a0bdf889c9f1e44082f19f406bcade0f11581defa8bf4cfd48571bc3d10495a"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCore.xcframework.zip",
      checksum: "72eb35f650a529d8184532de46eb10c17f9100bb0c700e66366940d3ac97275c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "bf2e9deb76fdde47c9af562ebdf5c96d87023ad76fbc3e7e034eda415834fca8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3468f387e96b9c3ed5177798c5922ededeb5124bbd985333c8fb0666af7bba8a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5048dccd2e5d977de670b013827cf0987a6f7d8c87eeffc27c6521bbee1ba258"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "8a38148fc7d14632feca1b65c17ebaf0384e19a5bb6c595db3abade9139a9b46"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "9ae77709d8a87d390d93b54250fcba64dd9a21f62222f16432f4d27aeac7d809"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "43eb17f3362e667bd79f1953c6a5723b23ebcb6c15b6811cb862521e49bb2ab0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a0bff43d69a76433a58fcd7d6c4acdd696d8079abc9d3da3f22ddf5baf53b3b3"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "cb2e9456aa301513baafb9512f0de885724ff3e0ee15b53433cd27d41bd45b30"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "0053845f22c8a530772b95372bb1fff944644760cd8cd699ee34b46c2b78b193"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "8caf3ee97b71c680bb50c7bd1757dbe8bff707c48ec35c273bdf469a3b0677e6"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a713abf3ff10b83e9597d801c126bd2f5d213093a33d3c11944832eced07b4e3"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "eb62d881d00359bd9a4f671c35d40a90ee4e6d1e96c666078822d5edd1b8325b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "240878968c42694660bb127f8b2009ffb88a1cef9eb7b18b44bda530a82a34be"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "de3a71a7740774062f9eb6685d0c3246ffc749b841da7d12f9d0c95cbd9d6aff"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "027392d554ea592f782d2f4dabc26611bf830768863735de5f0d3e7a4960e2dd"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "e5ae8815c0e7c18cfe9cc85e617f6863bc75d373d4289787b67618dcbc4e10d5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "45d63b5df4d249496c254b4f029b3a0df4c51f4457f28ba0da522eb51ad55754"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d2c6644f5017bb220256b93342abce886fc3c6917bd95a2eee899b117184d8f8"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "ca748b1a83b802d2107aa25304e38e512dd416d25a0d2f4512a5d455a3285309"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "c2420bf7cff69699b9e233d1fbefeb2668dcd12639f73f1bad43e3e102258aa2"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "22be07c5b9f76ef5585ff350efbd84f449d8b69d2096eb8d8241902574745a81"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "9d810aa808b1910cb40a1132f2eb5b0e5fc648e88a02dd8007d76495d73b17d1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e412b5ac5c8a3cc31ff154af349bc070a5e3926e430efe66a64d13dfcdd8b57c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "7260fb8f3a8ac583a4a0de6dc0c82b14ce93875d88b69c1dd85cc6af93d6d138"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "a647bd490b0d9d8c6fa3ddf6486b0d41a93ef1bf7b349563da94c929b36e10d7"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4fc46e76d4ec62e4e57c5454b86d31b3c70eb1449b2922f65948a267466ee007"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "9f2c6ec00bb3f8c0cb52e0ce7e836b17341b34be50131f5dd80b3cc1afdaf8f7"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "b85c6536e3a8bbfc411f22d12e61569e9861574e65856e7aa9f154a458c87d08"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_Promises.xcframework.zip",
      checksum: "d4f014abe19dcadab86e3db21fabd1a510a7927ce5bb70422ea88861fa71ab7a"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "9a2d8581454514c4ba041d961ad21e1131dbce7ddc3abf29ec8ec326c8e5a9f3"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "bc538995910281ddf1a2d986770e37035360ffbf467e86eefa29a77cd5441443"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "7c91a107aa24f4acd8a6b5dfcd06843a378411dc16b70bbc17e8b5092ed7f66e"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_absl.xcframework.zip",
      checksum: "7d5ec1235b87e9fac6759bea5198d2b1e7fe1329a6e48adf248b2070ec78efc8"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpc.xcframework.zip",
      checksum: "e3832ce961529492d6eae772d2670f4cbd10ea8f403ba2390481f3e9bc8c2f13"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpcpp.xcframework.zip",
      checksum: "a576e6cece8c61a1e8fbb1585e38cd1c2cf2047234ac44fd50a87b7d67834ba3"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_leveldb.xcframework.zip",
      checksum: "c4fd500067ec3b0656d55d91ef4d334dda1fcc3310d752150015cc6150d6af13"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_nanopb.xcframework.zip",
      checksum: "03e15c57eadba1a3a00bb09a728ce8018c3e9b3891e1d754afbd3bb5938b64b9"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_openssl_grpc.xcframework.zip",
      checksum: "b2cd324f392944fa34de23776d468053b58ce7a0f9822729c6058b5f6bc0edb0"
    )
  ]
)
    
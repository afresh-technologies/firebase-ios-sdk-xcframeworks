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
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_AppAuth.xcframework.zip",
      checksum: "77ee89ff68f17905064cd6c6317f96291876b70684d3740ace57a44fd99e2a15"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_AppCheckCore.xcframework.zip",
      checksum: "273aa84869f6fd0ecdadb2acd9e2f5badaf6cf024680f0f402dbb423cb97eba6"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FBLPromises.xcframework.zip",
      checksum: "0e44adbd8b17372c97d0d1fb0774083f2700d7991386d5a8efbc16f63ad4f033"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "542c8c92190d0cbe94474bd2a2919811c3fc9cd1501afdefd5c7f7d035002dea"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "81a95b046e3a8df19878470f9ff410258ec4a6e1c2002087a3e3a87d2f55e4fd"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "6449477e4e530a24349dc102af03b58c8ab2bd63efd388ec96c66396fd490b06"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "87b35f73d961ab9802e72b89224a773ce15944cdc266ae21d7e0463c8d908a18"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "91c599c323a16197b606b2bb0beeafe7367fb05d24bb34d9937aae65ce2643f4"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "da62a55c3992f10ca29fa72c73422fa56e7cacd39ae144eb4e8022097af6603c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "b0b8333f5ddf5ab4689934427091a19d6acb40e557cbcc492371a9f7ee02951c"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4130de51cd06b01a047c04d531293451236932cdd6379cd79e9237997a33b4e1"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCore.xcframework.zip",
      checksum: "bc6e88293e01c13c8f1e1c0b30dc553cd59357b85104bc331bf0f383165fc6e4"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a0bca6f2c313bd705370edf3959413674b76ddc72c90139805a99d0d5e841d3a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "677380adbc097521dbb21add90c90c187d94c9c4e097a1a49ba25c11816a92b5"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "63bca6aac942d35ddd754c73528bf8fd37efb6f465904616592902250930356b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "eba0b0561f05eff8410bd62ddaaee93e682b3caeb41b1b52719fa9f5a4f402ee"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "c1bbad2cebe45a247e9b40aefcc51ef348afe41f50dc9a54df7ab0a83cbda448"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "c6a8a8dfe02cb91ac4a088ab649e52dd1409d21475c37cb473d3ee1e6f350c33"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8a0e592827f736df70f430c5d53adf2e1de79898d9775dd12515f2a545684b23"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "536de906c36623eb055c30505ca239e0f97089ade0c636ab3289b055bdcd65fa"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "8f78f2429ad9325ce0e7098e9972c39d230724337823322205e83cec7e19cbcc"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c48f9fbb32c93510c93d53f43642b4dcd3ce670bbdd926396336ad357f1a1442"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "d2909a523d17c03d8dc0f3dd3c1f5af09ec5e0a91ea7a42a1d4af1d435e387c5"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "94c0b90b84fa66084434fdcd02fad5d207be81c3ff1eb096e5bb8a361022753b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d1e2ddba7fb4dec8e7c48ba651996f7d68572dfef5d0d8888e5d810ad8832d63"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "763508e938cad5bdecf91d6e5e8d59ec1c531b167473ac65a0d0a1194fb0304f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "5ca5960a9c48ccd014585eaaf1063aaaf16cf9c7812926e9644ab5cc8b4eb859"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "84de3572067599793e6cdb08f915fe7426b44dec946db9a6c7b74af93fde1d00"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseSessions.xcframework.zip",
      checksum: "040e4def8116257bde52ea6a3e99dc5531900093b5206fb1438af637d3666134"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f43c99f9a51a4dd029bf805d553c786d04cde1803a7ebdbd7ebdb3174ccb8730"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "d00ec33dd45d3e245532a8b4a80c513bc637a9379c90117acec6f38545d2dc02"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GTMAppAuth.xcframework.zip",
      checksum: "dcc7089e03f43084f7f5b52f6d70fba5224177719bcda376e84eccafcfad7e9e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "80bcfa0d6f07e9155d3b29980e0ad013bc87aa73a40da27648a09964d8d7a03c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "edc6b63802409d0d7a13e3afa2eda8ba5e59cc7a9585ffd82bb8201432ceac43"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "0a074a335fa091f84dabf5476b0cc1e23aae7823a74538b9a59f9135b318a75d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b5962fbc171b72f0c8842c6fc4cae3588604cf7aa841baafe6a169da16e6187f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "18f84b2c399ac52bc3002db99588a7f2de410c7736baf3a65c4a328d1d535e9c"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleMobileAds.xcframework.zip",
      checksum: "56672cb4505b6f7513856011da59fb8a21b73efd055aab728b23a182bf3c60a6"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleSignIn.xcframework.zip",
      checksum: "ca1c38349809391e13de45968569ad46e5b570e80baa3ba3fcc5ada988e5458c"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "eb6e55d7409fd9a205b5b9efbd33f32b6c67041634127fdb22c2369eb436f714"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_Promises.xcframework.zip",
      checksum: "3a91349d0df3b933adc39a7dd54a3a47681381a8591b7efcec0dfb0c135c4f5e"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_RecaptchaInterop.xcframework.zip",
      checksum: "887cfa61f37e36b8f7a634c2435ac3651b5641f6f9f0eacffa7db092a549b234"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_SwiftProtobuf.xcframework.zip",
      checksum: "b9307bbc1545623f60300ad336007e0e0743c6fdb30eb300cbc9d021c7dfb7f9"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "dfadf883cb2ca68b41116e82ca3dc4ce1c40107090bdf48a6bf54a1873741501"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_absl.xcframework.zip",
      checksum: "0cb36649f00e362e16170ec7f4a3211d5c92b533d030baf1e62a26351e38a35d"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_grpc.xcframework.zip",
      checksum: "058c35dce716c94c65826751bbc1eeb5fd2c3ba20629bd3fe8189fe0325ab9d1"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_grpcpp.xcframework.zip",
      checksum: "7398a59ca1ff69763a875397700db193dc6b5e042a5b9df14dc8e545315ece36"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_leveldb.xcframework.zip",
      checksum: "88c1af130a8929805b34d369094d0330df8cdefe39b6cd632354bb345e7030a9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_nanopb.xcframework.zip",
      checksum: "236f6dc57583a5eab9b83e2f229606d4cda6c72cbaf05a8ea6f3806af14fa2ee"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_openssl_grpc.xcframework.zip",
      checksum: "e71c08f93b4e489f769e1d2e2f1e58ff590f0cb0f2a8a6a48a3e42ec8d0f40f3"
    )
  ]
)
    
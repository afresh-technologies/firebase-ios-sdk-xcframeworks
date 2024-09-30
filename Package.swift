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
      checksum: "da9c2735880fbbe36ce347a9ab5217a3d8ccd93d57b8bc1c6cc5d6985eeaed2b"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppCheckCore.xcframework.zip",
      checksum: "873d31b2ead11bf88fe1994992c904e1fd73cdd580676a31df5a4f48efc3856a"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FBLPromises.xcframework.zip",
      checksum: "4a072d15f43b506c2419324d8d176b45729b54580e1ea6747cf752563fafd87a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "e522fa53c1c1465b7955c69a3b70431e46c5a7783cce45dbaac80912467e1a08"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "b0fe5bd6bdb6e42b985be8298b1e8de212c5be25cdba9d6d6cbfbf219a9e7e68"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "d3855b9fef123d2f42ac647c69c20c568a20341dd37bfd990d41671b0030e9de"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "dbe2d97c2e1d0be3a0ec340a14e6058677362f0ab6ad1de3ce70fba5dca58669"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "68ef19534a7a04ad271ef5cbff10c0e5dae2cb0862445cb144dbda90856a3a7d"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "87b89bddc8486a35d4c91812cd8355ea9c866062b3a4321f85ebee37363e606e"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "062321ca755764e83b00079d31ff64046cc355e04fd94f09f94b73dd9d46bd91"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "90e7b811709714e4879379b23dd8b3dbf7ae560fc4c28077ece15a05315774ce"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCore.xcframework.zip",
      checksum: "ffbe551917b96e6d85fbc001d7746816881b87f15627f5a5d1962f7837d39fac"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "28f375f5b3ceebcf608be3fc64900401c783a029348fc13965fff5dc84593120"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d03f5120aa18e2279aca4b61c28f3925d7828290ff92d65909de10dfc8824f37"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "aa42e0619f067bb0bad382778f35729cbe9886314deb3622c4881c2727b5e826"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "420e223b7296ca6f106c7b9f1d4108219fb2707e6007511b9e037b8f1504f24b"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "cca0a0f33a16ac4e0cfb04bc37a5eb638340e06e71d2a2713dcdd253b71590fc"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "27e04231295ab44b7de3d42f2562743a51592989323234df48ac185c18518828"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "78282869e9307d2a1d4e8e1b2a692e2a12e08792fe0bb5e025f1034b77507e83"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "151c63b3fe48562b014aec3b056a86fa4db6de14a574c6355542bca10e73c647"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "b6b3a7b4b953ae166813cc8f39bb43e04664835599f9c473f242fea4f1844930"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "90de77f66320b05f62bbafde4afcef22c8460a0c3158d0997d3ed42464099141"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "9bd86f5013e97d266f2ffb62232096a041322ac584b4052b1d727cc4de7c2254"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "87240c8dc1750d4954f535535d79ba161f34b9328f72ea9c3e170e016e0d6a38"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "07b30c88f317ddf872abee6858627e49d4555173b78233d3615ff0640b14253f"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "fe6ca4e52226a326233483dd3fb255403fcc4cd2f094ab029f7d9a4f3e365539"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "6e07d8d4b526a9bc81abeee26d134897c26da0172d0e222ee0deb4dbc6b1b6e1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a578c67918172b2a902724b01ea9c80f38600ba7b8013f57874f1755808a11bc"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "95feb833e5ee7792570d2c927e4d2ba2c84e60237fb58e38db401eb1137fc44e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "30e6a2760186e877d8aba7c7b4aabfa72a031f387626dfd2046311ec8e37b825"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "febe54858da9cddc0c2018cfb2cd11680b1539e8589ce7464eae4518b027a50e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "4b93a72993cd7df51a0774e9d3f710379e767f66135dbd73697e1ad695664414"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "849d09df9e8e21a26c880b9cbaac89971073c7a77933d1e42cee7eb45da3f275"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "26ca456639ce99e2d0819a05f7eefdd2a3e4b154f1da42a7549a2340898e6900"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f91384e8a876dcd245903ca2f488e8b659bff065f34b4be9b20ad9809c16df87"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "7260fb8f3a8ac583a4a0de6dc0c82b14ce93875d88b69c1dd85cc6af93d6d138"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b8cf8fc1ba9204a61806b0dcb536a40d787a5163f41a5eb6b4d9867bceb9a4dd"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4fc46e76d4ec62e4e57c5454b86d31b3c70eb1449b2922f65948a267466ee007"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "db1fb69a0d73a6ae4363532b8603fa7f4186a390e60a4d7c1596d21bb6c87cae"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "4a53c48c0fbd600d09b7eef7a6a41106fb6df62d666eadf315cd59fa1451aa3a"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_Promises.xcframework.zip",
      checksum: "45bc6e985e8ada95a67a1822f388f3cae85571acdb809f38562331a466972da1"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "88f68738d41613dfeba22cd521a782441755b7781a173b34adf8c131376ab5b7"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "d317c7cc393da3f5f419feda13c56e4d4cf2cb7805193372f704c1d0371f8a95"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "7c91a107aa24f4acd8a6b5dfcd06843a378411dc16b70bbc17e8b5092ed7f66e"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_absl.xcframework.zip",
      checksum: "8f12486bdeccc35973a5b01b7d54fb6969efd9cdf5f8dab096d05995e8a956cc"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpc.xcframework.zip",
      checksum: "fc384cb52cc93397d014ac34e73491ad5ef15c2c02d5a49284b4599c3606a876"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpcpp.xcframework.zip",
      checksum: "2706a19bfb05e681f53c8be1524efa3f24119777a1f99b9a331a687f3b61cffd"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_leveldb.xcframework.zip",
      checksum: "bee71d118c8b87be53bb04ff9073f8a5b829e4199ca26c43061529bf82f499f0"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_nanopb.xcframework.zip",
      checksum: "de5a9185f1a39734cbaed0aebee3d3c0a4a8544b8ed027755f099508b02dc98f"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_openssl_grpc.xcframework.zip",
      checksum: "c1c7e6f0ca719adf1ce6fbdd4875b48ca984961bbbc03b4d8fa69bd9204273a2"
    )
  ]
)
    
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
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
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
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAILogic"
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
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
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
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader"
      ],
      path: "Sources/FirebaseMLModelDownloader"
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
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_absl.xcframework.zip",
      checksum: "2609274ef6d9e3fdf0cff34f5ed8ec344a3108ce13552287329ee6d150a1d195"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppAuth.xcframework.zip",
      checksum: "f0835f65d86e3845e27694bc4ee3a88108b365bee82d1ce950627615e40d272c"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppCheckCore.xcframework.zip",
      checksum: "090b22baed7d1f24daf4684b1ed7ada53d589f2929b1c443bf87c1f662e2c070"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FBLPromises.xcframework.zip",
      checksum: "c69a0d552f2a62491c6ddafd794adc3b7d6ae6ba5f566fe2a15cb8d63fd2c8e7"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseABTesting.xcframework.zip",
      checksum: "767a611f93f68b423f4ca1305ed5b0a8e77f326e22b69ad014f205c27e5be45c"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAILogic.xcframework.zip",
      checksum: "8e23c55e705048012c6e843c6c0dcd7a9d9ddb09b2df51a2db78809264fffd65"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "de4a88a293edb115d0305ae13b6709b4791b6b85458bea17a4b6c7437cd6a03a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "b133cfdd1ebdc328b365ce8b9a45a89eff2c87937c59ef1bad90657be14c80c4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2e40eff7eed36df4ba7bccbc9ddb26dd582b7846c5966e84d37d8fe991d2d3ce"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "934e5d9a086a26bed1d54447c8211acd6ba8bd2e8a0b4f903d2133fc4ae626db"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuth.xcframework.zip",
      checksum: "7731376261fa6e9fbf798b7f8eab1c6fec8f299be73447362c196090b7f6c7df"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "43de433832565bcca0757056b28e7ef5608153c1bb6790bd99e68d6eadfe457b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCore.xcframework.zip",
      checksum: "bf56891bb0b5fbed60c55013359d511dc0047e4c821c5e4a53f82303808af071"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5370cc38d59b24f55df182a0c5b417add7d0961f753cd8aa315ef2fcb0bdd681"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d5103d9804268ae3a780db45c04a1758a0c055b583f6ec84a3574a5a5efb2060"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "ad52e5fe3665fcff36c1143585fc099e572bdbd293b05e5ea479be950d670288"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseDatabase.xcframework.zip",
      checksum: "9eb1a650448d8928dc51967f750dc1e71498eee0252fe823be8ac563813a62b2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestore.xcframework.zip",
      checksum: "780a650b14a802ac4c083b48ee62886636cacca8601868e4c7f2872ce681c5eb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "6f05d7d016ae45f352b5699a8faf4b6fb065e1406069a9b3bb1bda3a713f461e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFunctions.xcframework.zip",
      checksum: "f2ef743e7585bd7262279d5cf1a0d5a89520c7e5296700e3e8dc481489671d9c"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "63f7b1d84ba0412f8e3bee049a0c145f128c9efefeed130da8f3c904e40e5373"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInstallations.xcframework.zip",
      checksum: "6bf518fd04ab788d15e0cdf180ed1b408412a52346e04943434fe64ebb3082ab"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessaging.xcframework.zip",
      checksum: "646fab6ec3ecd152b60cff904f1840435d95c244a192b5d8a3ea1bbad1ebabe8"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "4954f42089c6a3f021b10b8d7d9f7092a1c1ecf89147009b3247348c92dade01"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "108fc714a8cd604e5f9af892996d49a6713314d60e16b1fa999c41ddb0330a38"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebasePerformance.xcframework.zip",
      checksum: "4d6722d578ca0119acc7c9a99c57ed81b9111694f96c901aa9d13dcca1ff420d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "52d48b1f407a54da66f4eb35f636eb58197abf11b94f8042eb1ba3bfc928b017"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "58054c6c0598755e9654efb28d7d0fa0576b492bd504951a4836abb7b6fe6964"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSessions.xcframework.zip",
      checksum: "1eceafd5adefd68b72c7cf985475db17a3d13172dc4f96db3f0257e83cdb6401"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c5563195180188fc5a079f3f6b3a38a06fba725a1727bbd52ecf712950f34904"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseStorage.xcframework.zip",
      checksum: "b8ff21c002ed93baf74562923b7850135b13b437f806a2e15e67467f37e28e5b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "31a5a1f5204f4844a480d3889b6ebe2e69473ef32b868935c51812c0483cb08b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "f36443f9638dc67a7d79715f104dae83946b9d0f8d9dd9d9d8ed0849c1f48764"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "1901e4232ae9f263e6a17fabbfb896b81d30f683655084796172da15e80e0abb"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f48692d9412c188a8ae1ab9aab3a440c8efdb68e48578ba592158420d44ddf43"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleSignIn.xcframework.zip",
      checksum: "5b2522a0156193f364202ae504431a385bd255d346d1f64bc66c2f4e108ce8a0"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleUtilities.xcframework.zip",
      checksum: "c1609c31d41f0e9f6cd69b686d1bc12d68f3f02f6517843cbca4279d3cd7c28d"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpc.xcframework.zip",
      checksum: "c08aa9d2ea668f833c0089f6bb52490783993df624483b3f2a3ce1928a3e1166"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpcpp.xcframework.zip",
      checksum: "74b7cbcd49ebf49cc86941b2f13529582b759444db4587d15fad3e5572c716b3"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMAppAuth.xcframework.zip",
      checksum: "d8ae5b1acfde92e90ef96a37bd91d10c5e99f475fb534da87a970d3f490616b0"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "698028128be51ced22db320e66531f7dc98762837914dd0c9f8571d70800f049"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_leveldb.xcframework.zip",
      checksum: "3ccd8602818db0d8639cb5f27d69262577423553c90b0b5315cab1d3655c6228"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_nanopb.xcframework.zip",
      checksum: "8643716a6217d72db071d4651f3ebc546fbf44dcbf9b0a83c433ab77ac849da1"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_openssl_grpc.xcframework.zip",
      checksum: "b40d3cf78cec0fb9778e9c7f05a643ed96b54f7d1e398f7c37097f6c86272132"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_Promises.xcframework.zip",
      checksum: "bae29ae9d3988348e15003466cfb3340d623739b79a2931c2f503ef23af30646"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_RecaptchaInterop.xcframework.zip",
      checksum: "f5c380df385ea5ac1975cce793e4f529b3429e4a8e4902e703990938220caf27"
    )
  ]
)
    
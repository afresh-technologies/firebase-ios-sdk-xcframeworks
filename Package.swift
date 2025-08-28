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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_absl.xcframework.zip",
      checksum: "624c1819d521c981bbfb8da47f683a8ef1c28366fb90e7de5965b61925dbbe68"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_AppAuth.xcframework.zip",
      checksum: "7d63bc3a0f17761edcc834d2993f810b05573323fe9a692161c779c9e99571f4"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_AppCheckCore.xcframework.zip",
      checksum: "db9148777e18860abc2eec9b75e378aa82c8ae1ed936f9ed48924eb8a814d09c"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FBLPromises.xcframework.zip",
      checksum: "85919b36528dc995552b580947240848f35ca24b1d8df254b33c87caef72f830"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "900ffff3d1132f61df01f53c2a83be6578a0ce68d43a373ff86f42b92cc41b45"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAI.xcframework.zip",
      checksum: "f3219d671d05f8a73c9c277a2ab5b17c873ec68fd6707cb12fe7f6ade2541003"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "e64de107656e38377d03a504f9908404d7c081fbe492e16b37e10fb036f1ba34"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "3f769c6748bb48e39d94c04844f6eaf1bdf833f31f2c20ddf29bbfafca9f1dc9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "6e7ec888627d76fd61d66e39a5a170df2f7273a72aa67f9b69ed33bc4694e245"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "b0ace12a60762f07c5cdecf3eabdcd7cf31c4a65d016831d880eed9a0a6e1546"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "7e3f71aaf98f62ca83e770e49390e6efc9396a75b5699d04d8443418bc8e2936"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "bfa948f7f1d2ecdcaa9351a122dde90b13f093632112c0814dc4ec7118f3588e"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCore.xcframework.zip",
      checksum: "32d76790a09cba2df95b6f7a0cddec4c3235771ef342cf75deca51f7de53fc98"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b7ba841c6cfe31996a8988e45efe25ec0512b6dd79a63ddecaf33fed000b19ad"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "94fef77c0e6172e2f23b53df231e611aecd2410ef5dc2c1e288f45c04c1669ea"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "fa0560eb913702ee8469b71e09cbede92a7aabfa9de1d3550eacbd138d00c9d9"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "b8bc4c86d6208c516cfe7b2d322ccf9dca15943d765afaba7626815361d08d36"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "22d04be8a7b755ccb802bc9c11a1ad65ddf6a98c5b44b747bd913c97f1d0ed3a"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8c174391aee7adfaf6d68e48d3e1ca1823acc376f336439551e3d5d5b876ba96"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a204eefeea7d3a10feed6c2e0d218c779e50163501b73509a8599f1f0b80f7a7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "fb1804fa9b06d17def467dd745c9d3b8980dc7ea08fbb8fb00168495954a19cd"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "7620d91fa60ada506d1972ba2686cebf0e76e6727d24a55e5d3c3f87dde99165"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "1e8bbf561253a64b61abb025ffa925fdd964c8607c3c05873f2ff7ad9294294b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e9704ecf10253022210db67d8ab7e1b29d3de46d68e48895de36fb6beb65e04a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "be59792980522fa4b138a59f598e7cf86f9f8cd1606eb27c8b9e5b3ee5874a70"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "8d4e978f80528c15e3e6ab9abf8970e03b36bbe96a1b1f9a43a0382d5cf4a343"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "d04d592271069fb4dd5d24894bbe81694301b0b22441673dc985209b88802044"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "8a0da2fc95c62959c115ce78e22fe6aa20cd53c46417d3f1a9e3b4071c2664b1"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "5e16d32cd529325f9191fcb286b86850aa4ed98e96e0712ff60e86ec0f2c3181"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "8de03b88b4c5d8075bf207c099f856cc3bf318c68414ad6f5c0290c2586dd6d9"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "4e2c363823c517c2190969104ca072b828e27502da466d339d45e6c1e319cb59"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "9049336e7ea07eb70294b8e35dc52308d7fd4f66f1ce4589d1fcdedc515fee36"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "9b1ad859e0a37f83f902b21ad73af75f26a6033c76506b588e6d1447b292bc54"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "972682b135a558e75a1a05d144500de8e722ba50c67d44265a856b9da8ec65b3"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "71d7ed07532c178799495f53a3952f9e7771de344f70f9a850abe24d1fbcdd60"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "ce55ee661a7e365517ea6c490a19b76dcf6702a4c3b9f32979ebcfdddfd46a60"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "c14ec25126ad7ca63640c5e51733e56a1f2b73d2fc26cf0c758d957ad354d5fc"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_grpc.xcframework.zip",
      checksum: "a6e43b89c2e679e73976283c873e62797f142f7c339a1a08f22b63978cefb462"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_grpcpp.xcframework.zip",
      checksum: "4d618da13ad68638a78c7e70b7fd870ec483ae4a03d4c4bba10cf8e3396c4af0"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "9f64b3d5601b2c9badc326d5ee4c1658591c32cc6849a37767f53e7faa39f180"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "84648724316a5e147ce5be2d38a21accd86ebcd1f4fde4081d2e43b1a1afe014"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_leveldb.xcframework.zip",
      checksum: "3eb3a803aac343d7e5b002b6fd0b38db57612b64a3b2ff0572c24a9a4d42394d"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_nanopb.xcframework.zip",
      checksum: "485ac2e414bb62751278a48e3cb6c2981c5c5f2837d8c312c6fce90b98065ebe"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_openssl_grpc.xcframework.zip",
      checksum: "30f43558db8b03ed443174b0fdc88a25e8b32de629c5b4e49114c7928e431c10"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_Promises.xcframework.zip",
      checksum: "aa64126cdd2c400477037785a05a08e6ebe60425bfa3d7f35ae6ff4ba2461f85"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "120aee0d7edc801345a83df5750c79dc68c47ff858b06e51481fc163d99c069b"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "85958c2b7e7e7868cd9e92e9cf9307521ce012c5307e9ef7f7f53c2eb158a1ef"
    )
  ]
)
    
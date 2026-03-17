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
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
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
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_absl.xcframework.zip",
      checksum: "f8303df5f1a032d532e52763147bb8229c53a8d40c0a7076fe18fb05ab83c05e"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_AppAuth.xcframework.zip",
      checksum: "7bf5ac4c4b83a9325f09c2eb789070e332dbd2c0bc2797f3e1c6b88beedc6d84"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_AppCheckCore.xcframework.zip",
      checksum: "a1172f56b1193a1ad39a3f929f22a292a59686a6c24c9db0c385072f3e26414f"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FBLPromises.xcframework.zip",
      checksum: "a851938ce2145c172ea34c3213f60e5e84e5131c3d535806aa4b59f84d335dfa"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseABTesting.xcframework.zip",
      checksum: "2fbe7a01cad3dffc6c234517708b4674d6f0b19418456ac51afe036c644a8cc5"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAILogic.xcframework.zip",
      checksum: "2aaa55fbb6339c637cf2830bb59458878503e62f89459a67b5d8b44e5340179a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "15130908f7d22ca3773ef17447ede8b028b933db92c02c92f38e0d1e12fd25e1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "573872d62fbc4f5650cf8919d92762bc6b77c3bfe41559d86172280561fed602"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9d2c25f43045d636277348d60bd85589fec869133b18ed4ba63c81df905959fd"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "c245fb8e1f67deff76bda888cef83ddb32dd34f10e8d24eb5d3e0d16015e829e"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAuth.xcframework.zip",
      checksum: "144126ef6cbf2352d12dade02c68f313deeac64439d71f8bf7cae6d6a78b18be"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "691a727d51bc4184204ca8980171fa45a7b271cee3978a90c19a04871ad68950"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCore.xcframework.zip",
      checksum: "17c0cf1d9ae60ff37e08d905522d2b08bdba03b656c9caeb7cd9b570d0c47b37"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "93de2bbe2796ab2f391a34e3a95bb6e591c9451bce6573c38b6072ebf107fa07"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "23ef74f005273db871e01d9b323e2067832c18eaa32bcea7ab27e48d664c2557"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e5d6bc5d9fb12b605ab01f3da7f220835d59dc5a83f63ec5b7940689a6e69905"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c7a26fff96e30921346a234a860d610d79f4646b012294642f16caaf2356767e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFirestore.xcframework.zip",
      checksum: "650d583a1d6869010c52724f72bb16ef7709237873736c07ba75d01d53e833fd"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "78822ae9d66c8fb739751ef6cd4e16c98a6e33ddafd1aea4f3340ffd3e8f8089"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ef504cb27f3e82e77e2e0c097c3e66a62b7c276c474ef74c92ed3d7a27153115"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a64d6deab116c74e03bc676a7aef491184569462a53c7b61d63fb602c4d4e798"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseInstallations.xcframework.zip",
      checksum: "d30a93b1245c797d6d79635722478dfbaa66fd67652896fcd6e95cb3a4d5b982"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMessaging.xcframework.zip",
      checksum: "91424b39efc3500997a53b8d7431552c8bbb449a22b33536bea8b810576c4f8c"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "07b11ec77fec5929f8c3fe405c208c3e769621f24cac32fb9fb638d4fd88e67a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "7db39cc45c83e05623599f754044b33877832d0b1eaf25e6919ce14c1d5bb3d8"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebasePerformance.xcframework.zip",
      checksum: "443539db6aba5dfcf5705b562f273348d77dcf26a0de2ebb2d5a35e7ac3a0f0c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "a98a2955b8a3ed7bfa075b907d4fa7de9c96a59d1a51c5280201d726a146f28a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "98920a60ab560a9f1a4197d13f6013c3acfc364559b51627b91218d7b98c62cd"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseSessions.xcframework.zip",
      checksum: "25f34938255a4a15bfbc6d76856afbf39c120db001f18e47460384aaaa9a1fbd"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "2ec70f6d6cf3deab09c38d4e42d9ad7b4200f0af1ba0377a78894e54916e80df"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseStorage.xcframework.zip",
      checksum: "8687c1e32695c59d101af2c00619a1f68bf9b1b9e0ce3a7088fbda7e2f5586ee"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "33275af8a3e201a4dc11e5414191d0fb09c451cbe9a0e287a1e2abec4a84ae55"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "a238c61a7e6c7dfaa66e2012d9782e6f3499eb0f2600497a1cd9c5f9b4176d9d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b6a951b938c1493793f37243c50ccdbcd355a9bbddffcd7750dd4dec29b67d82"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleDataTransport.xcframework.zip",
      checksum: "98781760f010f632218fbc1e14f3bba1aa7e0de482a5e567451cd54179896ff6"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleSignIn.xcframework.zip",
      checksum: "000087b2583e16e8a87b9cb987f554640e86b2d8aa4f9f5a0572d7ed3dbadc3e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleUtilities.xcframework.zip",
      checksum: "70716f90b3130cc9ebac90669ec41c66540d52cd345ecf12bec917a72eef208f"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_grpc.xcframework.zip",
      checksum: "a0d4506a2a861c420d3ad9749732d3caeb0a77932e7723d2b4f36b68e6e9bc69"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_grpcpp.xcframework.zip",
      checksum: "3c7ca21e687bf9a178dd14d5bd518dd6962e226830695827423c59e19bc41ecc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GTMAppAuth.xcframework.zip",
      checksum: "520d8ffb6e7f9ed82bbe45fec7c52cb14235d65d7301de61721f038581e9c5b6"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "597af82d8d077c37b01682e6fab64f51eace62e097c40e309ad59784f0325957"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_leveldb.xcframework.zip",
      checksum: "8b58dc23b0f78861f0919d21c57d87074c4e0ab60246acecb446d6aae9882f05"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_nanopb.xcframework.zip",
      checksum: "c1755c0a945c5710138914f22782469e3ca291046054935c0fcd065b66e27c39"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_openssl_grpc.xcframework.zip",
      checksum: "a15dd4a5b3cfe01e40fd8aba75d287c50f3f800690de53761ef25f762252cdf0"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_Promises.xcframework.zip",
      checksum: "b94cfafc4ee372393a70e54638705f28846df414adde9f3adba6ec8981c1cb49"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_RecaptchaInterop.xcframework.zip",
      checksum: "80683c2c32472ab85b2e8124c797ed8149fb97bf5365617b408ffb20ba4b654a"
    )
  ]
)
    
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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_absl.xcframework.zip",
      checksum: "7d17564ce9ab6a12345d25844b2b1d757f1fcb3bca531d9886544d435664d57b"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_AppAuth.xcframework.zip",
      checksum: "071be415840a7c596b1295171d328939d4c9dafdb8c0ff3621f04e5161896b07"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_AppCheckCore.xcframework.zip",
      checksum: "d9f841aeb183c241186265db25b0deaba24cd3f49298975a4cadbd0722dfc10e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FBLPromises.xcframework.zip",
      checksum: "30179ac59b1b52b5794889b1e3dfb183e60574cbfb85f34d5a6710d17dceaaa8"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseABTesting.xcframework.zip",
      checksum: "fda83c50975c972dce1fb285a995fe2097dd0e0521a2aebea55830c80afb7384"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAILogic.xcframework.zip",
      checksum: "e042788b5a1db5e02a871fd10612a28e21323b054155f7363151d76777999712"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "49aa1b144a4952c7c2c286a3196188f8dcea38da763c6117c8212e1e9d59232f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "ab79f999c6b4ae6cf610ec18c1d7fa458c3d2f6453096efdf4ba084c2a2c1e5c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "111c28405ed4a8ddbd97742dbe112cf4a8bc518ec32c331cbf7eb9f019060d70"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "2081d2489981b4c2d4809a34ed9d9e100fa4fc63cb0ef0928777507e4f64fe60"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAuth.xcframework.zip",
      checksum: "6b327c13e4b8b0c0eb140d85cf255feae9304ef6c0c018f28edfae6949ca3a7d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "dad829eedc2a76ab42a2cde9de45c5885baf61d2e4ab06bb74ad85bcbb0a3173"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCore.xcframework.zip",
      checksum: "c89d6c209de1ac5a38c04be4fb5795cb499d79b6e9ddea66436b8fd7b8ff35c1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "34d53ea6ecbc5f6c0a4324fb7d5132e456ca98cb4ba52e68445c7c8f82249e3b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "924a0b5692f65ac235361c54dda83f2ccfadbb2c3205619da7f0a470f3231782"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "0a4f195444eeefce222acf895d01c903b0891c311dbc5d5104e0ee8359c98395"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d8e24663598499588e552e50eb0f11869c01213521adcbf2fb1ef7101f747dbd"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8667616cd0a6ebac6fd78e084b153d63dfcfd8949eecaa4f4ebc348ff5ccb075"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "33aebede126b2a6f7a754a1d4be8518826f4d2b3763fe76dd5311913fa8d4f0c"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFunctions.xcframework.zip",
      checksum: "65ef871cad97668edffd05f1e79c945f3dd564f71b597d4951f2117f42e9d7d7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "b87f8e4fb8aa80fe9a0bcf83e13f28c35f6619ef7da37b3f9f0ecf29813816a5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseInstallations.xcframework.zip",
      checksum: "4739b9a703a9b63d04556547414d4b998104768169618eda85c9bc03887e95c9"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMessaging.xcframework.zip",
      checksum: "53c978b98d1178e52d338537ebcf290a2ee65d92e521e8283b15041b2f95d413"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "2d0c4c9108d1bf12b50b204c8fa6d1e4e65b0834c2b61818ab7a22d51965e610"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4e4843bdb4d5d2147fe3011df4066513da1f973cc8995d75233a2232893c6280"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebasePerformance.xcframework.zip",
      checksum: "da96fddb17b059f5791078b25b9a25d063a718891899e898d937f3a57c1ceb96"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "67e2f4c454e758e4e21e38ff469dd6588e1eb255ee56a857359a95ccf40dd3a0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a21c26708e3c8f26662ec6f3cf6567b993edf24575eb88cb090cca1925c4d190"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseSessions.xcframework.zip",
      checksum: "f528923d4b7ffbfe47f21343a43f00b39f8772345b9e4e5bd13663621626c5ee"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "0ea17ae0a397588835c6205c207395476cc0860fcd162c81adcf5224e7eeedbe"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseStorage.xcframework.zip",
      checksum: "0e16a58e4ba1c33ccde333c914cf86ee047dd0671ac32f0c56cd935677d70849"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "b4870c2e0a36127a8297342e6271c273909e86cfc05b8a4ba1534d0e643a5e7a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "b156252396b1e0b33999f48eae156e7912579405cf077a45a9b0bf2798de0bf3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "12797d6ffb13cd1290e687f789be47617d8fe84204a90ff732e0814554ef21d6"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleDataTransport.xcframework.zip",
      checksum: "03b75170d237828444df5890d77b756fdeeddee7b5b8f755d0725f51b82c9cf0"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleSignIn.xcframework.zip",
      checksum: "e776422e77da035eb94922deb31eb7e881563cea5769052c5a970d95b5becffc"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleUtilities.xcframework.zip",
      checksum: "c0e1f013d61fa9629e5f43f6ade0bc8648d5476243651322c93559597071e7b7"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_grpc.xcframework.zip",
      checksum: "abeaae81636bf5e8f39b094d8d7cd686b67b4700535ea69b0589304ff791f7c7"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_grpcpp.xcframework.zip",
      checksum: "d733f9a71580d77570540b7ab8ecdcfa486479d8a6b31c6ad03abccc2a6a916a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GTMAppAuth.xcframework.zip",
      checksum: "b431c3a3ab9a719fdd5d0350f4660f6b5eb8a72ef23c0268059a042c510f38e2"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "cb02f7b7064642a3e0a3d8e25da6ddbaaf866cca523612016dd9d9c42aeecdc5"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_leveldb.xcframework.zip",
      checksum: "3f418e1ff07c8b6ed4a7e43fed6d646e1e91b4c300314e6192302637efa4441c"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_nanopb.xcframework.zip",
      checksum: "8608558e934dfa41c97e8eb6cbe1229cfd1936755a955d79d555a652fc122e3c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_openssl_grpc.xcframework.zip",
      checksum: "7126289918490b54b6915d396371c83124c2563d42c0ab5b6403524f940de361"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_Promises.xcframework.zip",
      checksum: "b1dfe4e0a465812277bc44f2a407f4906156d0577531890292a211366d1989e3"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_RecaptchaInterop.xcframework.zip",
      checksum: "3ef753c30052dc5b9e26ed7bd472704ce0ae0437e223d8f848a0c628ceeff544"
    )
  ]
)
    
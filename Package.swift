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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_absl.xcframework.zip",
      checksum: "00faafa28495ae28d862730e1b75be9a8c723338234f60c5656bd04063f7d68e"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_AppAuth.xcframework.zip",
      checksum: "b0a84d239805accc5edf599a5c135841be065aa3e73d749e11ed85a7036b180a"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_AppCheckCore.xcframework.zip",
      checksum: "b0dd636b5eeabb536a63bfaf00bc65db1b050365150cfa43fd9adf1d538dfc51"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FBLPromises.xcframework.zip",
      checksum: "f00d5b6ad25b28d3d8f9418ccc4837d012cee07e2dee7e86722e3dccfedfb911"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseABTesting.xcframework.zip",
      checksum: "df3b88591a36c274c67ab428af2e271f08e2b9d240a5a43b8c9c1607face483e"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAILogic.xcframework.zip",
      checksum: "a6cded7e9d1c89fc24c4fea47040b3c3ffcfefb74ddf5180883950f6820e16e7"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "588f84c4f3e446c45626bddce9b2edab65ddd58f338529b3dbc45aaa33d0fb6c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "7379ee6ddf5b3d13f994fb9f01a52935cb975ccf36dd1ce2ec5c564660df8394"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "5b2932e60df384bc754caa1db15c241a1d8259f944b09d839592e2e85a6ed06e"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "6e6a96a34685501c7025ff035fa3731c884dfc9a39c44f1a9734973d7b3c1938"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAuth.xcframework.zip",
      checksum: "04507e1c022becff2a12110c2cec6eff1a4707ba8b07bd0f97e22817e86afb93"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "6fe2199ef2a49fbd39776ee73fe32e0407154b7ca7eac77a946293d8dfd311b9"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCore.xcframework.zip",
      checksum: "d45202a2f5298b0f05c8d246b458328f90001196c7b655e95e8d3cf924ea0621"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5a05c744c12ba6831b1b0e0f7667b850a3cdb387850f800cda2a6f38f470afd6"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "10acb11b1b385a6bf0849ddfd2c64c2d06792ef141a73a6af16dfc928f53a2f9"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "f7bfaac300f730dcd0e07d861214ac08e725857c51a429634a3bd08e6fbd9226"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseDatabase.xcframework.zip",
      checksum: "382afcee8d19e1c232a280a33b0eca99b5977a5d783af9b250459e9242682690"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFirestore.xcframework.zip",
      checksum: "ac261ebb0ca0302966729e0b2858cf6657b96c59a27771db5e21930a1e8814ad"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "69a299b5090ffaeeea1d0fc421766385e983fbda655b7caddeb5eb20a298bf93"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFunctions.xcframework.zip",
      checksum: "af3a23388eb2f8a8e554f8fc0acb0083175c41733285299a7652358eeec265d4"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "685cc38d0f194d37aa4b49518579953a910c1562618f705ffca32ecb295d4ad6"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseInstallations.xcframework.zip",
      checksum: "be9e9c8e3aa0fbc7fb7f3ff8f9ddda6c454f80fef93d37e480337dca5a41659e"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMessaging.xcframework.zip",
      checksum: "76a35a12f847da0583a7b6d010b7d0fd57ae9cd3da2994136b893f0dba43f08b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "cef5ce41b3ac684180aff15b65a6b3ea60d5fe6cf02a7987a48136c73488c914"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "749cf9b53fc54112193e0cd667aac66186d1bc31b3a6868165228a063ba4529a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebasePerformance.xcframework.zip",
      checksum: "b34d5f32631b3423aaaa35d5097ee8c2eb858346f8b55a81c738a7c745ac53b4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c6c43c0d855326f434014efef47970ddec376082d5704eaf6f76da69bc238124"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "9f7bd221cdd773332edd924e9c85aeec8261bb20fb4dad3ec87db1b26c7bb357"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseSessions.xcframework.zip",
      checksum: "2fc2745d38b69b75868725cb2ce934e28fb770a1f2830bf2695b2d46b65e6a36"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "a84a0615bc315aff22f9dbba4babc2da5e181086c96af281076c0322acc55952"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseStorage.xcframework.zip",
      checksum: "0a302804c043954ab77e7a3a3afe55afba09ce25b51f11b3839255bbca2f5b2e"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "44531c07bee6093d93280534d804f78792ee1b597ece9449fd26fbb9a6557be8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "a4991a077545f626948aeb1d0c14f470276b1eb318168f8e2635be4409f38d8d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "131b773467179254df591d034aa15d77b3396e1c90b86e22713e3e2854044f49"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleDataTransport.xcframework.zip",
      checksum: "bbcbe66a30f657fd7b3699240b9a2bfbf44567624ac0e02f9647fa44472fff36"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleSignIn.xcframework.zip",
      checksum: "a1646d140666e4f40ef14761423743f7dbcdcb70c2424a146680e47a97b1adf7"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleUtilities.xcframework.zip",
      checksum: "1caf79f4dfba689a9ca1026b67d853ede7ede805bd31bad08b1e644dd08b76e5"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_grpc.xcframework.zip",
      checksum: "eb7ef4eadc2cb9efaae53d65a2cc72185139a69d525dfd51d86ae902f1409a93"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_grpcpp.xcframework.zip",
      checksum: "6de9af276029ff33c74f1440b67b6d77c024764fbdfd61c911f8b98c806fda63"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GTMAppAuth.xcframework.zip",
      checksum: "4c7d09cab7dd78903349ce50735d546f5035cd49d4649a954a5dd4ad76012d85"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "54578adf53dbd5ff25bc97f12e34f723aa5d22b9d499d240b2e5e2b41fafe6f4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_leveldb.xcframework.zip",
      checksum: "4ada925f7898080597f4c4ecce47fe9a61a1872ab6f3232790c959fed8703639"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_nanopb.xcframework.zip",
      checksum: "d1a401842776a0bdf9e6a7ecbffebc6d7dc5648d22924f85650c20877f9de668"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_openssl_grpc.xcframework.zip",
      checksum: "4e57782b9a78e55b1fe2be29950a3e23f117d38043ed4401d953085aab61d74a"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_Promises.xcframework.zip",
      checksum: "53e128461d8b62503016abf120afa71faf13e04d82730dd036c0d2d325247bd0"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_RecaptchaInterop.xcframework.zip",
      checksum: "2444aacb2f59d900b7f69c5e8db9d6b10eb0dbcd83fd8def17c636e450b5d739"
    )
  ]
)
    
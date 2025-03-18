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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_AppAuth.xcframework.zip",
      checksum: "fc882baa8d42aa3dbdffdd6f84957615a3bde3158cca9ee0fa8a3bb15d0b8c9f"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_AppCheckCore.xcframework.zip",
      checksum: "7865ebaa6d1780af64c77ee14b50ad32fa4fa0ca0a31d1cce1f8efe5f8ce7308"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FBLPromises.xcframework.zip",
      checksum: "1647de037254b0d127944230c3dfe2a8fc90f3053657b8a5b4f8b28843dd309a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseABTesting.xcframework.zip",
      checksum: "277f35c89a2393c1d100e83de9e5f089e49817b09150eae52171f972d3e12776"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "54189b8708b1da922b4b5c3149b0ee1645b5cdf22878a9389dfdccab9a408d37"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "5049d97d1c6bd1fc6e8835c3d7d146ceba93c52530fa5f118149ff7a6ea50d6e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "455576ffb6a326b7d88312b3387d232a0e855ef335f9a8e236ad658f4dbfb039"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2d7b53132819ec0c5107bd4d16b9de8975a4441278ba8d4cc18c824630f20999"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "8850589648ed7ec9ffb6401a7967482f193b7376ae83b87158d623c78640cfc7"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAuth.xcframework.zip",
      checksum: "96544212406e8f36ea0568b875439f367db21d6f1da22306e70e4118fed7afeb"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "f01aa9ee237b816cb1c264271a078d7c030b543f99ee73953470e613963f4ed3"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCore.xcframework.zip",
      checksum: "53b682ccfa2cef03e3d5fe78559c7de045efbc2aec74793d6b42eae8c270f0ea"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "1de5c6dbf333e5f586c04ab956b9d99e10b3ca26aac59805c06a2d643844b16c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4dac241576a8970633c893d7863f7e8f443ca117a03d3eb2b020cdd3c69e8028"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "a9e830bb6e42282b7a459018177b403177b3076517c679e007330a167de6a29f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseDatabase.xcframework.zip",
      checksum: "86120e5d0ff8d9b4331723b83ae07baadca09549327417590e21c45a553fd5b8"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "f1bbda0d3302fd575e3d6d106d7cb00a8d5ad05acfcc6ceff8d06f7a29348597"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFirestore.xcframework.zip",
      checksum: "3853a7e7b61bdc5808b37020780ec713b0dff34207de5b2cdc36e32d42b9bde8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "7e703f63da22396a54145a1e4588a5e2fd169bed8f22dfd13706aa5617514ee6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFunctions.xcframework.zip",
      checksum: "27c216a01d4971e0f53b0ac0d04e0e4fd17a45100f8515da372a664b93c36d64"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "f369469a054da6f87bc2339aa4ce4a357c00406334f9eb64e3b8ab1e2d554f20"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseInstallations.xcframework.zip",
      checksum: "ec1f1c7740738e0cae7208b9fa12dc0611ff75f0d1ea93370770945220ebbed5"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4dbf2ca33489280cb6c69b144f2ab6a02e83004de3f45bbfb79307c87596e95f"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMessaging.xcframework.zip",
      checksum: "1a89b3584755dd0681ad98a165ba2eb76e1a8d72c5f1360805751e46b87e6d10"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e5e1f950fd0b66b5392c122e5e6cfea387d6b5b0353c60aad254a925a87a2202"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebasePerformance.xcframework.zip",
      checksum: "38e0ee0eec489f207cc9e23d905b27ef485cd20a0ca41414afeb4dc046e9e28e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "1a700cc4d6df013a6e4c61335fb8830539a8c158949d558331b66814c086c52a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a226b168ad990e096285653d855590696cccb7679c752d1ab5caf18b3347fd2f"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseSessions.xcframework.zip",
      checksum: "af7d81b3f41323019d5aa212613f66441ade407f9d2eed6a9cf8ba6a2138af2c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d36d54f5b06222d8fd907402cb3cac1a11a331c155715fc0693036722ae71e2e"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseStorage.xcframework.zip",
      checksum: "7b6a79904365e615bb26b33e31fc805d163b82d30fa77902067c3537bf8d2a55"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "0ed1fab6a5db265a733f1a342eb31d00ccfe30588991b8531910035ae89b7c7e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GTMAppAuth.xcframework.zip",
      checksum: "89fa7af0a3da3720e28c12d17f3b04af002af7c516b0e5d2f4365a615744feed"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "9fcb9398b6ffe2110ecc568aad622e676233e56cebe6817a173d3ad1c35559cd"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "6d7de859522407a5913692410b4643364e4b571a5b1137dc0c8c349626b1723e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b3a0d0b8694ff988d775536149cddccb9909b53052f4a0ce2f9721f74af40ee5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b91fc5963d1f90bf9ead2fa31e0875394124cc62e50ca0ed858c2909163a8189"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleDataTransport.xcframework.zip",
      checksum: "a30e5910a45492e28b03844ab15017f943fb0c1cfb6bc0b1f38ec1f1ffacfe26"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4a73a56c7b318dfec5f2585a14dd58bf53855c71c05ae74f583efa289a807934"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleSignIn.xcframework.zip",
      checksum: "d2fc8bc023e0b13308ee02ee44849acf9305893ac2ad805a7e5198b0dbe4f8b3"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleUtilities.xcframework.zip",
      checksum: "a0d986d019c1786fb44946329686808e4f457bae84d8343c0277ecfe9dec9735"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_Promises.xcframework.zip",
      checksum: "ed147a827a933becd44e9a975368d266a2c1f5fb8f00d0e5db67a5df1bb7d919"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_RecaptchaInterop.xcframework.zip",
      checksum: "b7d58328dcf152b71a747a46e9e3dd290eb412cfffa4c533b005e5bc23965f44"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_SwiftProtobuf.xcframework.zip",
      checksum: "55cd991660ddc9cb617ae69196a9774e1204c057dc7eb666440990a2ed22ea01"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "8860712fd8800ff7de27bdae8179b78078431624ee5494f05102979bfbc70d96"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_absl.xcframework.zip",
      checksum: "c7107a82914d87564b54644bfc1bff0278919c60dcd3416dcd293d7f728f9fe7"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_grpc.xcframework.zip",
      checksum: "9af4e9282cc2cf0484213c9c157082c253f15ae1222c8086238b13d5e9369dc9"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_grpcpp.xcframework.zip",
      checksum: "68d95ff355c07e485422a6b6188493ba8a2612f6d0ffe64a42cbe2012f9e54ce"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_leveldb.xcframework.zip",
      checksum: "53ad1d2ff0c5810900434776b0f041bc464bc630cf1eaad00fb1e017d0fabc67"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_nanopb.xcframework.zip",
      checksum: "8f55afe2f19297cbef804224e783cf00025835164671dfe9b673965826ba8064"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_openssl_grpc.xcframework.zip",
      checksum: "71c95fd0de922b6b849b6e465b32cb1295e8f3e26e1e5d92ed8ac474458751cb"
    )
  ]
)
    
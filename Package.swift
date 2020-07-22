// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "DeepBeeTracking",
  products: [
    .executable(name: "TrainUNet", targets: ["TrainUNet"])
  ],
  dependencies: [
    .package(url: "https://github.com/tensorflow/swift-models.git", .branch("marcrasi-patch-1")),
  ],
  targets: [
    .target(
      name: "DeepBeeTrackingDatasets",
      dependencies: [
        .product(name: "Datasets", package: "swift-models"),
        .product(name: "ModelSupport", package: "swift-models"),
      ]),
    .target(
      name: "DeepBeeTrackingModels",
      dependencies: [
        .product(name: "Checkpoints", package: "swift-models"),
      ]),
    //.target(
    //  name: "DeepBeeTracking",
    //  dependencies: []),
    .target(
      name: "TrainUNet",
      dependencies: [
        "DeepBeeTrackingDatasets",
        "DeepBeeTrackingModels",
        .product(name: "ModelSupport", package: "swift-models"),
      ]),
  ]
)

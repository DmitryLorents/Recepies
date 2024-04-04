// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal enum AuthImages {
      internal static let email = ImageAsset(name: "email")
      internal static let eyeClose = ImageAsset(name: "eyeClose")
      internal static let eyeOpen = ImageAsset(name: "eyeOpen")
      internal static let lock = ImageAsset(name: "lock")
    }
    internal enum CategoryImages {
      internal enum MockImages {
        internal static let dish2 = ImageAsset(name: "dish2")
        internal static let dish3 = ImageAsset(name: "dish3")
        internal static let dish4 = ImageAsset(name: "dish4")
        internal static let dish5 = ImageAsset(name: "dish5")
        internal static let dish6 = ImageAsset(name: "dish6")
      }
      internal static let arrowLeft = ImageAsset(name: "arrowLeft")
      internal static let chevronRight = ImageAsset(name: "chevronRight")
      internal static let dish1 = ImageAsset(name: "dish1")
      internal static let down = ImageAsset(name: "down")
      internal static let pizza = ImageAsset(name: "pizza")
      internal static let timer = ImageAsset(name: "timer")
      internal static let upBlack = ImageAsset(name: "upBlack")
      internal static let upWhite = ImageAsset(name: "upWhite")
    }
    internal enum Colors {
      internal static let backIcon = ColorAsset(name: "backIcon")
      internal static let cellBackground = ColorAsset(name: "cellBackground")
      internal static let currentBlue = ColorAsset(name: "currentBlue")
      internal static let darkGrayApp = ColorAsset(name: "darkGrayApp")
      internal static let gradientBackground = ColorAsset(name: "gradientBackground")
      internal static let grayAlfa = ColorAsset(name: "grayAlfa")
      internal static let redWarning = ColorAsset(name: "redWarning")
      internal static let searchBackground = ColorAsset(name: "searchBackground")
    }
    internal enum DetailImage {
      internal static let favorites = ImageAsset(name: "favorites")
      internal static let favoritesHig = ImageAsset(name: "favoritesHig")
      internal static let fish1 = ImageAsset(name: "fish1")
      internal static let lightning = ImageAsset(name: "lightning")
      internal static let pot = ImageAsset(name: "pot")
      internal static let refresh = ImageAsset(name: "refresh")
      internal static let search = ImageAsset(name: "search")
      internal static let send = ImageAsset(name: "send")
      internal static let timerCook = ImageAsset(name: "timerCook")
    }
    internal enum FavoriteImages {
      internal static let favoriteSmall = ImageAsset(name: "favoriteSmall")
    }
    internal enum ProfileImages {
      internal static let avatar = ImageAsset(name: "avatar")
      internal static let box = ImageAsset(name: "box")
      internal static let ipensela = ImageAsset(name: "ipensela")
      internal static let logoutF = ImageAsset(name: "logoutF")
      internal static let partners = ImageAsset(name: "partners")
      internal static let star = ImageAsset(name: "star")
      internal static let starYellow = ImageAsset(name: "starYellow")
      internal static let termsF = ImageAsset(name: "termsF")
    }
    internal enum RecipeImages {
      internal static let chicken = ImageAsset(name: "chicken")
      internal static let desserts = ImageAsset(name: "desserts")
      internal static let drinks = ImageAsset(name: "drinks")
      internal static let fish = ImageAsset(name: "fish")
      internal static let meat = ImageAsset(name: "meat")
      internal static let pancake = ImageAsset(name: "pancake")
      internal static let salad = ImageAsset(name: "salad")
      internal static let sideDish = ImageAsset(name: "side Dish")
      internal static let soup = ImageAsset(name: "soup")
    }
    internal enum TabBar {
      internal static let favorSet = ImageAsset(name: "favorSet")
      internal static let favorites = ImageAsset(name: "favorites")
      internal static let prof = ImageAsset(name: "prof")
      internal static let profileSet = ImageAsset(name: "profileSet")
      internal static let recipes = ImageAsset(name: "recipes")
      internal static let recipesSet = ImageAsset(name: "recipesSet")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type

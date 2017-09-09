// Generated by Apple Swift version 3.1 (swiftlang-802.0.53 clang-802.0.42)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if defined(__has_attribute) && __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSCoder;

SWIFT_CLASS("_TtC13SwiftMessages8BaseView")
@interface BaseView : UIView
/// Fulfills the <code>BackgroundViewable</code> protocol and is the target for
/// the optional <code>tapHandler</code> block. Defaults to <code>self</code>.
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified backgroundView;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (void)awakeFromNib;
/// A convenience function for installing a content view as a subview of <code>backgroundView</code>
/// and pinning the edges to <code>backgroundView</code> with the specified <code>insets</code>.
/// \param contentView The view to be installed into the background view
/// and assigned to the <code>contentView</code> property.
///
/// \param insets The amount to inset the content view from the background view.
/// Default is zero inset.
///
- (void)installContentView:(UIView * _Nonnull)contentView insets:(UIEdgeInsets)insets;
/// An optional tap handler that will be called when the <code>backgroundView</code> is tapped.
@property (nonatomic, copy) void (^ _Nullable tapHandler)(BaseView * _Nonnull);
@property (nonatomic) CGFloat bounceAnimationOffset;
@property (nonatomic) CGFloat statusBarOffset;
@property (nonatomic, readonly) CGSize intrinsicContentSize;
@end


@interface BaseView (SWIFT_EXTENSION(SwiftMessages))
/// A convenience function to configure a default drop shadow effect.
- (void)configureDropShadow;
- (void)layoutSubviews;
@end


@interface NSBundle (SWIFT_EXTENSION(SwiftMessages))
@end


SWIFT_CLASS("_TtC13SwiftMessages15CenterAnimation")
@interface CenterAnimation : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class UIButton;
@class UIEvent;
@class UILabel;
@class UIImageView;

SWIFT_CLASS("_TtC13SwiftMessages11MessageView")
@interface MessageView : BaseView
/// An optional button tap handler. The <code>button</code> is automatically
/// configured to call this tap handler on <code>.TouchUpInside</code>.
@property (nonatomic, copy) void (^ _Nullable buttonTapHandler)(UIButton * _Nonnull);
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
/// An optional title label.
@property (nonatomic, strong) IBOutlet UILabel * _Nullable titleLabel;
/// An optional body text label.
@property (nonatomic, strong) IBOutlet UILabel * _Nullable bodyLabel;
/// An optional icon image view.
@property (nonatomic, strong) IBOutlet UIImageView * _Nullable iconImageView;
/// An optional icon label (e.g. for emoji character, icon font, etc.).
@property (nonatomic, strong) IBOutlet UILabel * _Nullable iconLabel;
/// An optional button. This buttons’ <code>.TouchUpInside</code> event will automatically
/// invoke the optional <code>buttonTapHandler</code>, but its fine to add other target
/// action handlers can be added.
@property (nonatomic, strong) IBOutlet UIButton * _Nullable button;
@property (nonatomic, copy) NSString * _Nonnull id;
@property (nonatomic, readonly, copy) NSString * _Nullable accessibilityMessage;
@property (nonatomic, readonly, strong) NSObject * _Nullable accessibilityElement;
@property (nonatomic, readonly, copy) NSArray<NSObject *> * _Nullable additonalAccessibilityElements;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
@end


@interface MessageView (SWIFT_EXTENSION(SwiftMessages))
@end


@interface MessageView (SWIFT_EXTENSION(SwiftMessages))
/// A shortcut for configuring the left and right layout margins. For views that
/// have <code>backgroundView</code> as a subview of <code>MessageView</code>, the background view should
/// be pinned to the left and right <code>layoutMargins</code> in order for this configuration to work.
- (void)configureBackgroundViewWithSideMargin:(CGFloat)sideMargin;
/// A shortcut for adding a width constraint to the <code>backgroundView</code>. When calling this
/// method, it is important to ensure that the width constraint doesn’t conflict with
/// other constraints. The CardView.nib and TabView.nib layouts are compatible with
/// this method.
- (void)configureBackgroundViewWithWidth:(CGFloat)width;
@end

@class UIColor;
@class UIImage;

@interface MessageView (SWIFT_EXTENSION(SwiftMessages))
/// A convenience function for setting a foreground and background color.
/// Note that images will only display the foreground color if they’re
/// configured with UIImageRenderingMode.AlwaysTemplate.
/// \param backgroundColor The background color to use.
///
/// \param foregroundColor The foreground color to use.
///
- (void)configureThemeWithBackgroundColor:(UIColor * _Nonnull)backgroundColor foregroundColor:(UIColor * _Nonnull)foregroundColor iconImage:(UIImage * _Nullable)iconImage iconText:(NSString * _Nullable)iconText;
@end


@interface MessageView (SWIFT_EXTENSION(SwiftMessages))
@end


@interface MessageView (SWIFT_EXTENSION(SwiftMessages))
/// Sets the message body text.
/// \param body The message body text to use.
///
- (void)configureContentWithBody:(NSString * _Nonnull)body;
/// Sets the message title and body text.
/// \param title The message title to use.
///
/// \param body The message body text to use.
///
- (void)configureContentWithTitle:(NSString * _Nonnull)title body:(NSString * _Nonnull)body;
/// Sets the message title, body text and icon image. Also hides the
/// <code>iconLabel</code>.
/// \param title The message title to use.
///
/// \param body The message body text to use.
///
/// \param iconImage The icon image to use.
///
- (void)configureContentWithTitle:(NSString * _Nonnull)title body:(NSString * _Nonnull)body iconImage:(UIImage * _Nonnull)iconImage;
/// Sets the message title, body text and icon text (e.g. an emoji).
/// Also hides the <code>iconImageView</code>.
/// \param title The message title to use.
///
/// \param body The message body text to use.
///
/// \param iconText The icon text to use (e.g. an emoji).
///
- (void)configureContentWithTitle:(NSString * _Nonnull)title body:(NSString * _Nonnull)body iconText:(NSString * _Nonnull)iconText;
/// Sets all configurable elements.
/// \param title The message title to use.
///
/// \param body The message body text to use.
///
/// \param iconImage The icon image to use.
///
/// \param iconText The icon text to use (e.g. an emoji).
///
/// \param buttonImage The button image to use.
///
/// \param buttonTitle The button title to use.
///
/// \param buttonTapHandler The button tap handler block to use.
///
- (void)configureContentWithTitle:(NSString * _Nullable)title body:(NSString * _Nullable)body iconImage:(UIImage * _Nullable)iconImage iconText:(NSString * _Nullable)iconText buttonImage:(UIImage * _Nullable)buttonImage buttonTitle:(NSString * _Nullable)buttonTitle buttonTapHandler:(void (^ _Nullable)(UIButton * _Nonnull))buttonTapHandler;
@end


SWIFT_CLASS("_TtC13SwiftMessages18TopBottomAnimation")
@interface TopBottomAnimation : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface UIView (SWIFT_EXTENSION(SwiftMessages))
@end


@interface UIViewController (SWIFT_EXTENSION(SwiftMessages))
@end

#pragma clang diagnostic pop

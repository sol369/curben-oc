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
@import ObjectiveC;
@import UIKit;
@import Foundation;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"

SWIFT_CLASS("_TtC6curben10ApiManager")
@interface ApiManager : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class MMDrawerController;
@class UIApplication;

SWIFT_CLASS("_TtC6curben11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
@property (nonatomic, strong) MMDrawerController * _Nonnull centerContainer;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions SWIFT_WARN_UNUSED_RESULT;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIScrollView;
@class UITableView;
@class UIView;
@class UILabel;
@class UIPageControl;
@class UIBarButtonItem;
@class UIButton;
@class UITableViewCell;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC6curben18CartViewController")
@interface CartViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UIScrollView * _Null_unspecified scrollView;
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified tablePickup;
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified pickupFooterView;
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified viewForScrollView;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified appFeeLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified subTotalLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified dueNowLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified cashAtPickupLabel;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull dataArray0;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull dataArray1;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull scrollLabels;
@property (nonatomic, strong) UIScrollView * _Nonnull scrollViewWithIndicator;
@property (nonatomic, strong) UIPageControl * _Nonnull pageControl;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)menuBtn:(UIBarButtonItem * _Nonnull)sender;
- (void)setupFrames;
- (void)setupCustomScrollView;
- (void)configurePageControl;
- (void)changePageWithSender:(id _Nonnull)sender;
- (void)scrollViewDidEndDecelerating:(UIScrollView * _Nonnull)scrollView;
- (IBAction)confirmOrderButton:(id _Nonnull)sender;
- (IBAction)minusBtn:(UIButton * _Nonnull)sender;
- (IBAction)plusBtn:(UIButton * _Nonnull)sender;
- (void)firstButtonWithSender:(id _Nonnull)sender;
- (void)secondButtonWithSender:(id _Nonnull)sender;
- (void)thirdButtonWithSender:(id _Nonnull)sender;
- (void)fourthButtonWithSender:(id _Nonnull)sender;
- (void)fifthButtonWithSender:(id _Nonnull)sender;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSDictionary;
@class NSArray;
@class NSURLResponse;
@class UIImage;

SWIFT_CLASS("_TtC6curben6Helper")
@interface Helper : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) Helper * _Nonnull sharedInstance;)
+ (Helper * _Nonnull)sharedInstance SWIFT_WARN_UNUSED_RESULT;
- (NSDictionary * _Nullable)getArray SWIFT_WARN_UNUSED_RESULT;
- (NSArray * _Nullable)getCountryArray SWIFT_WARN_UNUSED_RESULT;
- (NSArray * _Nullable)getlatlongArray SWIFT_WARN_UNUSED_RESULT;
- (void)getJsonWithUrlStr:(NSString * _Nonnull)urlStr param:(NSString * _Nonnull)param method:(NSString * _Nonnull)method onCompletion:(void (^ _Nonnull)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))onCompletion;
- (void)makeMultipartCallWithUrlStr:(NSString * _Nonnull)urlStr param:(NSDictionary<NSString *, NSString *> * _Nonnull)param image:(UIImage * _Nullable)image imageNameParam:(NSString * _Nonnull)imageNameParam onCompletion:(void (^ _Nonnull)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))onCompletion;
- (NSData * _Nonnull)createBodyWithParametersWithParameters:(NSDictionary<NSString *, NSString *> * _Nullable)parameters imageName:(NSString * _Nonnull)imageName filePathKey:(NSString * _Nullable)filePathKey imageDataKey:(UIImage * _Nullable)imageDataKey boundary:(NSString * _Nonnull)boundary SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)generateBoundaryString SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6curben17HomeTableViewCell")
@interface HomeTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified titleLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified distanceLabel;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified cartButton;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified priceLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UISearchBar;

SWIFT_CLASS("_TtC6curben18HomeViewController")
@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified table;
@property (nonatomic, strong) IBOutlet UISearchBar * _Null_unspecified searchbar;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)dismissKeyboard;
- (IBAction)menuBtn:(UIBarButtonItem * _Nonnull)sender;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class SkyFloatingLabelTextField;

SWIFT_CLASS("_TtC6curben19LoginViewController")
@interface LoginViewController : UIViewController
@property (nonatomic, strong) MMDrawerController * _Nonnull centerContainer;
@property (nonatomic, strong) IBOutlet SkyFloatingLabelTextField * _Null_unspecified emailTextField;
@property (nonatomic, strong) IBOutlet SkyFloatingLabelTextField * _Null_unspecified passwordTextField;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)loginBtn:(UIButton * _Nonnull)sender;
- (IBAction)signUpBtn:(UIButton * _Nonnull)sender;
- (void)home;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface NSMutableData (SWIFT_EXTENSION(curben))
- (void)appendString:(NSString * _Nonnull)string;
@end


SWIFT_CLASS("_TtC6curben24OrdersHederTableViewCell")
@interface OrdersHederTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified dateLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6curben15OrdersModelCell")
@interface OrdersModelCell : NSObject
@property (nonatomic) NSInteger numberOfRows;
@property (nonatomic) NSInteger numberOfSection;
@property (nonatomic, copy) NSString * _Nonnull Time;
@property (nonatomic, copy) NSString * _Nonnull numberOfItems;
@property (nonatomic, copy) NSString * _Nonnull orderCode;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class NSLayoutConstraint;

SWIFT_CLASS("_TtC6curben19OrdersTableViewCell")
@interface OrdersTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified dotLine;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * _Null_unspecified dotLineTopCons;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * _Null_unspecified dotLineBottomCons;
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified dot;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified timeLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified itemCountLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified itemLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6curben20OrdersViewController")
@interface OrdersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified table;
@property (nonatomic) NSInteger numberOfRows;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)menuBtn:(UIBarButtonItem * _Nonnull)sender;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (UIView * _Nullable)tableView:(UITableView * _Nonnull)tableView viewForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6curben15PickupModelCell")
@interface PickupModelCell : NSObject
@property (nonatomic, copy) NSString * _Nonnull itemImage;
@property (nonatomic, copy) NSString * _Nonnull itemName;
@property (nonatomic, copy) NSString * _Nonnull itemSize;
@property (nonatomic, copy) NSString * _Nonnull itemPrize;
@property (nonatomic, copy) NSString * _Nonnull itemQuantity;
- (nonnull instancetype)initWithData:(NSArray<NSString *> * _Nonnull)Data OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class UIImageView;

SWIFT_CLASS("_TtC6curben19PickupTableViewCell")
@interface PickupTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified itemImage;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified itemName;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified itemPrice;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified itemSize;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified itemQuantity;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified minusLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified plusLabel;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified minusBtnOut;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified plusBtnOut;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIColor;

SWIFT_CLASS("_TtC6curben21ProfileViewController")
@interface ProfileViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) MMDrawerController * _Nonnull centerContainer;
@property (nonatomic, strong) UIColor * _Nonnull grayColor;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified generalLabel;
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified generalView;
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified paymentView;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified paymentLabel;
@property (nonatomic, strong) IBOutlet UIScrollView * _Null_unspecified scrollView;
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified generalLine;
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified paymentLine;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified editButtonLabel;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified lockImage;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified doneButton;
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified doneButtonView;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified lock1;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified lock2;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified lock3;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified lock4;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified lock5;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified editButtonPaymentLabel;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (IBAction)editButtonPressed:(id _Nonnull)sender;
- (IBAction)editButtonPaymentPressed:(id _Nonnull)sender;
- (IBAction)homeBtn:(UIBarButtonItem * _Nonnull)sender;
- (IBAction)generalBtn:(UIButton * _Nonnull)sender;
- (IBAction)paymentBtn:(UIButton * _Nonnull)sender;
- (void)scrollRight;
- (void)scrollLeft;
- (void)scrollViewDidScroll:(UIScrollView * _Nonnull)scrollView;
- (void)hideLocks;
- (void)showLocks;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6curben22SideMenuViewController")
@interface SideMenuViewController : UIViewController
@property (nonatomic, strong) MMDrawerController * _Nonnull centerContainer;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (IBAction)menuCloseBtn:(UIButton * _Nonnull)sender;
- (IBAction)profileBtn:(UIButton * _Nonnull)sender;
- (void)controlWithParameter:(NSString * _Nonnull)parameter;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6curben20SignUpViewController")
@interface SignUpViewController : UIViewController
@property (nonatomic, strong) MMDrawerController * _Nonnull centerContainer;
@property (nonatomic, strong) IBOutlet SkyFloatingLabelTextField * _Null_unspecified emailTextField;
@property (nonatomic, strong) IBOutlet SkyFloatingLabelTextField * _Null_unspecified passwordTextField;
@property (nonatomic, strong) IBOutlet SkyFloatingLabelTextField * _Null_unspecified confirmPasswordTextField;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)signUpBtn:(UIButton * _Nonnull)sender;
- (IBAction)loginBtn:(UIButton * _Nonnull)sender;
- (IBAction)backBtn:(UIButton * _Nonnull)sender;
- (void)home;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface UIColor (SWIFT_EXTENSION(curben))
- (nonnull instancetype)initWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
- (nonnull instancetype)initWithNetHex:(NSInteger)netHex;
@end


@interface UIView (SWIFT_EXTENSION(curben))
- (void)startProgresshud;
- (void)stopProgressHud;
- (void)fadeOut:(NSTimeInterval)duration;
- (void)fadeIn:(NSTimeInterval)duration;
- (NSString * _Nonnull)base64ConvWithStr:(NSString * _Nonnull)str SWIFT_WARN_UNUSED_RESULT;
- (void)addShadowsWithView:(UIView * _Nonnull)view;
@end


@interface UIViewController (SWIFT_EXTENSION(curben))
- (void)showalertview:(NSString * _Nonnull)messagestring;
- (void)showalertview:(NSString * _Nonnull)messagestring Buttonmessage:(NSString * _Nonnull)Buttonmessage handler:(void (^ _Nonnull)(void))handler;
@end


SWIFT_CLASS("_TtC6curben14ViewController")
@interface ViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop

#import "HandsOnFlutterPlugin.h"
#if __has_include(<hands_on_flutter_plugin/hands_on_flutter_plugin-Swift.h>)
#import <hands_on_flutter_plugin/hands_on_flutter_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "hands_on_flutter_plugin-Swift.h"
#endif

@implementation HandsOnFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHandsOnFlutterPlugin registerWithRegistrar:registrar];
}
@end

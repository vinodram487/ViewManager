#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(NativeManagerSample, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

@end

@interface RCT_EXTERN_MODULE(NativeNumberGeneratorViewManager, RCTViewManager)
//RCT_EXTERN_METHOD(
//                  multiply:(float)a withB:(float)b
//                  resolver:(RCTPromiseResolveBlock)resolve
//                  rejecter:(RCTPromiseRejectBlock)reject
//                  )
//RCT_EXTERN_METHOD(getRandomNumberAction)
RCT_EXPORT_VIEW_PROPERTY(initialNumber, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(onNumberSend, RCTDirectEventBlock)
@end

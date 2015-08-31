//
//  FHSamlRequest.m
//  saml-ios-app
//
//  Copyright (c) 2012-2015 FeedHenry. All rights reserved.
//


#import "FH.h"
#import "FHSamlRequest.h"
#import "FHSAMLViewController.h"


static NSString *const kAuthPath = @"sso/session/login_host";

@implementation FHSamlRequest

- (instancetype)initWithViewController:(UIViewController *)viewController {
    self = [super init];

    if (self) {
        self.parentViewController = viewController;
    }
    return self;
}



- (void)exec:(BOOL)pAsync
 WithSuccess:(void (^)(FHResponse *success))sucornil
  AndFailure:(void (^)(FHResponse *failed))failornil {
    
    _async = pAsync;
    

    void (^complete)(FHResponse *) = ^(FHResponse *resp) {
        if (sucornil) {
            sucornil(resp);
        } else {
            SEL sucSel = @selector(requestDidSucceedWithResponse:);
            if (self.delegate && [self.delegate respondsToSelector:sucSel]) {
                [(FHAct *)self.delegate performSelectorOnMainThread:sucSel
                                                         withObject:resp
                                                      waitUntilDone:YES];
            }
        }
    };
    
    
    NSString* deviceID = [[FHConfig getSharedInstance] uuid];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"token"] = deviceID;
    FHCloudRequest *cloudReq = [FH buildCloudRequest:kAuthPath WithMethod:@"POST" AndHeaders:nil AndArgs: params];

    [cloudReq execWithSuccess:^(FHResponse *success) {
        NSLog(@"EXEC SUCCESS resposne=%@", success);
        NSDictionary* response = [success parsedResponse];
        NSString* urlString = response[@"sso"];
        NSURL* loginUrl = [[NSURL alloc] initWithString:urlString];
        FHSAMLViewController *controller = [[FHSAMLViewController alloc] initWith:loginUrl completeHandler:complete];
            [self.parentViewController presentViewController:controller animated:YES completion:nil];
    } AndFailure:^(FHResponse *failed) {
        NSLog(@"EXEC FAILUE resposne=%@", failed);
    }];

}

@end


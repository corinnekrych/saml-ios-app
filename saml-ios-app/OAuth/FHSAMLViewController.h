//
//  FHOAuthViewController.h
//  fh-ios-sdk
//
//  Copyright (c) 2012-2015 FeedHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FHResponse.h"
#import "FHJSON.h"

/**
 Present a customized UIWebView to perform OAuth authentication.
 */
@interface FHSAMLViewController : UIViewController <UIWebViewDelegate>

- initWithURL:(NSURL*)url;

@end

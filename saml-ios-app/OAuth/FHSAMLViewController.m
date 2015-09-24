//
//  FHOAuthViewController.m
//  fh-ios-sdk
//
//  Copyright (c) 2012-2015 FeedHenry. All rights reserved.
//

#import "FHSAMLViewController.h"

@implementation FHSAMLViewController {
    UIWebView *_webView;
    NSURL* _url;
}

- initWithURL:(NSURL*)url {
    self = [super init];
    _url = url;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.delegate = self;
    [_webView loadRequest: [[NSURLRequest alloc] initWithURL: _url]];
}

- (void)loadView {
    UIWindow *appWindow = [[[UIApplication sharedApplication] delegate] window];
    // create the titlebar
    float titleBarHeight = 45;
    float appHeight = appWindow.frame.size.height;
    float appWidth = appWindow.frame.size.width;
     UIView* topView =
    [[UIView alloc] initWithFrame:CGRectMake(0, 0, appWidth, appHeight)];
    topView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UINavigationBar* titleBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, appWidth, titleBarHeight)];
    titleBar.barStyle = UIBarStyleBlack;
    titleBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, titleBarHeight, appWidth, appHeight - titleBar.frame.size.height)];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.scalesPageToFit = YES;
    
    [topView addSubview:titleBar];
    [topView addSubview:_webView];
    
    UINavigationItem *titleBarItem =
    [[UINavigationItem alloc] initWithTitle:@"Login"];
    // create the close button
    UIBarButtonItem *done =
    [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                     style:UIBarButtonItemStyleDone
                                    target:self
                                    action:@selector(closeView)];
    [titleBarItem setLeftBarButtonItem:done];
    
    [titleBar pushNavigationItem:titleBarItem animated:NO];
    
    self.view = topView;
}

- (void)closeView {
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
    NSNotification *notification = [NSNotification notificationWithName:@"WebViewClosed" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}


@end

//
//  FHSamlRequest.h
//  saml-ios-app
//
//  Copyright (c) 2012-2015 FeedHenry. All rights reserved.
//

#import "FHAct.h"


@interface FHSamlRequest : FHAct


@property (nonatomic, strong) UIViewController *parentViewController;


- (instancetype)initWithViewController:(UIViewController *)viewController;

@end

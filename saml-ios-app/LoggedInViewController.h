//
//  LoggedInViewController.h
//  saml-ios-app
//
//  Created by Corinne Krych on 02/09/15.
//  Copyright (c) 2015 FeedHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoggedInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *session;

@property(strong, nonatomic) NSString* nameModel;
@property(strong, nonatomic) NSString* emailModel;
@property(strong, nonatomic) NSString* sessionModel;
@end

//
//  LoggedInViewController.m
//  saml-ios-app
//
//  Created by Corinne Krych on 02/09/15.
//  Copyright (c) 2015 FeedHenry. All rights reserved.
//

#import "LoggedInViewController.h"

#import "FHSAMLViewController.h"


@implementation LoggedInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = self.nameModel;
    self.email.text = self.emailModel;
    self.session.text = self.sessionModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewWillAppear:(BOOL)animated {
    [self reloadInputViews];
}

@end

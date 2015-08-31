//
//  ViewController.m
//  saml-ios-app
//
//  Created by Corinne Krych on 31/08/15.
//  Copyright (c) 2015 FeedHenry. All rights reserved.
//

#import "ViewController.h"
#import "FH.h"
#import "FHSAMLViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(close) name:@"WebViewClosed" object:nil];

}

- (void) close {
    // Get the User name claims
    NSString* deviceID = [[FHConfig getSharedInstance] uuid];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"token"] = deviceID;
    FHCloudRequest *cloudReq = [FH buildCloudRequest:@"sso/session/valid" WithMethod:@"POST" AndHeaders:nil AndArgs: params];
    
    // Initiate the SSO call to the cloud
    [cloudReq execWithSuccess:^(FHResponse *success) {
        NSDictionary* response = [success parsedResponse];
        NSString* name = response[@"first_name"];
        NSLog(@"Request name = %@", name);

    } AndFailure:^(FHResponse *failed) {
        NSLog(@"Request name failure =%@", failed);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(UIButton *)sender {
    
    [FH initWithSuccess:^(FHResponse *response) {
        NSLog(@"initialized OK");
        NSLog(@"Login to SAML Service...");
        
        // Build a FHCloudRequest to get the SSO login URL
        NSString* deviceID = [[FHConfig getSharedInstance] uuid];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"token"] = deviceID;
        FHCloudRequest *cloudReq = [FH buildCloudRequest:@"sso/session/login_host" WithMethod:@"POST" AndHeaders:nil AndArgs: params];
        
        // Initiate the SSO call to the cloud
        [cloudReq execWithSuccess:^(FHResponse *success) {
            NSLog(@"EXEC SUCCESS =%@", success);
            NSDictionary* response = [success parsedResponse];
            NSString* urlString = response[@"sso"];
            NSURL* loginUrl = [[NSURL alloc] initWithString:urlString];
            // Display WebView
            FHSAMLViewController *controller = [[FHSAMLViewController alloc] initWithURL:loginUrl];
            [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:controller animated:YES completion:nil];
        } AndFailure:^(FHResponse *failed) {
            NSLog(@"EXEC FAILUE =%@", failed);
        }];
    } AndFailure:^(FHResponse *response) {
        NSLog(@"initialize fail, %@", response.rawResponseAsString);
    }];

}

@end

//
//  ViewController.m
//  saml-ios-app
//
//  Created by Corinne Krych on 31/08/15.
//  Copyright (c) 2015 FeedHenry. All rights reserved.
//

#import "ViewController.h"
#import "FHSamlRequest.h"
#import "FH.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(UIButton *)sender {
    
    [FH initWithSuccess:^(FHResponse *response) {
        NSLog(@"initialized OK");
        NSLog(@"Login to SAML Service...");
        
        FHSamlRequest* req = [[FHSamlRequest alloc] initWithViewController:self];
        [req execAsyncWithSuccess:^(FHResponse *success) {
            NSLog(@"Login SUCCESS to SAML Service...");
            
        } AndFailure:^(FHResponse *failed) {
            NSLog(@"Login FAILURE to SAML Service...");
        }];
    } AndFailure:^(FHResponse *response) {
        NSLog(@"initialize fail, %@", response.rawResponseAsString);
    }];
    
    

}

@end

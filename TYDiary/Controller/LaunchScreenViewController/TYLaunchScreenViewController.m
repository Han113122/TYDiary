//
//  RSLaunchScreenViewController.m
//  FITogether
//
//  Created by closure on 3/15/15.
//  Copyright (c) 2015 closure. All rights reserved.
//

#import "TYLaunchScreenViewController.h"
#import "TYViewControllerLoader.h"
#import "TYViewControllerManager.h"

static NSString *__launchScreenKey = @"launchScreen";
static NSString *__noFirstLoginKey = @"noFirstLogin";

@interface TYLaunchScreenViewController ()
@property (strong, nonatomic) TYShareStorage *shareStorage;
@end

@implementation TYLaunchScreenViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {


    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_imageView setImage:_launchImage];
}

- (void)_loadNext2 {
    dispatch_async(dispatch_get_main_queue(), ^{
        _shareStorage = [TYShareStorage shareStorage];
            TYAccount *account = [_shareStorage account];
            if (account) {
                return [TYViewControllerManager loadMainEntry];
            }
        if (![[NSUserDefaults standardUserDefaults] integerForKey:__noFirstLoginKey]) {
            [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:__noFirstLoginKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
             [TYViewControllerManager loadWelcomeViewController];
            return;
        }
        
        [TYViewControllerManager loadResgiterEntry];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadNext2];
}

- (void)dealloc {
    [TYDebugLog debug:@"dealloc !!!"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

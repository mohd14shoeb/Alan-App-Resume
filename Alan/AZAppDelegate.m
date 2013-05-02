//
//  AZAppDelegate.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZAppDelegate.h"

#import "AZRootViewController.h"

@interface AZAppDelegate ()

@property (strong, nonatomic) AZRootViewController *rootViewController;

- (void)configureAppearance;

@end

@implementation AZAppDelegate

#pragma mark - Instance

- (AZRootViewController *)rootViewController
{
    if (_rootViewController)
        return _rootViewController;
    
    _rootViewController = [[AZRootViewController alloc] init];
    
    return _rootViewController;
}

#pragma mark - Private

- (void)configureAppearance
{
    UIImage *navBarBackground = [UIImage imageNamed:@"navigationBarBackground.png"];
    [[UINavigationBar appearance] setBackgroundImage:navBarBackground forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *titleAttributes = @{ UITextAttributeTextColor : [UIColor colorWithRed:0.96f green:0.61f blue:0.60f alpha:1.00f],
                                       UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0.f, 0.f)],
                                       UITextAttributeTextShadowColor : [UIColor clearColor],
                                       UITextAttributeFont : [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.f] };
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttributes];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"navigationBarBackButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 44.f, 0.f, 0.f)];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-400.f, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage
                                                      forState:UIControlStateHighlighted
                                                    barMetrics:UIBarMetricsDefault];
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor colorWithRed:0.94f green:0.25f blue:0.23f alpha:1.00f];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];
    
    [self configureAppearance];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  AZAppsViewController.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZAppsViewController.h"

#import "DAAppsViewController.h"

#import "AZSectionDetailContentApps.h"

@interface AZAppsViewController ()

@property (strong, nonatomic) DAAppsViewController *appsViewController;

@end

@implementation AZAppsViewController

#pragma mark - Instance

- (DAAppsViewController *)appsViewController
{
    if (_appsViewController)
        return _appsViewController;
    
    _appsViewController = [[DAAppsViewController alloc] initWithStyle:UITableViewStylePlain];
    
    return _appsViewController;
}

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.appsViewController loadAppsWithAppIds:((AZSectionDetailContentApps *)self.sectionDetail.detail).appIds completionBlock:nil];
	
    [self addChildViewController:self.appsViewController];
    [self.view addSubview:self.appsViewController.view];
    [self.appsViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

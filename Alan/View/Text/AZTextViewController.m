//
//  AZTextViewController.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZTextViewController.h"

#import "AZSection.h"
#import "AZSectionDetailContentText.h"

#define kTextHorizontalMargin 10.f
#define kTextVerticalMargin 90.f

#define kTextTableViewWidth (320.f - (kTextHorizontalMargin * 2))
#define kTextTableViewHeight (480.f - (kTextVerticalMargin * 2))
#define kTextTableViewXOffset (320.f / 2) - (kTextTableViewWidth / 2)
#define kTextTableViewYOffset (480.f / 2) - (kTextTableViewHeight / 2)

@interface AZTextViewController ()

@property (strong, nonatomic) UITextView *textView;

@end

@implementation AZTextViewController

#pragma mark - Instance

- (UITextView *)textView
{
    if (_textView)
        return _textView;
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(kTextTableViewXOffset, kTextTableViewYOffset, kTextTableViewWidth, kTextTableViewHeight)];
    _textView.textColor = [UIColor colorWithRed:0.96f green:0.61f blue:0.60f alpha:1.00f];
    _textView.backgroundColor = [UIColor colorWithRed:0.94f green:0.25f blue:0.23f alpha:1.00f];
    _textView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.f];
    _textView.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_textView];
    
    return _textView;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.25f blue:0.23f alpha:1.00f];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = ((AZSection *)self.sectionDetail.section).title;
    
    [self.textView setText:((AZSectionDetailContentText *)self.sectionDetail.detail).text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

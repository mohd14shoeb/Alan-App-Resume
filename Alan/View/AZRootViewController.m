//
//  AZRootViewController.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "AZRootViewController.h"

#import "AZDataSource.h"
#import "AZSection.h"

#define kAvatarAnimateKey @"avatar_bounce"

#define kSectionHorizontalMargin 10.f
#define kSectionVerticalMargin 90.f

#define kSectionTableViewWidth (320.f - (kSectionHorizontalMargin * 2))
#define kSectionTableViewHeight (480.f - (kSectionVerticalMargin * 2))
#define kSectionTableViewXOffset (320.f / 2) - (kSectionTableViewWidth / 2)
#define kSectionTableViewYOffset (480.f / 2) - (kSectionTableViewHeight / 2)

@interface AZRootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *sections;

@property (strong, nonatomic) IBOutlet UILabel *centerLabel;
@property (strong, nonatomic) IBOutlet UIButton *avatarButton;
@property (strong, nonatomic) UITableView *sectionTableView;

- (void)bounceView:(UIView *)view;
- (void)hideView:(UIView *)view;

- (void)firstAnimation;
- (void)touchDown;
- (void)touchUpInside;
- (void)touchCancel;

- (void)setup;
- (void)reset;

- (IBAction)avatarTouchDown:(id)sender;
- (IBAction)avatarTouchUp:(id)sender;
- (IBAction)avatarTouchCancel:(id)sender;

@end

@implementation AZRootViewController

#pragma mark - Instance

- (NSArray *)sections
{
    if (_sections)
        return _sections;
    
    _sections = [AZDataSource sections];
    
    return _sections;
}

- (UITableView *)sectionTableView
{
    if (_sectionTableView)
        return _sectionTableView;
    
    _sectionTableView = [[UITableView alloc] initWithFrame:CGRectMake(kSectionTableViewXOffset, kSectionTableViewYOffset, kSectionTableViewWidth, kSectionTableViewHeight) style:UITableViewStylePlain];
    _sectionTableView.backgroundColor = [UIColor clearColor];
    _sectionTableView.separatorColor = [UIColor colorWithRed:0.96f green:0.61f blue:0.60f alpha:1.00f];
    _sectionTableView.delegate = self;
    _sectionTableView.dataSource = self;
    
    [self.view addSubview:_sectionTableView];
    
    return _sectionTableView;
}

#pragma mark - Private

- (void)bounceView:(UIView *)view
{
    [UIView animateWithDuration:0.4 animations:^{ view.alpha = 1.f; }];
    
    view.layer.transform = CATransform3DMakeScale(.5f, .5f, 1.f);
    
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    bounceAnimation.fillMode = kCAFillModeBoth;
    bounceAnimation.removedOnCompletion = YES;
    bounceAnimation.duration = .4f;
    bounceAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(.01f, .01f, .01f)],
                               [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.1f)],
                               [NSValue valueWithCATransform3D:CATransform3DMakeScale(.9f, .9f, .9f)],
                               [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    bounceAnimation.keyTimes = @[@.0f, @.5f, @.75f, @1.f];
    bounceAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [view.layer addAnimation:bounceAnimation forKey:kAvatarAnimateKey];
    
    view.layer.transform = CATransform3DIdentity;
}

- (void)hideView:(UIView *)view
{
    [UIView animateWithDuration:.4f animations:^{ view.alpha = 0.f; }];
}

- (void)firstAnimation
{
    [self bounceView:self.avatarButton];
}

- (void)touchDown
{
    [self bounceView:self.centerLabel];
}

- (void)touchUpInside
{
    [self setup];
}

- (void)touchCancel
{
    [self hideView:self.centerLabel];
}

- (void)setup
{
    // Animate avatar and center label to top margin. Animate table view into view.
    CGRect avatarFrame = self.avatarButton.frame;
    avatarFrame.origin.y = 0.f;
    [UIView animateWithDuration:.4f
                          delay:.0f
                        options:0
                     animations:^{
                         self.avatarButton.frame = avatarFrame;
                         self.avatarButton.transform = CGAffineTransformMakeScale(0.35,0.35);
                         self.sectionTableView.alpha = 1.f;
                     }
                     completion:^(BOOL finished) {
                         self.avatarButton.userInteractionEnabled = NO;
                     }];
    
    [self hideView:self.centerLabel];
}

- (void)reset
{
    
}

#pragma mark - IBAction

- (IBAction)avatarTouchDown:(id)sender
{
    [self touchDown];
}

- (IBAction)avatarTouchUp:(id)sender
{
    [self touchUpInside];
}

- (IBAction)avatarTouchCancel:(id)sender
{
    [self touchCancel];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.avatarButton.alpha = 0.f;
    self.centerLabel.alpha = 0.f;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self firstAnimation];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.avatarButton.alpha = 0.f;
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewControllerDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SectionCellIdentifier"];
    
    AZSection *section = self.sections[indexPath.row];
    
    cell.textLabel.text = section.title;
    
    return cell;
}

@end

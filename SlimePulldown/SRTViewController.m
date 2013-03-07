//
//  SRTViewController.m
//  SlimeRefresh
//
//  Created by zrz on 12-6-15.
//  Copyright (c) 2012年 zrz. All rights reserved.
//

#import "SRTViewController.h"
#import "SRPulldown.h"

@interface SRTViewController ()
<UITableViewDelegate, SRPulldownDelegate>

@end

@implementation SRTViewController {
    SRPulldown   *_slimeView;
    UITableView     *_tableView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CGRect bounds = self.view.bounds;
        _tableView = [[UITableView alloc] initWithFrame:bounds];
        bounds.size.height += 1;
        _tableView.contentSize = bounds.size;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
        
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];

        toolBar.barStyle = UIBarStyleBlackTranslucent;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.text = @"Pull Me Down";
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.shadowColor = [UIColor blackColor];
        titleLabel.shadowOffset = CGSizeMake(0, 1);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:nil action:nil];
        
        toolBar.items = [NSArray arrayWithObjects:space, titleItem, space, nil];
        [self.view addSubview:toolBar];
        
        _slimeView = [[SRPulldown alloc] init];
        _slimeView.delegate = self;
        _slimeView.upInset = 44;
        _slimeView.slimeMissWhenGoingBack = YES;
        _slimeView.slime.bodyColor = [UIColor lightGrayColor];
        _slimeView.slime.skinColor = [UIColor lightGrayColor];
        _slimeView.slime.lineWith = 0;
        _slimeView.slime.shadowBlur = 4;
        _slimeView.slime.shadowColor = [UIColor lightGrayColor];
        
        [_tableView addSubview:_slimeView];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - scrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_slimeView scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_slimeView scrollViewDidEndDraging];
}

#pragma mark - slimeRefresh delegate

- (void)slimePulldownDidPulldown:(SRPulldown *)refreshView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

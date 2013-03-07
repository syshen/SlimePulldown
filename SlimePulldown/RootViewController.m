//
//  RootViewController.m
//  SlimeRefresh
//
//  Created by Shen Steven on 3/3/13.
//  Copyright (c) 2013 zrz. All rights reserved.
//

#import "RootViewController.h"
#import "SRTViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(80, 100, 160, 44);
    [self.button setTitle:@"Click Me" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
  }
  return self;
}

- (void) buttonPressed:(id)sender {
  
  self.modalPresentationStyle = UIModalPresentationFullScreen;
  self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
  
  SRTViewController *vc = [[SRTViewController alloc] init];
  [self presentViewController:vc animated:YES completion:nil];
  
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

@end

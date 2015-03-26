//
//  ResultViewController.m
//  116
//
//  Created by baidu on 14/12/23.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "ResultViewController.h"
#import "DataCenter116.h"
#import <CoreText/CoreText.h>
#import "ResultView.h"
@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UIButton *tryAgainButton;
@property (weak, nonatomic) IBOutlet UITextView  *ResultLabel;
@property (strong, nonatomic) ResultView * resultview;
@end

@implementation ResultViewController

- (void)viewDidLoad {
    
    // Do any additional setup after loading the view.
    Project116 * curproj = [[DataCenter116 GetInstance]GetCurrentProject];
    int itemcount = curproj.items.count;
    int value = arc4random() % itemcount;
    _ResultLabel.text = [[DataCenter116 GetInstance]GetItemNameAt:value atProject:curproj];
    _ResultLabel.textColor = [UIColor blackColor];
    
    
    
        
    self.resultview = [[ResultView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.resultview.backgroundColor = [UIColor whiteColor];
    self.resultview.controller = self;
    [self.resultview setText:curproj.projectName];
    [self.resultview characterAttribute];
    //[self.view addSubview:self.resultview];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [_ResultLabel removeFromSuperview];

}

- (void) realLoad:(UIImage*)rippleimage
{
    self.rippleImage = rippleimage;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

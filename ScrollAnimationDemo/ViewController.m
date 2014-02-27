//
//  ViewController.m
//  ScrollAnimationDemo
//
//  Created by Sunil on 27/02/14.
//  Copyright (c) 2014 Sunil Vaishnav. All rights reserved.
//

#import "ViewController.h"
#import "SKAnimateScroll.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSMutableArray *array=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"], nil];
    
    CGRect rect = CGRectMake(0, 0, 160, 568);
    CGSize size = CGSizeMake(160,  160);
    [SKAnimateScroll createAnimateScrollOfImages:array ofScrollRect:rect ofImageSize:size InView:self.view withDirection:kScrollDirectionTop];
	
	CGRect rect1 = CGRectMake(160, 0, 160, 568);
    CGSize size1 = CGSizeMake(160,  160);
    [SKAnimateScroll createAnimateScrollOfImages:array ofScrollRect:rect1 ofImageSize:size1 InView:self.view withDirection:kScrollDirectionBottom];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
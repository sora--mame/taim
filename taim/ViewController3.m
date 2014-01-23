//
//  ViewController3.m
//  taim
//
//  Created by 吉野　恭平 on 13/12/26.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

@synthesize lb, dp;

- (void)dealloc {
    [lb release];
    [dp release];
    [super dealloc];
}

- (IBAction)DateChanged:(id)sender{
    
    //ラベルに表示する日付・時刻のフォーマットを指定
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"yyyy年MM月dd日 HH時mm分";
    
    //ラベルに指定したフォーマットで表示
    lb.text = [df stringFromDate:dp.date];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

@end

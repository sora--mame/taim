//
//  ViewController2.m
//  taim
//
//  Created by 吉野　恭平 on 13/12/26.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

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

- (IBAction)ura_down:(id)sender{
    ura.enabled = NO;
    NSInteger ami =arc4random() %100;
    if(ami < 8){
        urake.text = @"大吉";
    }
    else if(ami >= 8 && ami<26){
        urake.text = @"中吉";
    }
    else if(ami >= 26 && ami<45){
        urake.text = @"吉";
    }
    else if(ami >= 45 && ami<63){
        urake.text = @"小吉";
    }
    else if(ami >= 63 && ami<81){
        urake.text = @"末吉";
    }
    else if(ami >= 81 && ami<98){
        urake.text = @"凶";
    }
    else if(ami >= 98 && ami<100){
        urake.text =@"大凶";
    }
    
}
@end

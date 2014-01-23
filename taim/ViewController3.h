//
//  ViewController3.h
//  taim
//
//  Created by 吉野　恭平 on 13/12/26.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController3 : ViewController

{
    UILabel *lb;
    UIDatePicker *dp;
}

@property (nonatomic, retain) IBOutlet UILabel *lb;
@property (nonatomic, retain) IBOutlet UIDatePicker *dp;


- (IBAction)DateChanged:(id)sender;


@end

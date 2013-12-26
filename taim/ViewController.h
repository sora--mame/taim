//
//  ViewController.h
//  taim
//
//  Created by 吉野　恭平 on 13/12/12.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    IBOutlet UIButton *start;
    IBOutlet UIButton *stop;
    IBOutlet UIButton *clear;
    NSTimer *timer;
    
    __weak IBOutlet UIButton *gu;
    __weak IBOutlet UIButton *ch;
    __weak IBOutlet UIButton *pa;
    __weak IBOutlet UIButton *again;
    __weak IBOutlet UILabel *ja;
    __weak IBOutlet UILabel *ke;
    __weak IBOutlet UIImageView *tek;

}

-(void)onTimer:(NSTimer*)timer;
- (IBAction)clear_down:(id)sender;
- (IBAction)stop_down:(id)sender;
- (IBAction)start_down:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lbl;

- (IBAction)gu_down:(id)sender;
- (IBAction)ch_down:(id)sender;
- (IBAction)pa_down:(id)sender;
- (IBAction)again_down:(id)sender;

@end

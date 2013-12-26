//
//  ViewController.m
//  taim
//
//  Created by 吉野　恭平 on 13/12/12.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIImage *gu_img;
UIImage *ch_img;
UIImage *pa_img;

@synthesize lbl;

NSDate *stdate;
BOOL timeflg=FALSE;
BOOL flg_stopdown=FALSE;
float fTmp1, fTmp2;
NSString *strTmp1, *strTmp2;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.lbl.text = @"0.000";
    timer = [NSTimer scheduledTimerWithTimeInterval:(0.001)
        target:self selector:@selector(onTimer:)
        userInfo:nil repeats:YES];
    
    ke.hidden = YES;
    tek.hidden = YES;
    again.hidden = YES;
    [ke setFont:[UIFont boldSystemFontOfSize:20.0f]];
    [ke setTextColor:[UIColor redColor]];
    gu_img = [UIImage imageNamed:@"gu.png"];
    ch_img = [UIImage imageNamed:@"ch.png"];
    pa_img = [UIImage imageNamed:@"pa.png"];
}

- (void)viewDidUnload
{
    [self setLbl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [timer invalidate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)onTimer:(NSTimer*)timer {
    //　グローバルなフラグがTRUEのとき、
    //　つまり、startボタンが押されたら常に真となり下記処理が実行される
    if(timeflg){
        NSDate *now = [NSDate date];//現在時刻
        //NSDate *tmp;//時刻計算用
        if(flg_stopdown){
            
            //　いちどString型に入れる
            strTmp2 = [NSString stringWithFormat:@"%.3f",[now timeIntervalSinceDate:stdate]];
            
            // 計算用にfloatに変換
            fTmp2 = [strTmp2 floatValue];
            
            float fTmp3;
            
            // stop押下時のラベルの時間を足す
            fTmp3 = fTmp1 + fTmp2;
            
            self.lbl.text = [NSString stringWithFormat:@"%.3f", fTmp3];
            
            
        }
        else{
            self.lbl.text = [NSString stringWithFormat:@"%.3f",[now timeIntervalSinceDate:stdate]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clear_down:(id)sender {
    flg_stopdown = FALSE;
    timeflg = FALSE;
    self.lbl.text = @"0.000";
}

- (IBAction)stop_down:(id)sender {
    if(timeflg){
        flg_stopdown = TRUE;
        
        //　いったんstring型に入れる
        strTmp1 = self.lbl.text;
        
        // 計算用にfloatに変換
        fTmp1 = [strTmp1 floatValue];
        
    }
    timeflg = FALSE;
}
- (IBAction)start_down:(id)sender {
    if(timeflg == FALSE){
        timeflg = TRUE;
        stdate = [NSDate date];
        //[stdate retain];// unavailableエラーのためコメントアウト
    }
}

- (IBAction)gu_down:(id)sender {
    ja.text=@"ジャンケン…ポン";
    ch.hidden = YES;
    pa.hidden = YES;
    gu.hidden = NO;
    tek.hidden = NO;
    ke.hidden = NO;
    
    NSInteger keai = arc4random() % 3;
    if (keai == 0){
        //tek.text = @"グー✊";
        [tek setImage:gu_img];
        ke.text = @"あいこで…";
        ch.hidden = NO;
        pa.hidden = NO;
        again.hidden = YES;
        [ke setTextColor:[UIColor blackColor]];
    } else if(keai == 1){
        ke.text = @"あなたの勝ち！";
        //tek.text = @"相手はチョキ✌";
        [tek setImage:ch_img];
        gu.enabled = NO;
        again.hidden = NO;
        [ke setTextColor:[UIColor redColor]];
    } else{
        ke.text = @"あなたの負け！";
        //tek.text = @"相手はパー✋";
        [tek setImage:pa_img];
        gu.enabled = NO;
        again.hidden = NO;
        [ke setTextColor:[UIColor blueColor]];
    }
}

- (IBAction)ch_down:(id)sender {
    ja.text=@"ジャンケン…ポン";
    gu.hidden = YES;
    pa.hidden = YES;
    ch.hidden = NO;
    tek.hidden = NO;
    ke.hidden = NO;
    
    NSInteger keai = arc4random() % 3;
    if (keai==1){
        //tek.text = @"チョキ✌";
        [tek setImage:ch_img];
        ke.text = @"あいこで…";
        gu.hidden = NO;
        pa.hidden = NO;
        again.hidden = YES;
        [ke setTextColor:[UIColor blackColor]];
    } else if(keai==2){
        ke.text = @"あなたの勝ち！";
        [tek setImage:pa_img];
        //tek.text = @"相手はパー✋";
        ch.enabled =NO;
        again.hidden = NO;
        [ke setTextColor:[UIColor redColor]];
    } else{
        ke.text = @"あなたの負け！";
        //tek.text = @"相手はグー✊";
        [tek setImage:gu_img];
        ch.enabled =NO;
        again.hidden = NO;
        [ke setTextColor:[UIColor blueColor]];
    }
}

- (IBAction)pa_down:(id)sender {
    ja.text=@"ジャンケン…ポン";
    gu.hidden = YES;
    ch.hidden = YES;
    pa.hidden = NO;
    tek.hidden = NO;
    ke.hidden = NO;
    
    NSInteger keai = arc4random() % 3;
    if (keai==2){
        //tek.text = @"パー✋";
        [tek setImage:pa_img];
        ke.text = @"あいこで…";
        gu.hidden = NO;
        ch.hidden = NO;
        again.hidden = YES;
        [ke setTextColor:[UIColor blackColor]];
    } else if(keai==0){
        ke.text = @"あなたの勝ち！";
        [tek setImage:gu_img];
        //tek.text = @"相手はグー✊";
        pa.enabled =NO;
        again.hidden = NO;
        [ke setTextColor:[UIColor redColor]];
    } else{
        ke.text = @"あなたの負け！";
        [tek setImage:ch_img];
        //tek.text = @"相手はチョキ✌";
        pa.enabled =NO;
        again.hidden = NO;
        [ke setTextColor:[UIColor blueColor]];
    }
    
}

- (IBAction)again_down:(id)sender {
    ch.hidden = NO;
    ch.enabled =YES;
    pa.hidden = NO;
    pa.enabled =YES;
    gu.hidden = NO;
    gu.enabled =YES;
    ja.text = @"ジャンケン…";
    //ai.text = @"";
    [tek setImage:nil];
    ke.text = @"";
    again.hidden = YES;
    
}

@end

//
//  ViewController.m
//  UI(冒❤️)
//
//  Created by Ibokan2 on 16/6/21.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "ViewController.h"
#import "heartFiyView.h"
@interface ViewController ()
{
    CGFloat heartSize;
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    heartSize = 36;
    self.view.backgroundColor =[UIColor colorWithRed:204/255.0 green:254/255.0 blue:243/255.0 alpha:1];
    self.view.userInteractionEnabled = YES;
    //控件添加单击事件
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(heart)];
    [self.view addGestureRecognizer:tapgesture];
    //添加长按事件
    UILongPressGestureRecognizer *longpressgesture =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longpress:)];
    //最短长按时间
    longpressgesture.minimumPressDuration = 0.5;
    [self.view addGestureRecognizer:longpressgesture];
    
}
-(void)heart{
    heartFiyView *heart =[[heartFiyView alloc]initWithFrame:CGRectMake(0, 0, heartSize, heartSize)];
    [self.view addSubview:heart];
    CGPoint point = CGPointMake(20+heartSize/2, self.view.bounds.size.height - heartSize/2 -20);
    heart.center = point;
    [heart animateAtView:self.view];
    NSLog(@"%f",heart.center.x);
    
}
-(void)longpress:(UILongPressGestureRecognizer *)longpress{
    switch (longpress.state) {
        case UIGestureRecognizerStateBegan:
            timer =[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(heart) userInfo:nil repeats:YES];
            break;
        case UIGestureRecognizerStateEnded:
            //定时器取消
            [timer invalidate];
            timer = nil;
            break;
  
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

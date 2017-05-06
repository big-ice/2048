//
//  ViewController.m
//  2048
//
//  Created by 潘若冰 on 2016/12/19.
//  Copyright © 2016年 潘若冰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int a[16] = {0};
int number[4][4] = {0};

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:200/255.0 green:207/255.0 blue:229/255.0 alpha:1];
    
    UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(157.5, 50, 80, 35)];
    titlelabel.text = @"2048";
    titlelabel.backgroundColor = [UIColor colorWithRed:88/255.0 green:178/255.0 blue:220/255.0 alpha:1];
    titlelabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *backlabel = [[UILabel alloc] initWithFrame:CGRectMake(12.5, 30, 350, 120)];
    backlabel.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    
    UILabel *scorelabel = [[UILabel alloc] initWithFrame:CGRectMake(20.5, 95, 112.5, 35)];
    UILabel *maxscorelabel = [[UILabel alloc] initWithFrame:CGRectMake(20.5, 50, 112.5, 35)];
    scorelabel.backgroundColor = [UIColor colorWithRed:88/255.0 green:178/255.0 blue:220/255.0 alpha:1];
    maxscorelabel.backgroundColor = [UIColor colorWithRed:88/255.0 green:178/255.0 blue:220/255.0 alpha:1];
    maxscorelabel.text = @"最高分";
    scorelabel.text = @"分数";

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(260, 50, 94.5, 80)];
    btn.backgroundColor = [UIColor colorWithRed:88/255.0 green:178/255.0 blue:220/255.0 alpha:1];
        [btn setTitle:@"重新开始" forState:UIControlStateNormal];
    btn.tintColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(12.5, 200, 350, 350)];
    view.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    
    UILabel *border1 = [[UILabel alloc] initWithFrame:CGRectMake(12.5, 200, 8, 350)];
    border1.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    UILabel *border2 = [[UILabel alloc] initWithFrame:CGRectMake(98, 200, 8, 350)];
    border2.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    UILabel *border3 = [[UILabel alloc] initWithFrame:CGRectMake(183.5, 200, 8, 350)];
    border3.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    UILabel *border4 = [[UILabel alloc] initWithFrame:CGRectMake(269, 200, 8, 350)];
    border4.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    UILabel *border5 = [[UILabel alloc] initWithFrame:CGRectMake(354.5, 200, 8, 350)];
    border5.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    UILabel *border6 = [[UILabel alloc] initWithFrame:CGRectMake(12.5, 200, 350, 8)];
    border6.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    UILabel *border7 = [[UILabel alloc] initWithFrame:CGRectMake(12.5, 285.5, 350, 8)];
    border7.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    UILabel *border8 = [[UILabel alloc] initWithFrame:CGRectMake(12.5, 371, 350, 8)];
    border8.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];    UILabel *border9 = [[UILabel alloc] initWithFrame:CGRectMake(12.5, 456.5, 350, 8)];
    border9.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    UILabel *border10 = [[UILabel alloc] initWithFrame:CGRectMake(12.5, 542, 350, 8)];
    border10.backgroundColor = [UIColor colorWithRed:132/255.0 green:157/255.0 blue:219/255.0 alpha:1];
    
    //16个格子的坐标,边长为77.5
    //(20.5,208) (106,208) (191.5,208) (277,208)
    //(20.5,293.5) (106,293.5) (191.5,293.5) (277,293.5)
    //(20.5,379) (106,379) (191.5,379) (277,379)
    //(20.5,464.5) (106,464.5) (191.5,464.5) (277,464.5)
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(20.5, 208, 77.5, 77.5)];
    _label1.textAlignment = NSTextAlignmentCenter;
    _label1.font = [UIFont systemFontOfSize:25];
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(106, 208, 77.5, 77.5)];
    _label2.textAlignment = NSTextAlignmentCenter;
    _label2.font = [UIFont systemFontOfSize:25];
    
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(191.5, 208, 77.5, 77.5)];
    _label3.textAlignment = NSTextAlignmentCenter;
    _label3.font = [UIFont systemFontOfSize:25];
    
    _label4 = [[UILabel alloc] initWithFrame:CGRectMake(277, 208, 77.5, 77.5)];
    _label4.textAlignment = NSTextAlignmentCenter;
    _label4.font = [UIFont systemFontOfSize:25];
    
    _label5 = [[UILabel alloc] initWithFrame:CGRectMake(20.5, 293.5, 77.5, 77.5)];
    _label5.textAlignment = NSTextAlignmentCenter;
    _label5.font = [UIFont systemFontOfSize:25];
    
    _label6 = [[UILabel alloc] initWithFrame:CGRectMake(106, 293.5, 77.5, 77.5)];
    _label6.textAlignment = NSTextAlignmentCenter;
    _label6.font = [UIFont systemFontOfSize:25];
    
    _label7 = [[UILabel alloc] initWithFrame:CGRectMake(191.5, 293.5, 77.5, 77.5)];
    _label7.textAlignment = NSTextAlignmentCenter;
    _label7.font = [UIFont systemFontOfSize:25];
    
    _label8 = [[UILabel alloc] initWithFrame:CGRectMake(277, 293.5, 77.5, 77.5)];
    _label8.textAlignment = NSTextAlignmentCenter;
    _label8.font = [UIFont systemFontOfSize:25];
    
    _label9 = [[UILabel alloc] initWithFrame:CGRectMake(20.5, 379, 77.5, 77.5)];
    _label9.textAlignment = NSTextAlignmentCenter;
    _label9.font = [UIFont systemFontOfSize:25];
    
    _label10 = [[UILabel alloc] initWithFrame:CGRectMake(106, 379, 77.5, 77.5)];
    _label10.textAlignment = NSTextAlignmentCenter;
    _label10.font = [UIFont systemFontOfSize:25];
    
    _label11 = [[UILabel alloc] initWithFrame:CGRectMake(191.5, 379, 77.5, 77.5)];
    _label11.textAlignment = NSTextAlignmentCenter;
    _label11.font = [UIFont systemFontOfSize:25];
    
    _label12 = [[UILabel alloc] initWithFrame:CGRectMake(277, 379, 77.5, 77.5)];
    _label12.textAlignment = NSTextAlignmentCenter;
    _label12.font = [UIFont systemFontOfSize:25];
    
    _label13 = [[UILabel alloc] initWithFrame:CGRectMake(20.5, 464.5, 77.5, 77.5)];
    _label13.textAlignment = NSTextAlignmentCenter;
    _label13.font = [UIFont systemFontOfSize:25];
    
    _label14 = [[UILabel alloc] initWithFrame:CGRectMake(106, 464.5, 77.5, 77.5)];
    _label14.textAlignment = NSTextAlignmentCenter;
    _label14.font = [UIFont systemFontOfSize:25];
    
    _label15 = [[UILabel alloc] initWithFrame:CGRectMake(191.5, 464.5, 77.5, 77.5)];
    _label15.textAlignment = NSTextAlignmentCenter;
    _label15.font = [UIFont systemFontOfSize:25];
    
    _label16 = [[UILabel alloc] initWithFrame:CGRectMake(277, 464.5, 77.5, 77.5)];
    _label16.textAlignment = NSTextAlignmentCenter;
    _label16.font = [UIFont systemFontOfSize:25];
    

    
    [self.view addSubview:backlabel];
    [self.view addSubview:view];
    [self.view addSubview:border1];
    [self.view addSubview:border2];
    [self.view addSubview:border3];
    [self.view addSubview:border4];
    [self.view addSubview:border5];
    [self.view addSubview:border6];
    [self.view addSubview:border7];
    [self.view addSubview:border8];
    [self.view addSubview:border9];
    [self.view addSubview:border10];
    [self.view addSubview:_label1];
    [self.view addSubview:_label2];
    [self.view addSubview:_label3];
    [self.view addSubview:_label4];
    [self.view addSubview:_label5];
    [self.view addSubview:_label6];
    [self.view addSubview:_label7];
    [self.view addSubview:_label8];
    [self.view addSubview:_label9];
    [self.view addSubview:_label10];
    [self.view addSubview:_label11];
    [self.view addSubview:_label12];
    [self.view addSubview:_label13];
    [self.view addSubview:_label14];
    [self.view addSubview:_label15];
    [self.view addSubview:_label16];
    [self.view addSubview:btn];
    [self.view addSubview:scorelabel];
    [self.view addSubview:maxscorelabel];
    [self.view addSubview:titlelabel];
    [self rand];
    [self show];
    
    UISwipeGestureRecognizer *recognizer;
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:recognizer];
    
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [[self view] addGestureRecognizer:recognizer];
    
    // Do any additional setup after loading the view, typically from a nib.
}
//点击事件
-(void)click{
    NSLog(@"重新开始");
    _label1.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label1.text = @"";
    _label2.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label2.text = @"";
    _label3.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label3.text = @"";
    _label4.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label4.text = @"";
    _label5.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label5.text = @"";
    _label6.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label6.text = @"";
    _label7.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label7.text = @"";
    _label8.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label8.text = @"";
    _label9.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label9.text = @"";
    _label10.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label10.text = @"";
    _label11.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label11.text = @"";
    _label12.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label12.text = @"";
    _label13.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label13.text = @"";
    _label14.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label14.text = @"";
    _label15.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label15.text = @"";
    _label16.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
    _label16.text = @"";
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<4; j++) {
            number[i][j] = 0;
        }
    }
    [self rand];
    [self show];
    
}

-(void)score{
    
}

-(void)show{
    if (number[0][0]!=0) {
        _label1.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label1.text = [NSString stringWithFormat:@"%d",number[0][0]];
    }
    else{
        _label1.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label1.text = @"";
    }
    if (number[0][1]!=0) {
        _label2.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label2.text = [NSString stringWithFormat:@"%d",number[0][1]];
    }
    else{
        _label2.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label2.text = @"";
    }
    if (number[0][2]!=0) {
        _label3.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label3.text = [NSString stringWithFormat:@"%d",number[0][2]];
    }
    else{
        _label3.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label3.text = @"";
    }
    if (number[0][3]!=0) {
        _label4.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label4.text = [NSString stringWithFormat:@"%d",number[0][3]];
    }
    else{
        _label4.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label4.text = @"";
    }
    if (number[1][0]!=0) {
        _label5.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label5.text = [NSString stringWithFormat:@"%d",number[1][0]];
    }
    else{
        _label5.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label5.text = @"";
    }
    if (number[1][1]!=0) {
        _label6.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label6.text = [NSString stringWithFormat:@"%d",number[1][1]];
    }
    else{
        _label6.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label6.text = @"";
    }
    if (number[1][2]!=0) {
        _label7.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label7.text = [NSString stringWithFormat:@"%d",number[1][2]];
    }
    else{
        _label7.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label7.text = @"";
    }
    if (number[1][3]!=0) {
        _label8.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label8.text = [NSString stringWithFormat:@"%d",number[1][3]];
    }
    else{
        _label8.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label8.text = @"";
    }
    if (number[2][0]!=0) {
        _label9.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label9.text = [NSString stringWithFormat:@"%d",number[2][0]];
    }
    else{
        _label9.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label9.text = @"";
    }
    if (number[2][1]!=0) {
        _label10.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label10.text = [NSString stringWithFormat:@"%d",number[2][1]];
    }
    else{
        _label10.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label10.text = @"";
    }
    if (number[2][2]!=0) {
        _label11.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label11.text = [NSString stringWithFormat:@"%d",number[2][2]];
    }
    else{
        _label11.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label11.text = @"";
    }
    if (number[2][3]!=0) {
        _label12.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label12.text = [NSString stringWithFormat:@"%d",number[2][3]];
    }
    else{
        _label12.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label12.text = @"";
    }
    if (number[3][0]!=0) {
        _label13.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label13.text = [NSString stringWithFormat:@"%d",number[3][0]];
    }
    else{
        _label13.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label13.text = @"";
    }
    if (number[3][1]!=0) {
        _label14.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label14.text = [NSString stringWithFormat:@"%d",number[3][1]];
    }
    else{
        _label14.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label14.text = @"";
    }
    if (number[3][2]!=0) {
        _label15.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label15.text = [NSString stringWithFormat:@"%d",number[3][2]];
    }
    else{
        _label15.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label15.text = @"";
    }
    if (number[3][3]!=0) {
        _label16.backgroundColor = [UIColor colorWithRed:120/255.0 green:194/255.0 blue:196/255.0 alpha:1];
        _label16.text = [NSString stringWithFormat:@"%d",number[3][3]];
    }
    else{
        _label16.backgroundColor = [UIColor colorWithRed:87/255.0 green:124/255.0 blue:138/255.0 alpha:1];
        _label16.text = @"";
    }
}
//随机出现
-(void)rand{
    int i = rand()%4;
    int j = rand()%4;
    while (number[i][j]!=0) {
        i = rand()%4;
        j = rand()%4;
    }
    switch (i) {
        case 0:
            switch(j){
                case 0:
                    number[0][0] = 2*(rand()%2+1);
                    break;
                case 1:
                    number[0][1] = 2*(rand()%2+1);
                    break;
                case 2:
                    number[0][2] = 2*(rand()%2+1);
                    break;
                case 3:
                    number[0][3] = 2*(rand()%2+1);
                    break;
            }
            break;
        case 1:
            switch (j) {
                case 0:
                    number[1][0] = 2*(rand()%2+1);
                    break;
                case 1:
                    number[1][1] = 2*(rand()%2+1);
                    break;
                case 2:
                    number[1][2] = 2*(rand()%2+1);
                    break;
                case 3:
                    number[1][3] = 2*(rand()%2+1);
                    break;
            }
            break;
        case 2:
            switch (j) {
                case 0:
                    number[2][0] = 2*(rand()%2+1);
                    break;
                case 1:
                    number[2][1] = 2*(rand()%2+1);
                    break;
                case 2:
                    number[2][2] = 2*(rand()%2+1);
                    break;
                case 3:
                    number[2][3] = 2*(rand()%2+1);
                    break;
            }
            break;
        case 3:
            switch (j) {
                case 0:
                    number[3][0] = 2*(rand()%2+1);
                    break;
                case 1:
                    number[3][1] = 2*(rand()%2+1);
                    break;
                case 2:
                    number[3][2] = 2*(rand()%2+1);
                    break;
                case 3:
                    number[3][3] = 2*(rand()%2+1);
                    break;
            }
            break;

    }
}
//获取数字
-(void)getNumber{
    number[0][0] = [_label1.text intValue];
    number[0][1] = [_label2.text intValue];
    number[0][2] = [_label3.text intValue];
    number[0][3] = [_label4.text intValue];
    number[1][0] = [_label5.text intValue];
    number[1][1] = [_label6.text intValue];
    number[1][2] = [_label7.text intValue];
    number[1][3] = [_label8.text intValue];
    number[2][0] = [_label9.text intValue];
    number[2][1] = [_label10.text intValue];
    number[2][2] = [_label11.text intValue];
    number[2][3] = [_label12.text intValue];
    number[3][0] = [_label13.text intValue];
    number[3][1] = [_label14.text intValue];
    number[3][2] = [_label15.text intValue];
    number[3][3] = [_label16.text intValue];
}
//下滑
-(void)down{
    [self getNumber];
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<4; j++) {
            for (int k = 3; k>=1; k--) {
                if (number[k][i]==0) {
                    number[k][i] = number[k-1][i];
                    number[k-1][i] = 0;
                }
            }
        }
        if (number[1][i]==0&&number[2][i]==number[3][i]) {
            number[3][i] = 2*number[3][i];
            number[2][i] = 0;
        }
        else if (number[0][i]==0&&number[2][i]==number[3][i]) {
            number[3][i] = 2*number[3][i];
            number[2][i] = number[1][i];
            number[1][i] = 0;
        }
        else if (number[2][i]==number[1][i]&&number[2][i]!=number[3][i]) {
            number[2][i] = 2*number[2][i];
            number[1][i] = number[0][i];
        }
        else if (number[3][i]==number[2][i]&&number[1][i]==number[0][i]) {
            number[3][i] = 2*number[3][i];
            number[2][i] = 2*number[1][i];
            number[1][i] = number[0][i] = 0;
        }
        else if (number[0][i]!=number[1][i]&&number[2][i]==number[3][i]) {
            number[3][i] = 2*number[3][i];
            number[2][i] = number[1][i];
            number[1][i] = number[0][i];
            number[0][i] = 0;
        }
        else if (number[0][i]==number[1][i]&&number[2][i]!=number[3][i]) {
            number[1][i] = 2*number[1][i];
            number[0][i] = 0;
        }
    }
    
}
//上滑
-(void)up{
    [self getNumber];
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<4; j++) {
            for (int k = 0; k<3; k++) {
                if (number[k][i]==0) {
                    number[k][i] = number[k+1][i];
                    number[k+1][i] = 0;
                }
            }
        }
        if (number[3][i]==0&&number[1][i]==number[0][i]) {
            number[0][i] = 2*number[0][i];
            number[1][i] = 0;
        }
        else if (number[3][i]==0&&number[1][i]==number[0][i]) {
            number[0][i] = 2*number[0][i];
            number[1][i] = number[2][i];
            number[2][i] = 0;
        }
        else if (number[1][i]==number[2][i]&&number[1][i]!=number[0][i]) {
            number[1][i] = 2*number[1][i];
            number[2][i] = number[3][i];
        }
        else if (number[0][i]==number[1][i]&&number[2][i]==number[3][i]) {
            number[0][i] = 2*number[0][i];
            number[1][i] = 2*number[2][i];
            number[2][i] = number[3][i] = 0;
        }
        else if (number[3][i]!=number[2][i]&&number[1][i]==number[0][i]) {
            number[0][i] = 2*number[0][i];
            number[1][i] = number[2][i];
            number[2][i] = number[3][i];
            number[3][i] = 0;
        }
        else if (number[3][i]==number[2][i]&&number[1][i]!=number[0][i]) {
            number[2][i] = 2*number[2][i];
            number[3][i] = 0;
        }

    }
}
//左滑
-(void)left{
    [self getNumber];
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<4; j++) {
            for (int k = 0; k<3; k++) {
                if (number[i][k]==0) {
                    number[i][k] = number[i][k+1];
                    number[i][k+1] = 0;
                }
            }
        }
        if (number[i][3]==0&&number[i][1]==number[i][0]) {
            number[i][0] = 2*number[i][0];
            number[i][1] = 0;
        }
        else if (number[i][3]==0&&number[i][1]==number[i][0]) {
            number[i][0] = 2*number[i][0];
            number[i][1] = number[i][2];
            number[i][2] = 0;
        }
        else if (number[i][1]==number[i][2]&&number[i][1]!=number[i][0]) {
            number[i][1] = 2*number[i][1];
            number[i][2] = number[i][3];
        }
        else if (number[i][0]==number[i][1]&&number[i][2]==number[i][3]) {
            number[i][0] = 2*number[i][0];
            number[i][1] = 2*number[i][2];
            number[i][2] = number[i][3] = 0;
        }
        else if (number[i][3]!=number[i][2]&&number[i][1]==number[i][0]) {
            number[i][0] = 2*number[i][0];
            number[i][1] = number[i][2];
            number[i][2] = number[i][3];
            number[i][3] = 0;
        }
        else if (number[i][3]==number[i][2]&&number[i][1]!=number[i][0]) {
            number[i][2] = 2*number[i][2];
            number[i][3] = 0;
        }
        
    }

}
//右滑
-(void)right{
    [self getNumber];
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<4; j++) {
            for (int k = 3; k>=1; k--) {
                if (number[i][k]==0) {
                    number[i][k] = number[i][k-1];
                    number[i][k-1] = 0;
                }
            }
        }
        if (number[i][1]==0&&number[i][2]==number[i][3]) {
            number[i][3] = 2*number[i][3];
            number[i][2] = 0;
        }
        else if (number[i][0]==0&&number[i][2]==number[i][3]) {
            number[i][3] = 2*number[i][3];
            number[i][2] = number[i][1];
            number[i][1] = 0;
        }
        else if (number[i][2]==number[i][1]&&number[i][2]!=number[i][3]) {
            number[i][2] = 2*number[i][2];
            number[i][1] = number[i][0];
        }
        else if (number[i][3]==number[i][2]&&number[i][1]==number[i][0]) {
            number[i][3] = 2*number[i][3];
            number[i][2] = 2*number[i][1];
            number[i][1] = number[i][0] = 0;
        }
        else if (number[i][0]!=number[i][1]&&number[i][2]==number[i][3]) {
            number[i][3] = 2*number[i][3];
            number[i][2] = number[i][1];
            number[i][1] = number[i][0];
            number[i][0] = 0;
        }
        else if (number[i][0]==number[i][1]&&number[i][2]!=number[i][3]) {
            number[i][1] = 2*number[i][1];
            number[i][0] = 0;
        }
    }

}




//手势操作
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
        
        NSLog(@"swipe down");
        [self down];
        [self rand];
        [self show];
    }
    if(recognizer.direction==UISwipeGestureRecognizerDirectionUp) {
        
        NSLog(@"swipe up");
        [self up];
        [self rand];
        [self show];
    }
    
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
        NSLog(@"swipe left");
        [self left];
        [self rand];
        [self show];
    }
    
    
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        NSLog(@"swipe right");
        [self right];
        [self rand];
        [self show];
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

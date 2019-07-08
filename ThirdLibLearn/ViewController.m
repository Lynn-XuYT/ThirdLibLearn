//
//  ViewController.m
//  ThirdLibLearn
//
//  Created by lynn on 2019/3/22.
//  Copyright © 2019 lynn. All rights reserved.
//

#import "ViewController.h"
#import "GuideTipViewController.h"
#import "AnimationViewController.h"
#import "CardViewController.h"
//@import SocketIO;

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
//    SocketManager* _manager;
//    SocketIOClient* socket;
}
@property (nonatomic, strong)UIView *tempView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test"];
    [self.view addSubview:tableView];
//    self.tableView = tableView;
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 80, 50)];
//    [btn setTitle:@"GuideTip" forState:(UIControlStateNormal)];
//    [btn addTarget:self action:@selector(onClick:) forControlEvents:(UIControlEventTouchUpInside)];
//    btn.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:btn];
    
    //新建一个View;
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 0.1, 4)];
    tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tempView];
    self.tempView = tempView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"test"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Guide Tip";
            break;
        case 1:
            cell.textLabel.text = @"Sample Animation";
            break;
        default:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            GuideTipViewController *vc = [GuideTipViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1: {
            AnimationViewController *vc = [AnimationViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            // 缩放(参数为X轴和Y轴的缩放比例)
            [UIView animateWithDuration:2.0 animations:^{
                self.tempView.transform = CGAffineTransformMakeScale(200, 1);
//                self.tempView.transform = CGAffineTransformMake(2, 0, 0, 1, 0, 0);
            }];
        }
            break;
        case 4:{
            // 缩放(参数为X轴和Y轴的缩放比例)
            [UIView animateWithDuration:2.0 animations:^{
                self.tempView.transform = CGAffineTransformMakeScale(0.1, 1);
//                self.tempView.transform = CGAffineTransformMake(2, 0, 0, 1, 0, 0);
            }];
        }
            break;
        case 5:{
            CardViewController *vc = [CardViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
        {
            CATransition *transition = [CATransition animation];
            transition.duration =1.8;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            transition.type = kCATransitionFade;
            [self.tempView.layer addAnimation:transition forKey:@"a"];
            self.tempView.frame = CGRectMake(100, 100, 110.1, 4);
        }
            break;
    }
}

#pragma mark -
- (IBAction)onConnect:(id)sender {
//    NSURL* url = [[NSURL alloc] initWithString:@"http://localhost:3000"];
////    _manager= [[SocketManager alloc] initWithSocketURL:url config:@{@"log": @YES, @"compress": @YES}];
////    SocketIOClient* socket = _manager.defaultSocket;
//    socket= [[SocketIOClient alloc] initWithSocketURL:url config:@{@"log": @YES, @"compress": @YES}];
//
//    [socket on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
//        NSLog(@"socket connected");
//
//
//    }];
//
//    [socket on:@"currentAmount" callback:^(NSArray* data, SocketAckEmitter* ack) {
//        double cur = [[data objectAtIndex:0] floatValue];
//
//        [[socket emitWithAck:@"canUpdate" with:@[@(cur)]] timingOutAfter:0 callback:^(NSArray* data) {
//            [socket emit:@"update" with:@[@{@"amount": @(cur + 2.50)}]];
//        }];
//
//        [ack with:@[@"Got your currentAmount, ", @"dude"]];
//    }];
//
//    [socket on:@"register ack" callback:^(NSArray* data, SocketAckEmitter* ack) {
//        if ([[data firstObject] isKindOfClass:[NSData class]])
//        {
//            NSData *d = [data firstObject];
//
//            NSString *test = [NSString stringWithCString:d.bytes encoding:NSUTF8StringEncoding];
//            NSLog(@" -------- %@",test);
//        }
//        else if ([[data firstObject] isKindOfClass:[NSDictionary class]])
//        {
//            NSDictionary *dict = [data firstObject];
//            NSData *dataTes = [dict objectForKey:@"roleData"];
//            NSString *test = [NSString stringWithCString:dataTes.bytes encoding:NSUTF8StringEncoding];
//            NSLog(@" -------- %@",test);
//        }
//
//    }];
//    [socket connect];
}

- (IBAction)onClick:(id)sender {

//    SocketIOClient* socket = _manager.defaultSocket;
//    NSString *test = @"hahahha";
//    NSData *dataTes = [test dataUsingEncoding:NSUTF8StringEncoding];
//    NSArray *array = [NSArray arrayWithObjects:dataTes, nil];
//    [socket emit:@"register" with:array];
//
//    NSString * str = @"11111";
//    NSString *str2 = [NSString stringWithString:str];
//    str = nil;
//    NSLog(@"str = %@, str2 = %@", str, str2);
}

- (IBAction)onclic2:(id)sender
{
//    SocketIOClient* socket = _manager.defaultSocket;
//    NSString *kfuin = @"123";
//    NSString *test = @"hahahha";
//    NSData *dataTes = [test dataUsingEncoding:NSUTF8StringEncoding];
//
//    NSMutableDictionary *urlParams = [NSMutableDictionary dictionary];
//    [urlParams setObject:[NSNumber numberWithUnsignedLongLong:kfuin.longLongValue] forKey:@"kfuin"];
//    [urlParams setObject:dataTes forKey:@"roleData"];
//
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:urlParams options:NSJSONWritingPrettyPrinted error:nil];
//
//    NSArray *array = [NSArray arrayWithObjects:urlParams, nil];
//    [socket emit:@"register" with:array];
}

@end

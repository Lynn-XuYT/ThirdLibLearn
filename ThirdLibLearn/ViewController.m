//
//  ViewController.m
//  ThirdLibLearn
//
//  Created by lynn on 2019/3/22.
//  Copyright © 2019 lynn. All rights reserved.
//

#import "ViewController.h"
@import SocketIO;

@interface ViewController ()
{
//    SocketManager* _manager;
    SocketIOClient* socket;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    
}
- (IBAction)onConnect:(id)sender {
    NSURL* url = [[NSURL alloc] initWithString:@"http://localhost:3000"];
//    _manager= [[SocketManager alloc] initWithSocketURL:url config:@{@"log": @YES, @"compress": @YES}];
//    SocketIOClient* socket = _manager.defaultSocket;
    socket= [[SocketIOClient alloc] initWithSocketURL:url config:@{@"log": @YES, @"compress": @YES}];
    
    [socket on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"socket connected");
        
        
    }];
    
    [socket on:@"currentAmount" callback:^(NSArray* data, SocketAckEmitter* ack) {
        double cur = [[data objectAtIndex:0] floatValue];
        
        [[socket emitWithAck:@"canUpdate" with:@[@(cur)]] timingOutAfter:0 callback:^(NSArray* data) {
            [socket emit:@"update" with:@[@{@"amount": @(cur + 2.50)}]];
        }];
        
        [ack with:@[@"Got your currentAmount, ", @"dude"]];
    }];
    
    [socket on:@"register ack" callback:^(NSArray* data, SocketAckEmitter* ack) {
        if ([[data firstObject] isKindOfClass:[NSData class]])
        {
            NSData *d = [data firstObject];
    
            NSString *test = [NSString stringWithCString:d.bytes encoding:NSUTF8StringEncoding];
            NSLog(@" -------- %@",test);
        }
        else if ([[data firstObject] isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *dict = [data firstObject];
            NSData *dataTes = [dict objectForKey:@"roleData"];
            NSString *test = [NSString stringWithCString:dataTes.bytes encoding:NSUTF8StringEncoding];
            NSLog(@" -------- %@",test);
        }

    }];
    [socket connect];
}

- (IBAction)onClick:(id)sender {

//    SocketIOClient* socket = _manager.defaultSocket;
    NSString *test = @"hahahha";
    NSData *dataTes = [test dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *array = [NSArray arrayWithObjects:dataTes, nil];
    [socket emit:@"register" with:array];
    
    NSString * str = @"11111";
    NSString *str2 = [NSString stringWithString:str];
    str = nil;
    NSLog(@"str = %@, str2 = %@", str, str2);
}

- (IBAction)onclic2:(id)sender
{
//    SocketIOClient* socket = _manager.defaultSocket;
    NSString *kfuin = @"123";
    NSString *test = @"hahahha";
    NSData *dataTes = [test dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary *urlParams = [NSMutableDictionary dictionary];
    [urlParams setObject:[NSNumber numberWithUnsignedLongLong:kfuin.longLongValue] forKey:@"kfuin"];
    [urlParams setObject:dataTes forKey:@"roleData"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:urlParams options:NSJSONWritingPrettyPrinted error:nil];
    
    NSArray *array = [NSArray arrayWithObjects:urlParams, nil];
    [socket emit:@"register" with:array];
}

@end

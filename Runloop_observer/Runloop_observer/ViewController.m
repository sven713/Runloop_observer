//
//  ViewController.m
//  Runloop_observer
//
//  Created by sve on 2018/6/14.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取Runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    
    // 创建观察者
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeTimers, YES, 0, &callbace, NULL);
    // 添加观察者
    CFRunLoopAddObserver(runloop, observer, kCFRunLoopDefaultMode);
    // 释放观察者
    CFRelease(observer);
}


void callbace(){
    NSLog(@"观察到了-%@",[NSThread currentThread]);
}


@end

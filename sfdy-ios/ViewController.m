//
//  ViewController.m
//  sfdy-ios
//
//  Created by Aaron Ong on 9/8/21.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)isNotchScreen {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return NO;
    }
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSInteger notchValue = size.width / size.height * 100;
    
    if (216 == notchValue || 46 == notchValue) {
        return YES;
    }
    
    return NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    
    WKWebView *webview;
    
    
    // webvew 全屏处理
    if ([self isNotchScreen]) {
        webview = [[WKWebView alloc] initWithFrame: CGRectMake(0, 44, size.width, size.height - 44) configuration: config];
        webview.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        webview = [[WKWebView alloc] initWithFrame: CGRectMake(0, 20, size.width, size.height) configuration: config];
    }
    
    // Do any additional setup after loading the view.
    [webview loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString: @"https://jyavs.com"]]];
    

    [self.view addSubview:  webview];
}


@end

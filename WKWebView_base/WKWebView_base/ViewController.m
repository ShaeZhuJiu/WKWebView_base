//
//  ViewController.m
//  WKWebView_base
//
//  Created by 谢鑫 on 2019/7/13.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()<WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) WKWebView *localWebView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    //实例化WKWebView对象
    self.webView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height-50)];
    self.webView.navigationDelegate=self;
    
    //创建请求,NSURLRequest也可以
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://blog.csdn.net/qq_27597629"]];
    
    //加载网页
   [_webView loadRequest:request];
    [self.view addSubview:_webView];
    
}

- (IBAction)goBack:(UIButton *)sender {
    [self.webView goBack];
}
- (IBAction)reload:(UIButton *)sender {
    [self.webView reload];
}
- (IBAction)goForward:(UIButton *)sender {
    [self.webView goForward];
}
- (IBAction)localFile:(UIButton *)sender {
    self.localWebView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height-50)];
    NSURL *url=[NSURL fileURLWithPath:@"/Users/xiexin/Downloads/0c5f0f3bca865b44476199f0325b8f1f.jpg"];
    [self.localWebView loadFileURL:url allowingReadAccessToURL:url];
   [self.view addSubview:_localWebView];
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didStartProvisionalNavigation");
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didCommitNavigation");
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didFinishNavigation");
}
@end

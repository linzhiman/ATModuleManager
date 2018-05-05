//
//  ViewController.m
//  demo
//
//  Created by linzhiman on 2018/5/5.
//  Copyright © 2018年 linzhiman. All rights reserved.
//

#import "ViewController.h"
#import <ATModuleManager/ATModuleManager.h>

@interface AModule : NSObject<ATModuleProtocol>
@end
@implementation AModule
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"AModule init");
    }
    return self;
}
- (void)initModule
{
    NSLog(@"AModule initModule");
}
- (void)uninitModule
{
    NSLog(@"AModule uninitModule");
}
@end

@interface BModule : NSObject<ATModuleProtocol>
@end
@implementation BModule
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"BModule init");
    }
    return self;
}
- (void)initModule
{
    NSLog(@"BModule initModule");
}
- (void)uninitModule
{
    NSLog(@"BModule uninitModule");
}
@end

@interface CModule : NSObject<ATModuleProtocol>
@end
@implementation CModule
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"CModule init");
    }
    return self;
}
- (void)initModule
{
    NSLog(@"CModule initModule");
}
- (void)uninitModule
{
    NSLog(@"CModule uninitModule");
}
@end

@interface DModule : NSObject<ATModuleProtocol>
@end
@implementation DModule
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"DModule init");
    }
    return self;
}
- (void)initModule
{
    NSLog(@"DModule initModule");
}
- (void)uninitModule
{
    NSLog(@"DModule uninitModule");
}
@end

@interface ViewController ()

@property (nonatomic, strong) ATModuleManager *moduleManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _moduleManager = [[ATModuleManager alloc] init];
    
    ATAddModule(_moduleManager, AModule);
    ATAddModule(_moduleManager, BModule);
    
    ATAddModuleGroup(_moduleManager, CModule, 1);
    ATAddModuleGroup(_moduleManager, DModule, 1);
    
    [_moduleManager initModuleWithGroup:ATDefaultGroup];
    [_moduleManager initModuleWithGroup:1];
    
    [_moduleManager uninitModuleWithGroup:1];
    [_moduleManager uninitModuleWithGroup:ATDefaultGroup];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

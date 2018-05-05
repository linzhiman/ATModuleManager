//
//  ATModuleManager.m
//  ATModuleManager
//
//  Created by linzhiman on 2018/5/3.
//  Copyright © 2018年 linzhiman. All rights reserved.
//

#import "ATModuleManager.h"

const NSInteger ATDefaultGroup = 0;

@interface ATModuleManager()

@property (nonatomic, strong) NSMutableDictionary *modules;// <identifier, id<ATModuleProtocol>>
@property (nonatomic, strong) NSMutableDictionary *groups;// <group, NSMutableSet<id<ATModuleProtocol>>>

@end

@implementation ATModuleManager

- (id<ATModuleProtocol>)moduleWithIdentifier:(NSString *)identifier
{
    if (!_modules) {
        return nil;
    }
    else {
        return [_modules objectForKey:identifier];
    }
}

- (void)addModule:(id<ATModuleProtocol>)module identifier:(NSString *)identifier
{
    [self addModule:module identifier:identifier group:ATDefaultGroup];
}

- (void)addModule:(id<ATModuleProtocol>)module identifier:(NSString *)identifier group:(NSInteger)group
{
    if (!_modules) {
        _modules = [[NSMutableDictionary alloc] init];
    }
    [_modules setObject:module forKey:identifier];
    
    if (!_groups) {
        _groups = [[NSMutableDictionary alloc] init];
    }
    NSMutableSet *aSet = [_groups objectForKey:@(group)];
    if (!aSet) {
        aSet = [[NSMutableSet alloc] init];
        [_groups setObject:aSet forKey:@(group)];
    }
    [aSet addObject:module];
}

- (void)removeModuleWithIdentifier:(NSString *)identifier
{
    [self removeModuleWithIdentifier:identifier group:ATDefaultGroup];
}

- (void)removeModuleWithIdentifier:(NSString *)identifier group:(NSInteger)group
{
    id<ATModuleProtocol> obj = [self moduleWithIdentifier:identifier];
    
    [_modules removeObjectForKey:identifier];
    
    NSMutableSet *aSet = [_groups objectForKey:@(group)];
    [aSet removeObject:obj];
}

- (void)initModuleWithGroup:(NSInteger)group
{
    NSMutableSet *aSet = [_groups objectForKey:@(group)];
    if (aSet) {
        [aSet makeObjectsPerformSelector:@selector(initModule)];
    }
}

- (void)uninitModuleWithGroup:(NSInteger)group
{
    NSMutableSet *aSet = [_groups objectForKey:@(group)];
    if (aSet) {
        [aSet makeObjectsPerformSelector:@selector(uninitModule)];
    }
}

@end

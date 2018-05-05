//
//  ATModuleManager.h
//  ATModuleManager
//
//  Created by linzhiman on 2018/5/3.
//  Copyright © 2018年 linzhiman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATModuleProtocol.h"

#define ATAddModule(atModuleManager, atModuleClass) \
    [atModuleManager addModule:[[atModuleClass alloc] init] identifier:@#atModuleClass];

#define ATGetModule(atModuleManager, atModuleClass) \
    ((atModuleClass *)[atModuleManager moduleWithIdentifier:@#atModuleClass])

#define ATDefineVariableOfModule(atModuleManager, atModuleClass) \
    atModuleClass *aModule = (atModuleClass *)[atModuleManager moduleWithIdentifier:@#atModuleClass];

extern const NSInteger ATDefaultGroup;

@interface ATModuleManager : NSObject

- (id<ATModuleProtocol>)moduleWithIdentifier:(NSString *)identifier;

- (void)addModule:(id<ATModuleProtocol>)module identifier:(NSString *)identifier;
- (void)addModule:(id<ATModuleProtocol>)module identifier:(NSString *)identifier group:(NSInteger)group;

- (void)removeModuleWithIdentifier:(NSString *)identifier;
- (void)removeModuleWithIdentifier:(NSString *)identifier group:(NSInteger)group;

- (void)initModuleWithGroup:(NSInteger)group;
- (void)uninitModuleWithGroup:(NSInteger)group;

@end

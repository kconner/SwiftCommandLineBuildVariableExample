//
//  BuildVariables.m
//  CommandLineBuildVariableExample
//
//  Created by Kevin Conner on 2022-09-28.
//

#import "BuildVariables.h"

@implementation BuildVariables

- (instancetype)init
{
    self = [super init];
    if (self) {
#ifdef SOME_SETTING
        NSString *someSetting = @OS_STRINGIFY(SOME_SETTING);
        if ([someSetting length] != 0) {
            _someSetting = someSetting;
        }
#endif
    }
    return self;
}

+ (instancetype)sharedBuildVariables
{
    static BuildVariables *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[self alloc] init];
    });
    return object;
}

@end

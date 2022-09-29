//
//  BuildVariables.h
//  CommandLineBuildVariableExample
//
//  Created by Kevin Conner on 2022-09-28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BuildVariables : NSObject

@property (nonatomic, readonly, copy, nullable) NSString *someSetting;

@property (class, nonatomic, readonly) BuildVariables *sharedBuildVariables;

@end

NS_ASSUME_NONNULL_END

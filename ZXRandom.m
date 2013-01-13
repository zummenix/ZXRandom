/*
 Copyright (C) 2013, Aleksey Kuznetsov. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors may be used
 to endorse or promote products derived from this software without specific
 prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ZXRandom.h"

@implementation ZXRandom

@synthesize minValue = min;
@synthesize maxValue = max;


#pragma mark - Creating and Initializing random number generator

+ (id)generatorFromMin:(NSInteger)value1 toMax:(NSInteger)value2
{
    return [[self alloc] initGeneratorFromMin:value1 toMax:value2];
}

- (id)initGeneratorFromMin:(NSInteger)value1 toMax:(NSInteger)value2
{
    self = [super init];

    if (self != nil) {
        if (value1 < value2) {
            min = value1; max = value2;
        } else {
            min = value2; max = value1;
        }
    }

    return self;
}

- (id)init
{
    return [self initGeneratorFromMin:0 toMax:255];
}


#pragma mark - Checking valid range

- (BOOL)isValidRange
{
    return (max > min);
}


#pragma mark - Getting Integer random value

+ (NSInteger)randomValueFromMin:(NSInteger)value1 toMax:(NSInteger)value2
{
    ZXRandom *generator = [[self alloc] initGeneratorFromMin:value1 toMax:value2];
    return [generator randomValue];
}

- (NSInteger)randomValue
{
    if ([self isValidRange] == NO) {
        [NSException raise:@"InvalidRange" format:@"Invalid range in %@", self];
    }
    
    return min + arc4random() % (max - min + 1);
}


#pragma mark - Description for random number generator

- (NSString *)description
{
    return [NSString stringWithFormat:@"<ZXRandom generator: minValue = %li; maxValue = %li>", min, max];
}

@end

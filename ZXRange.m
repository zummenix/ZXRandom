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

#import "ZXRange.h"

@implementation ZXRange

@synthesize min = _min;
@synthesize max = _max;


+ (id)rangeWithMin:(NSInteger)min max:(NSInteger)max
{
    return [[self alloc] initRangeWithMin:min max:max];
}

+ (id)rangeWithMax:(NSInteger)max
{
    return [[self alloc] initRangeWithMin:0 max:max];
}

- (id)initRangeWithMin:(NSInteger)min max:(NSInteger)max
{
    self = [super init];

    if (self != nil) {
        _min = min;
        _max = max;

        if (_min >= _max) {
            [NSException raise:@"InvalidRange" format:@"Invalid range in %@", self];
        }
    }

    return self;
}

- (id)initRangeWithMax:(NSInteger)max
{
    return [self initRangeWithMin:0 max:max];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<ZXRange: min = %li, max = %li>", _min, _max];
}

@end
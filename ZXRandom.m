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


#define ARC4RANDOM_MAX (0xFFFFFFFF - 1)


BOOL ZXRanndomBoolean()
{
    return (arc4random() & 1) ? YES : NO;
}

CGFloat ZXRandomFloat(CGFloat minValue, CGFloat maxValue)
{
    CGFloat min = minValue;
    CGFloat max = maxValue;

    if (minValue > maxValue) {
        min = maxValue;
        max = minValue;
    }

    return min + (arc4random() / (CGFloat)ARC4RANDOM_MAX) * (max - min);
}

NSInteger ZXRandomInteger(NSInteger minValue, NSInteger maxValue)
{
    NSInteger min = minValue;
    NSInteger max = maxValue;

    if (minValue > maxValue) {
        min = maxValue;
        max = minValue;
    }

#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
    NSUInteger randomValue = (NSUInteger)(arc4random() + 1) << 32;
    randomValue |= (NSUInteger)(arc4random() + 1);
#else
    NSUInteger randomValue = (NSUInteger)(arc4random() + 1);
#endif

    // Getting range and checking overflow
    NSUInteger range = (max - min + 1);
    if (range == 0) range = NSUIntegerMax;

    return min + randomValue % range;
}

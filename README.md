ZXRandom is just a wrapper over arc4random() function that returns pseudo-random numbers.

## Example Usage

### ZXRandomBoolean

``` objective-c
if (ZXRandomBoolean()) {
    NSLog(@"YES");
} else {
    NSLog(@"NO");
}
```

### ZXRandomFloat

``` objective-c
NSColor *randomColor = [NSColor colorWithCalibratedRed:ZXRandomFloat(0.2, 0.7)
                                                 green:ZXRandomFloat(0.2, 0.7)
                                                  blue:ZXRandomFloat(0.2, 0.7)
                                                 alpha:0.5];
```

### ZXRandomInteger

``` objective-c
NSMutableArray *randomNumbers = [[NSMutableArray alloc] init];
for (NSUInteger i = 0; i < 100; i++) {
    [randomNumbers addObject:[NSNumber numberWithInteger:ZXRandomInteger(-10, 10)]];
}
```
//
//  WatchView.m
//  WatchSample
//
//  Created by sugimoto on 2014/01/12.
//  Copyright (c) 2014年 Yoshiaki Sugimoto. All rights reserved.
//

#import "WatchView.h"

@implementation WatchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSCalendar* calendar   = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlag  = NSYearCalendarUnit|NSMonthCalendarUnit|
                             NSDayCalendarUnit|NSHourCalendarUnit|
                             NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents* date = [calendar components:unitFlag fromDate:[NSDate date]];
    NSString* dateString   = [NSString stringWithFormat:@"%04d/%02d/%02d %02d:%02d:%02d",
                              date.year,
                              date.month,
                              date.day,
                              date.hour,
                              date.minute,
                              date.second
                              ];
    NSDictionary* dict     = [NSDictionary dictionaryWithObjectsAndKeys:
                             [UIFont systemFontOfSize:24], NSFontAttributeName, nil];
    
    [dateString drawAtPoint:CGPointMake(20, (float)[UIScreen mainScreen].bounds.size.height/2) withAttributes:dict];
    
    // Timer set
    if ( _timer == nil ) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(onInterval:)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

-(void)onInterval:(NSTimer*) timer {
    [self setNeedsDisplay];
}


@end

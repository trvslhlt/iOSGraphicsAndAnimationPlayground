//
//  THDrawRectImplementationScraper.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THDrawRectImplementationScraper.h"
#define kDrawRectImplementationString @"(void)drawRect:(CGRect)rect{"

@implementation THDrawRectImplementationScraper

+ (NSString *)drawRectImpForClass:(NSString *)className{
  
  //get .m for class
  NSString *filePath = [[NSBundle mainBundle] pathForResource:className ofType:@"m"];
  if (!filePath) {
    return [NSString stringWithFormat: @"Class implementation file \"%@\" not included in \"target > build phases > copy files\"", className];
  }
  
  //convert file data to NSString
  NSData *myData = [NSData dataWithContentsOfFile:filePath];
  NSString *classImplementationString = [[NSString alloc] initWithData:myData encoding:NSASCIIStringEncoding];
  
  //
  NSString *drawRectImplementationString = [self drawRectImplementationStringFromClassImplementationString:classImplementationString];

  return drawRectImplementationString;
}

+ (NSString *)drawRectImplementationStringFromClassImplementationString:(NSString*)classImplementationString{
  
  NSString *preDrawRect;
  NSString *postDrawRect;
  NSScanner *scanner = [NSScanner scannerWithString:classImplementationString];
  [scanner scanUpToString:kDrawRectImplementationString intoString:&preDrawRect];
  
  [scanner scanString:kDrawRectImplementationString intoString:nil];
  postDrawRect = [classImplementationString substringFromIndex:scanner.scanLocation];
  
  NSRange range = [postDrawRect rangeOfString:@"}///"];
  
  if (range.location + 1 >= postDrawRect.length) {
    return @"drawRect implementation not found";
  }
  return [postDrawRect substringToIndex:range.location + 1];
}

@end














//
//  main.m
//  springz
//
//  Created by Thomas R. Koll on 23.03.11.
//  Copyright 2011 Ananasblau.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
  return macruby_main("rb_main.rb", argc, argv);
}

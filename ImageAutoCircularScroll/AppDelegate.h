//
//  AppDelegate.h
//  ImageAutoCircularScroll
//
//  Created by Shankar Mallick on 22/11/16.
//  Copyright © 2016 Shankar_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


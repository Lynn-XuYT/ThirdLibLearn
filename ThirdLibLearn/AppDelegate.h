//
//  AppDelegate.h
//  ThirdLibLearn
//
//  Created by lynn on 2019/3/22.
//  Copyright © 2019 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


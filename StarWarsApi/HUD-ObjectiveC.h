//
//  HUD-ObjectiveC.h
//  StarWarsApi
//
//  Created by Erick on 31/08/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface HUD_ObjectiveC : NSObject

+(void)showProgressHUDView:(UIView*)view;
+(void)hidenProgressHUDView:(UIView*)view;

@end

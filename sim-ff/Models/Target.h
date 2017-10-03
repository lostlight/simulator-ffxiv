//
//  Target.h
//  sim-ff
//
//  Created by Nico, Carla on 29/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target : NSObject

@property (nonatomic, strong) NSMutableDictionary* targetModifiers;
@property (nonatomic, strong) NSMutableDictionary* targetDOTs; //needs base spell id, owner (so they can overwrte it), and should contain every tick plus be 'resolved' if 'time' is past their tick ? player. abilityname. tickTime tickDamage (if tickTime == timer then do the damage, when overwriting remove all ticks for this ability and add the new ticks




@end

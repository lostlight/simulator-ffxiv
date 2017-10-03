//
//  FightSimulator.m
//  sim-ff
//
//  Created by Nico, Carla on 29/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import "FightSimulator.h"
#import "SimulatedPlayer.h"
#import "Action.h"
#import "Target.h"

@interface FightSimulator()

@end


@implementation FightSimulator

NSArray * group; //will have a list of simulated players
SimulatedPlayer* simulatedPlayer;

//group //for now let's not do a group, just a player

-  (void) runSimulationFor: (int) duration
{
    int timer = 0;
    Target *target = [[Target alloc] init];
    _totalDamage = 0;

    //ignorings whatever used out of combat now.
    while (timer < duration)
    {
        //as these will be in order, if we want someone to get buffs for sure from the others, just put them last. but it will probably work anyway cause
        for (SimulatedPlayer* sp in group)
        {
            Action* action = sp.baseRotation[sp.baseRotationCurrentIndex];
            if ([sp isActionReady: action forTime: timer])
            {
                if (action.isOffGCD && sp.nextOGCDActionTime <= timer)
                {
                    //can execute this action now
                    _totalDamage += [sp damageFor:action onTarget:target atTime: timer];
                }
                else if (sp.nextGCDActionTime <= timer )
                {
                    _totalDamage += [sp damageFor:action onTarget:target atTime: timer]; //aero 3 has after cast damage + dot
                    if (action.hasDamageOverTime)
                    {
                        //put the ticks up?
                        // % damage modifiers do not apply to DoTs - https://www.gamefaqs.com/boards/678050-final-fantasy-xiv-online-a-realm-reborn/66884436
                        // damage-type resistance down debuffs do not affect DoT potency at all - https://www.reddit.com/r/ffxiv/comments/529ecw/dot_potency_and_damagetype_resistance_debuffs/
                        // Ninjas Trick attack worked of course since it increases all damage.
                        

                    }

                }
            }
        }
        timer++;
    }

    return;
}

@end

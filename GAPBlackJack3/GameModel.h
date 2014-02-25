//
//  GameModel.h
//  BlackJack
//
//  Created by Student on 2/24/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

static NSString *kNotificationGameDidEnd = @"kNotificationGameDidEnd";
static const int kMAX_PLAYER_CARDS = 5;

typedef enum : int{
    kGameStagePlayer,
    kGameStageDealer,
    kGameStateGameOver
}kGameStage;

@interface GameModel : NSObject

@property (nonatomic) kGameStage gameStage;

-(void) dealNewHand;
-(void) updateGameStage;
-(PlayingCard*) drawDealerCard;
-(PlayingCard*) drawPlayerCard;
-(PlayingCard*) lastDealerCard;
-(PlayingCard*) lastPlayerCard;
-(PlayingCard*) playerCardAtIndex:(int) index;
-(PlayingCard*) dealerCardAtIndex:(int) index;


@end

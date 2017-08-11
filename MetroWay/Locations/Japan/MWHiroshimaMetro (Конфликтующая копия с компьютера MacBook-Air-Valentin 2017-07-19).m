//
//  MWHiroshimaMetro.m
//  MetroWay
//
//  Created by Valentin Ozerov on 01.06.15.
//  Copyright (c) 2015 Valentin Ozerov. All rights reserved.
//

#import "MWHiroshimaMetro.h"
#import "MWHaul.h"
#import "MWDrawTextLine.h"

@implementation MWHiroshimaMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"hiroshima_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"アストラムライン";
    line0001.nameEnglish = @"Astram Line";
    line0001.color = [UIColor colorWithRed:(255/255.0) green:(215/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0001];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];

    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Hondōri
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Hondōri";
    [self.vertices addObject:vertex0001];

    // Kōiki-kōen-mae
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Kōiki-kōen-mae";
    [self.vertices addObject:vertex0002];

    ////////////////////////////////////////////////////////////////
    // Astram Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Hondōri - Kōiki-kōen-mae
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Recife - Joana Bezerra";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Hondōri
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"本通駅";
    station0001.nameEnglish = @"Hondōri";
    station0001.mapLocation = CGPointMake(530, 966.5);
    station0001.geoLocation = CGPointMake(34.393333, 132.456944);

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue-Bold";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 36;
    drawTextLine0001.degrees = -45;
    drawTextLine0001.origin = CGPointMake(203, 272);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 300;
    [edge0001.elements addObject:haul0001];

    // Добавляем станцию Kenchō-mae
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"県庁前駅";
    station0002.nameEnglish = @"Kenchō-mae";
    station0002.mapLocation = CGPointMake(541, 929.5);
    station0002.geoLocation = CGPointMake(34.396944, 132.458333);

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1100;
    [edge0001.elements addObject:haul0002];

    // Добавляем станцию Jōhoku
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"城北駅";
    station0003.nameEnglish = @"Jōhoku";
    station0003.mapLocation = CGPointMake(547, 837);
    station0003.geoLocation = CGPointMake(34.4053, 132.4588);

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 300;
    [edge0001.elements addObject:haul0003];

    // Добавляем станцию Shin-Hakushima
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"新白島駅";
    station0004.nameEnglish = @"Shin-Hakushima";
    station0004.mapLocation = CGPointMake(561, 811.5);
    station0004.geoLocation = CGPointMake(34.408056, 132.46075);

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    //    haul0004.length = 1302;
    [edge0001.elements addObject:haul0004];

    // Добавляем станцию Hakushima
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"白島駅";
    station0005.nameEnglish = @"Hakushima";
    station0005.mapLocation = CGPointMake(581.5, 776);
    station0005.geoLocation = CGPointMake(34.411111, 132.462778);

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    //    haul0005.length = 1302;
    [edge0001.elements addObject:haul0005];

    // Добавляем станцию Ushita
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"牛田駅 (ビッグウェーブ前)";
    station0006.nameEnglish = @"Ushita";
    station0006.mapLocation = CGPointMake(598.5, 709);
    station0006.geoLocation = CGPointMake(34.4175, 132.464722);

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    //    haul0006.length = 1302;
    [edge0001.elements addObject:haul0006];

    // Добавляем станцию Fudōin-mae
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"不動院前駅 (比治山大学前)";
    station0007.nameEnglish = @"Fudōin-mae";
    station0007.mapLocation = CGPointMake(638, 609);
    station0007.geoLocation = CGPointMake(34.427, 132.4692);

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    //    haul0007.length = 1302;
    [edge0001.elements addObject:haul0007];

    // Добавляем станцию Gion-shinbashi-kita
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"祇園新橋北駅";
    station0008.nameEnglish = @"Gion-shinbashi-kita";
    station0008.mapLocation = CGPointMake(653.5, 518.5);
    station0008.geoLocation = CGPointMake(34.435, 132.4708);
    
    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    //    haul0008.length = 1302;
    [edge0001.elements addObject:haul0008];

    // Добавляем станцию Nishihara
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"西原駅";
    station0009.nameEnglish = @"Nishihara";
    station0009.mapLocation = CGPointMake(688.5, 433);
    station0009.geoLocation = CGPointMake(34.443056, 132.474722);
    
    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    //    haul0009.length = 1302;
    [edge0001.elements addObject:haul0009];

    // Добавляем станцию Nakasuji
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0001.elements addObject:station0010];
    
    station0010.nameOriginal = @"中筋駅";
    station0010.nameEnglish = @"Nakasuji";
    station0010.mapLocation = CGPointMake(706.5, 342.5);
    station0010.geoLocation = CGPointMake(34.4517, 132.4768);
    
    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    //    haul0010.length = 1302;
    [edge0001.elements addObject:haul0010];

    // Добавляем станцию Furuichi
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0001.elements addObject:station0011];
    
    station0011.nameOriginal = @"古市駅";
    station0011.nameEnglish = @"Furuichi";
    station0011.mapLocation = CGPointMake(693, 276);
    station0011.geoLocation = CGPointMake(34.457778, 132.475278);

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    //    haul0011.length = 1302;
    [edge0001.elements addObject:haul0011];
    
    // Добавляем станцию Ōmachi
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0001.elements addObject:station0012];
    
    station0012.nameOriginal = @"大町駅";
    station0012.nameEnglish = @"Ōmachi";
    station0012.mapLocation = CGPointMake(650.5, 233.5);
    station0012.geoLocation = CGPointMake(34.461389, 132.470556);

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    //    haul0012.length = 1302;
    [edge0001.elements addObject:haul0012];

    // Добавляем станцию Bishamondai
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0001.elements addObject:station0013];

    station0013.nameOriginal = @"毘沙門台駅";
    station0013.nameEnglish = @"Bishamondai";
    station0013.mapLocation = CGPointMake(583.5, 149.5);
    station0013.geoLocation = CGPointMake(34.4693, 132.4626);
    
    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    //    haul0013.length = 1302;
    [edge0001.elements addObject:haul0013];

    // Добавляем станцию Yasuhigashi
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0001.elements addObject:station0014];
    
    station0014.nameOriginal = @"安東駅 (安田女子大学前)";
    station0014.nameEnglish = @"Yasuhigashi";
    station0014.mapLocation = CGPointMake(497, 89);
    station0014.geoLocation = CGPointMake(34.475, 132.453);
    
    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    //    haul0014.length = 1302;
    [edge0001.elements addObject:haul0014];

    // Добавляем станцию Kamiyasu
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0001.elements addObject:station0015];
    
    station0015.nameOriginal = @"上安駅 (動物公園口)";
    station0015.nameEnglish = @"Kamiyasu";
    station0015.mapLocation = CGPointMake(422.5, 82);
    station0015.geoLocation = CGPointMake(34.4757, 132.4449);
    
    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    //    haul0015.length = 1302;
    [edge0001.elements addObject:haul0015];

    // Добавляем станцию Takatori
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0001.elements addObject:station0016];
    
    station0016.nameOriginal = @"高取駅";
    station0016.nameEnglish = @"Takatori";
    station0016.mapLocation = CGPointMake(361.5, 88.5);
    station0016.geoLocation = CGPointMake(34.4753, 132.4383);
    
    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    //    haul0016.length = 1302;
    [edge0001.elements addObject:haul0016];

    // Добавляем станцию Chōrakuji
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0001.elements addObject:station0017];
    
    station0017.nameOriginal = @"長楽寺駅 (交通科学館前)";
    station0017.nameEnglish = @"Chōrakuji";
    station0017.mapLocation = CGPointMake(300, 112);
    station0017.geoLocation = CGPointMake(34.4727, 132.431);
    
    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    //    haul0017.length = 1302;
    [edge0001.elements addObject:haul0017];

    // Добавляем станцию Tomo
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0001.elements addObject:station0018];

    station0018.nameOriginal = @"伴駅 (広陵学園前)";
    station0018.nameEnglish = @"Tomo";
    station0018.mapLocation = CGPointMake(194.5, 143.5);
    station0018.geoLocation = CGPointMake(34.4699, 132.4198);
    
    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    //    haul0018.length = 1302;
    [edge0001.elements addObject:haul0018];

    // Добавляем станцию Ōbara
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0001.elements addObject:station0019];
    
    station0019.nameOriginal = @"大原駅";
    station0019.nameEnglish = @"Ōbara";
    station0019.mapLocation = CGPointMake(137, 217);
    station0019.geoLocation = CGPointMake(34.463056, 132.412778);
    
    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    //    haul0019.length = 1302;
    [edge0001.elements addObject:haul0019];

    // Добавляем станцию Tomo-chūō
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0001.elements addObject:station0020];
    
    station0020.nameOriginal = @"伴中央駅";
    station0020.nameEnglish = @"Tomo-chūō";
    station0020.mapLocation = CGPointMake(72, 295.5);
    station0020.geoLocation = CGPointMake(34.4556, 132.4051);
    
    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    //    haul0020.length = 1302;
    [edge0001.elements addObject:haul0020];

    // Добавляем станцию Ōzuka
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0001.elements addObject:station0021];

    station0021.nameOriginal = @"大塚駅 (市立大学口)";
    station0021.nameEnglish = @"Ōzuka";
    station0021.mapLocation = CGPointMake(49.5, 450);
    station0021.geoLocation = CGPointMake(34.441389, 132.402778);
    
    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    //    haul0021.length = 1302;
    [edge0001.elements addObject:haul0021];

    // Добавляем станцию Kōiki-kōen-mae
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0001.elements addObject:station0022];
    
    station0022.nameOriginal = @"広域公園前駅（修道大学前)";
    station0022.nameEnglish = @"Kōiki-kōen-mae";
    station0022.mapLocation = CGPointMake(26.5, 516);
    station0022.geoLocation = CGPointMake(34.4354, 132.4003);

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    return self;
}
    
@end

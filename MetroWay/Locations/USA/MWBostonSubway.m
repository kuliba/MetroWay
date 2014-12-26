//
//  MMBostonRapidTransitAndKeyBus.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 12.10.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWBostonSubway.h"

@implementation MWBostonSubway

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"boston_subway";

    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Red Line
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Red Line";
    line0001.color = [UIColor colorWithRed:(225/255.0) green:(39/255.0) blue:(38/255.0) alpha:1];
    [self.lines addObject:line0001];

    // 2. Mattapan Line
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Mattapan Line";
    line0002.color = [UIColor colorWithRed:(225/255.0) green:(39/255.0) blue:(38/255.0) alpha:1];
    [self.lines addObject:line0002];

    // 3. Orange Line
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"Orange Line";
    line0003.color = [UIColor colorWithRed:(241/255.0) green:(139/255.0) blue:(33/255.0) alpha:1];
    [self.lines addObject:line0003];

    // 4. Blue Line
    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"Blue Line";
    line0004.color = [UIColor colorWithRed:(0/255.0) green:(124/255.0) blue:(195/255.0) alpha:1];
    [self.lines addObject:line0004];

    // 5. Silver Line SL1
    MWLine *line0005 = [[MWLine alloc] init];
    line0005.identifier = @"line0005";
    line0005.nameOriginal = @"Silver Line SL1";
    line0005.color = [UIColor colorWithRed:(125/255.0) green:(134/255.0) blue:(140/255.0) alpha:1];
    [self.lines addObject:line0005];

    // 6. Silver Line SL2
    MWLine *line0006 = [[MWLine alloc] init];
    line0006.identifier = @"line0006";
    line0006.nameOriginal = @"Silver Line SL2";
    line0006.color = [UIColor colorWithRed:(125/255.0) green:(134/255.0) blue:(140/255.0) alpha:1];
    [self.lines addObject:line0006];

    // 7. Silver Line SL4
    MWLine *line0007 = [[MWLine alloc] init];
    line0007.identifier = @"line0007";
    line0007.nameOriginal = @"Silver Line SL4";
    line0007.color = [UIColor colorWithRed:(125/255.0) green:(134/255.0) blue:(140/255.0) alpha:1];
    [self.lines addObject:line0007];

    // 8. Silver Line SL5
    MWLine *line0008 = [[MWLine alloc] init];
    line0008.identifier = @"line0008";
    line0008.nameOriginal = @"Silver Line SL5";
    line0008.color = [UIColor colorWithRed:(125/255.0) green:(134/255.0) blue:(140/255.0) alpha:1];
    [self.lines addObject:line0008];

    // 9. Green Line В
    MWLine *line0009 = [[MWLine alloc] init];
    line0009.identifier = @"line0009";
    line0009.nameOriginal = @"Green Line B";
    line0009.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0009];
 
    // 10. Green Line С
    MWLine *line0010 = [[MWLine alloc] init];
    line0010.identifier = @"line0010";
    line0010.nameOriginal = @"Green Line С";
    line0010.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0010];

    // 11. Green Line D
    MWLine *line0011 = [[MWLine alloc] init];
    line0011.identifier = @"line0011";
    line0011.nameOriginal = @"Green Line D";
    line0011.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0011];

    // 12. Green Line E
    MWLine *line0012 = [[MWLine alloc] init];
    line0012.identifier = @"line0012";
    line0012.nameOriginal = @"Green Line E";
    line0012.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0012];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0007];
    [self.drawLinesOrder addObject:line0008];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0009];
    [self.drawLinesOrder addObject:line0010];
    [self.drawLinesOrder addObject:line0011];
    [self.drawLinesOrder addObject:line0012];
    [self.drawLinesOrder addObject:line0004];
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0005];
    [self.drawLinesOrder addObject:line0006];

    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Alewife
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Alewife";
    [self.vertices addObject:vertex0001];

    // Park St
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Park St";
    [self.vertices addObject:vertex0002];

    // Downtown Crossing
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Downtown Crossing";
    [self.vertices addObject:vertex0003];

    // South Station
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: South Station";
    [self.vertices addObject:vertex0004];

    // JFK/UMass
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: JFK/UMass";
    [self.vertices addObject:vertex0005];

    // Braintree
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Braintree";
    [self.vertices addObject:vertex0006];

    // Ashmont
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Ashmont";
    [self.vertices addObject:vertex0007];

    // Mattapan
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Mattapan";
    [self.vertices addObject:vertex0008];

    // Forest Hills
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Forest Hills";
    [self.vertices addObject:vertex0009];

    // Tufts Medical Center
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Tufts Medical Center";
    [self.vertices addObject:vertex0010];

    // Chinatown
    MWVertex *vertex0011 = [[MWVertex alloc] init];
    vertex0011.identifier = @"vertex0011";
    vertex0011.developmentName = @"Вершина: Chinatown";
    [self.vertices addObject:vertex0011];

    // State
    MWVertex *vertex0012 = [[MWVertex alloc] init];
    vertex0012.identifier = @"vertex0012";
    vertex0012.developmentName = @"Вершина: State";
    [self.vertices addObject:vertex0012];

    // Haymarket
    MWVertex *vertex0013 = [[MWVertex alloc] init];
    vertex0013.identifier = @"vertex0013";
    vertex0013.developmentName = @"Вершина: Haymarket";
    [self.vertices addObject:vertex0013];

    // North Station
    MWVertex *vertex0014 = [[MWVertex alloc] init];
    vertex0014.identifier = @"vertex0014";
    vertex0014.developmentName = @"Вершина: North Station";
    [self.vertices addObject:vertex0014];

    // Oak Grove
    MWVertex *vertex0015 = [[MWVertex alloc] init];
    vertex0015.identifier = @"vertex0015";
    vertex0015.developmentName = @"Вершина: Oak Grove";
    [self.vertices addObject:vertex0015];

    // Bowdoin
    MWVertex *vertex0016 = [[MWVertex alloc] init];
    vertex0016.identifier = @"vertex0016";
    vertex0016.developmentName = @"Вершина: Bowdoin";
    [self.vertices addObject:vertex0016];

    // Government Center
    MWVertex *vertex0017 = [[MWVertex alloc] init];
    vertex0017.identifier = @"vertex0017";
    vertex0017.developmentName = @"Вершина: Government Center";
    [self.vertices addObject:vertex0017];

    // Wonderland
    MWVertex *vertex0018 = [[MWVertex alloc] init];
    vertex0018.identifier = @"vertex0018";
    vertex0018.developmentName = @"Вершина: Wonderland";
    [self.vertices addObject:vertex0018];

    // Terminal A
    MWVertex *vertex0019 = [[MWVertex alloc] init];
    vertex0019.identifier = @"vertex0019";
    vertex0019.developmentName = @"Вершина: Terminal A";
    [self.vertices addObject:vertex0019];

    // Silver Line Way
    MWVertex *vertex0020 = [[MWVertex alloc] init];
    vertex0020.identifier = @"vertex0020";
    vertex0020.developmentName = @"Вершина: Silver Line Way";
    [self.vertices addObject:vertex0020];

    // Tide St
    MWVertex *vertex0021 = [[MWVertex alloc] init];
    vertex0021.identifier = @"vertex0021";
    vertex0021.developmentName = @"Вершина: Tide St";
    [self.vertices addObject:vertex0021];

    // Black Falcon Ave
    MWVertex *vertex0022 = [[MWVertex alloc] init];
    vertex0022.identifier = @"vertex0022";
    vertex0022.developmentName = @"Вершина: Black Falcon Ave";
    [self.vertices addObject:vertex0022];

    // World Trade Ctr
    MWVertex *vertex0023 = [[MWVertex alloc] init];
    vertex0023.identifier = @"vertex0023";
    vertex0023.developmentName = @"Вершина: World Trade Ctr";
    [self.vertices addObject:vertex0023];
    
    // Courthouse
    MWVertex *vertex0024 = [[MWVertex alloc] init];
    vertex0024.identifier = @"vertex0024";
    vertex0024.developmentName = @"Вершина: Courthouse";
    [self.vertices addObject:vertex0024];

    // Boylston
    MWVertex *vertex0025 = [[MWVertex alloc] init];
    vertex0025.identifier = @"vertex0025";
    vertex0025.developmentName = @"Вершина: Boylston";
    [self.vertices addObject:vertex0025];

    // Herald St
    MWVertex *vertex0026 = [[MWVertex alloc] init];
    vertex0026.identifier = @"vertex0026";
    vertex0026.developmentName = @"Вершина: Herald St";
    [self.vertices addObject:vertex0026];

    // East Berkeley St
    MWVertex *vertex0027 = [[MWVertex alloc] init];
    vertex0027.identifier = @"vertex0027";
    vertex0027.developmentName = @"Вершина: East Berkeley St";
    [self.vertices addObject:vertex0027];

    // Union Park St
    MWVertex *vertex0028 = [[MWVertex alloc] init];
    vertex0028.identifier = @"vertex0028";
    vertex0028.developmentName = @"Вершина: Union Park St";
    [self.vertices addObject:vertex0028];

    // Newton St
    MWVertex *vertex0029 = [[MWVertex alloc] init];
    vertex0029.identifier = @"vertex0029";
    vertex0029.developmentName = @"Вершина: Newton St";
    [self.vertices addObject:vertex0029];

    // Worcester Sq
    MWVertex *vertex0030 = [[MWVertex alloc] init];
    vertex0030.identifier = @"vertex0030";
    vertex0030.developmentName = @"Вершина: Worcester Sq";
    [self.vertices addObject:vertex0030];

    // Mass. Ave
    MWVertex *vertex0031 = [[MWVertex alloc] init];
    vertex0031.identifier = @"vertex0031";
    vertex0031.developmentName = @"Вершина: Mass. Ave";
    [self.vertices addObject:vertex0031];

    // Lenox St
    MWVertex *vertex0032 = [[MWVertex alloc] init];
    vertex0032.identifier = @"vertex0032";
    vertex0032.developmentName = @"Вершина: Lenox St";
    [self.vertices addObject:vertex0032];

    // Melnea Cass
    MWVertex *vertex0033 = [[MWVertex alloc] init];
    vertex0033.identifier = @"vertex0033";
    vertex0033.developmentName = @"Вершина: Melnea Cass";
    [self.vertices addObject:vertex0033];

    // Dudley Sq
    MWVertex *vertex0034 = [[MWVertex alloc] init];
    vertex0034.identifier = @"vertex0034";
    vertex0034.developmentName = @"Вершина: Dudley Sq";
    [self.vertices addObject:vertex0034];

    // Lechmere
    MWVertex *vertex0035 = [[MWVertex alloc] init];
    vertex0035.identifier = @"vertex0035";
    vertex0035.developmentName = @"Вершина: Lechmere";
    [self.vertices addObject:vertex0035];

    // Arlington
    MWVertex *vertex0036 = [[MWVertex alloc] init];
    vertex0036.identifier = @"vertex0036";
    vertex0036.developmentName = @"Вершина: Arlington";
    [self.vertices addObject:vertex0036];

    // Copley
    MWVertex *vertex0037 = [[MWVertex alloc] init];
    vertex0037.identifier = @"vertex0037";
    vertex0037.developmentName = @"Вершина: Copley";
    [self.vertices addObject:vertex0037];

    // Heath
    MWVertex *vertex0038 = [[MWVertex alloc] init];
    vertex0038.identifier = @"vertex0038";
    vertex0038.developmentName = @"Вершина: Heath";
    [self.vertices addObject:vertex0038];

    // Hynes Convention Ctr
    MWVertex *vertex0039 = [[MWVertex alloc] init];
    vertex0039.identifier = @"vertex0039";
    vertex0039.developmentName = @"Вершина: Hynes Convention Ctr";
    [self.vertices addObject:vertex0039];

    // Kenmore
    MWVertex *vertex0040 = [[MWVertex alloc] init];
    vertex0040.identifier = @"vertex0040";
    vertex0040.developmentName = @"Вершина: Kenmore";
    [self.vertices addObject:vertex0040];

    // Boston College
    MWVertex *vertex0041 = [[MWVertex alloc] init];
    vertex0041.identifier = @"vertex0041";
    vertex0041.developmentName = @"Вершина: Boston College";
    [self.vertices addObject:vertex0041];

    // Cleveland Circle
    MWVertex *vertex0042 = [[MWVertex alloc] init];
    vertex0042.identifier = @"vertex0042";
    vertex0042.developmentName = @"Вершина: Cleveland Circle";
    [self.vertices addObject:vertex0042];

    // Riverside
    MWVertex *vertex0043 = [[MWVertex alloc] init];
    vertex0043.identifier = @"vertex0043";
    vertex0043.developmentName = @"Вершина: Riverside";
    [self.vertices addObject:vertex0043];

    ////////////////////////////////////////////////////////////////
    // 1. Red Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Alewife - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Alewife - Park St";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Alewife
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Alewife";
    station0001.geoLocation = CGPointMake(42.3964, -71.142);
    station0001.mapLocation = CGPointMake(1253.5, 461.5);

    /*
    MMDrawTextLine *drawTextLine0331 = [[MMDrawTextLine alloc] init];
    drawTextLine0331.text = @"Longwood Medical Area";
    drawTextLine0331.fontName = @"Baskerville";
    drawTextLine0331.fontColor = [UIColor blackColor];
    drawTextLine0331.fontSize = 40;
    drawTextLine0331.origin = CGPointMake(1814, 2654);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0331]; */
    
    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1559;
    [edge0001.elements addObject:haul0001];

    // Добавляем станцию Davis
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Davis";
    station0002.geoLocation = CGPointMake(42.397, -71.123);
    station0002.mapLocation = CGPointMake(1369.5, 577.5);

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1132;
    [edge0001.elements addObject:haul0002];

    // Добавляем станцию Porter
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Porter";
    station0003.geoLocation = CGPointMake(42.388333, -71.119028);
    station0003.mapLocation = CGPointMake(1485.5, 694.5);

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1668;
    [edge0001.elements addObject:haul0003];

    // Добавляем станцию Harvard
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Harvard";
    station0004.geoLocation = CGPointMake(42.3734, -71.1193);
    station0004.mapLocation = CGPointMake(1601.5, 809);

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1617;
    [edge0001.elements addObject:haul0004];

    // Добавляем станцию Central
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Central";
    station0005.geoLocation = CGPointMake(42.365, -71.1034);
    station0005.mapLocation = CGPointMake(1717.5, 927);

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1474;
    [edge0001.elements addObject:haul0005];

    // Добавляем станцию Kendall/MIT
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Kendall/MIT";
    station0006.geoLocation = CGPointMake(42.3623, -71.0862);
    station0006.mapLocation = CGPointMake(1833.5, 1043);

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1228;
    [edge0001.elements addObject:haul0006];

    // Добавляем станцию Charles/MGH
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"Charles/MGH";
    station0007.geoLocation = CGPointMake(42.3613, -71.0714);
    station0007.mapLocation = CGPointMake(1972.5, 1182.5);

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 929;
    [edge0001.elements addObject:haul0007];

    // Добавляем станцию Park St
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"Park Street";
    station0008.geoLocation = CGPointMake(42.356389, -71.0625);
    station0008.mapLocation = CGPointMake(2065.5, 1275);
    
    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    // Создаем участок линии Park St - Downtown Crossing
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Park St - Downtown Crossing";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;

    // Добавляем станцию Park St
    [edge0002.elements addObject:station0008];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 193;
    [edge0002.elements addObject:haul0008];

    // Добавляем станцию Downtown Crossing
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"Downtown Crossing";
    station0009.geoLocation = CGPointMake(42.3555, -71.0605);
    station0009.mapLocation = CGPointMake(2202.5, 1412);

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;

    // Создаем участок линии Downtown Crossing - South Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Downtown Crossing - South Station";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;

    // Добавляем станцию Downtown Crossing
    [edge0003.elements addObject:station0009];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 535;
    [edge0003.elements addObject:haul0009];

    // Добавляем станцию South Station
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0003.elements addObject:station0010];
    
    station0010.nameOriginal = @"South Station";
    station0010.geoLocation = CGPointMake(42.35261, -71.05536);
    station0010.mapLocation = CGPointMake(2338, 1549);
    
    // Добавляем вершину
    edge0003.finishVertex = vertex0004;
    
    // Создаем участок линии South Station - JFK/UMass
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: South Station - JFK/UMass";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0001;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0004;

    // Добавляем станцию South Station
    [edge0004.elements addObject:station0010];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1241;
    [edge0004.elements addObject:haul0010];

    // Добавляем станцию Broadway
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0004.elements addObject:station0011];
    
    station0011.nameOriginal = @"Broadway";
    station0011.geoLocation = CGPointMake(42.3429, -71.0572);
    station0011.mapLocation = CGPointMake(2429, 1821);

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 1412;
    [edge0004.elements addObject:haul0011];
    
    // Добавляем станцию Andrew
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0004.elements addObject:station0012];
    
    station0012.nameOriginal = @"Andrew";
    station0012.geoLocation = CGPointMake(42.33019, -71.05712);
    station0012.mapLocation = CGPointMake(2429.5, 1959);
    
    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1229;
    [edge0004.elements addObject:haul0012];

    // Добавляем станцию JFK/UMass
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0004.elements addObject:station0013];
    
    station0013.nameOriginal = @"JFK/UMass";
    station0013.geoLocation = CGPointMake(42.32058, -71.05239);
    station0013.mapLocation = CGPointMake(2429.5, 2093);

    // Добавляем вершину
    edge0004.finishVertex = vertex0005;

    // Создаем участок линии JFK/UMass - Braintree
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: JFK/UMass - Braintree";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0001;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0005;

    // Добавляем станцию JFK/UMass
    [edge0005.elements addObject:station0013];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 5727;
    [edge0005.elements addObject:haul0013];

    // Добавляем станцию North Quincy
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0005.elements addObject:station0014];
    
    station0014.nameOriginal = @"North Quincy";
    station0014.geoLocation = CGPointMake(42.2758, -71.0302);
    station0014.mapLocation = CGPointMake(2648, 2477);

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1428;
    [edge0005.elements addObject:haul0014];

    // Добавляем станцию Wollaston
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0005.elements addObject:station0015];
    
    station0015.nameOriginal = @"Wollaston";
    station0015.geoLocation = CGPointMake(42.265638, -71.01953);
    station0015.mapLocation = CGPointMake(2738.5, 2367.5);

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 2050;
    [edge0005.elements addObject:haul0015];

    // Добавляем станцию Quincy Center
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0005.elements addObject:station0016];
    
    station0016.nameOriginal = @"Quincy Center";
    station0016.geoLocation = CGPointMake(42.250878, -71.004797);
    station0016.mapLocation = CGPointMake(2829.5, 2658);

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 2021;
    [edge0005.elements addObject:haul0016];

    // Добавляем станцию Quincy Adams
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0005.elements addObject:station0017];
    
    station0017.nameOriginal = @"Quincy Adams";
    station0017.geoLocation = CGPointMake(42.232894, -71.008083);
    station0017.mapLocation = CGPointMake(2894, 2753);
    
    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 2979;
    [edge0005.elements addObject:haul0017];

    // Добавляем станцию Braintree
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0005.elements addObject:station0018];
    
    station0018.nameOriginal = @"Braintree";
    station0018.geoLocation = CGPointMake(42.2074, -71.0014);
    station0018.mapLocation = CGPointMake(2895, 2892);
    
    // Добавляем вершину
    edge0005.finishVertex = vertex0006;

    // Создаем участок линии JFK/UMass - Ashmont
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: JFK/UMass - Ashmont";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0001;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0005;
    
    // Добавляем станцию JFK/UMass
    [edge0006.elements addObject:station0013];
    
    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1121;
    [edge0006.elements addObject:haul0018];

    // Добавляем станцию Savin Hill
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0006.elements addObject:station0019];
    
    station0019.nameOriginal = @"Savin Hill";
    station0019.geoLocation = CGPointMake(42.310647, -71.053620);
    station0019.mapLocation = CGPointMake(2303, 2412);

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1575;
    [edge0006.elements addObject:haul0019];

    // Добавляем станцию Fields Corner
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0006.elements addObject:station0020];
    
    station0020.nameOriginal = @"Fields Corner";
    station0020.geoLocation = CGPointMake(42.299820, -71.061565);
    station0020.mapLocation = CGPointMake(2300.5, 2476.5);

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 976;
    [edge0006.elements addObject:haul0020];

    // Добавляем станцию Shawmut
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0006.elements addObject:station0021];
    
    station0021.nameOriginal = @"Shawmut";
    station0021.geoLocation = CGPointMake(42.293135, -71.065738);
    station0021.mapLocation = CGPointMake(2300.5, 2538);

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 995;
    [edge0006.elements addObject:haul0021];

    // Добавляем станцию Ashmont
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0006.elements addObject:station0022];
    
    station0022.nameOriginal = @"Ashmont";
    station0022.geoLocation = CGPointMake(42.2843, -71.0638);
    station0022.mapLocation = CGPointMake(2301, 2599.5);

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;

    ////////////////////////////////////////////////////////////////
    // 2. Mattapan Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Ashmont - Mattapan
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Ashmont - Mattapan";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0002;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0007;
    
    // Добавляем станцию Ashmont
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0007.elements addObject:station0023];
    
    station0023.nameOriginal = @"Ashmont";
    station0023.geoLocation = CGPointMake(42.2843, -71.0638);
    station0023.mapLocation = CGPointMake(2301, 2636.5);

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 583;
    [edge0007.elements addObject:haul0022];

    // Добавляем станцию Cedar Grove
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0007.elements addObject:station0024];
    
    station0024.nameOriginal = @"Cedar Grove";
    station0024.geoLocation = CGPointMake(42.27969, -71.06039);
    station0024.mapLocation = CGPointMake(2300.5, 2702.5);

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 957;
    [edge0007.elements addObject:haul0023];

    // Добавляем станцию Butler
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0007.elements addObject:station0025];
    
    station0025.nameOriginal = @"Butler";
    station0025.geoLocation = CGPointMake(42.272253, -71.062453);
    station0025.mapLocation = CGPointMake(2270, 2768);

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 474;
    [edge0007.elements addObject:haul0024];

    // Добавляем станцию Milton
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0007.elements addObject:station0026];
    
    station0026.nameOriginal = @"Milton";
    station0026.geoLocation = CGPointMake(42.270092, -71.067611);
    station0026.mapLocation = CGPointMake(2199, 2768);
    
    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 481;
    [edge0007.elements addObject:haul0025];

    // Добавляем станцию Central Ave
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0007.elements addObject:station0027];
    
    station0027.nameOriginal = @"Central Avenue";
    station0027.geoLocation = CGPointMake(42.269965, -71.073249);
    station0027.mapLocation = CGPointMake(2128, 2768);

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 851;
    [edge0007.elements addObject:haul0026];

    // Добавляем станцию Valley Rd
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0007.elements addObject:station0028];
    
    station0028.nameOriginal = @"Valley Road";
    station0028.geoLocation = CGPointMake(42.267772, -71.083025);
    station0028.mapLocation = CGPointMake(2057, 2768);

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 366;
    [edge0007.elements addObject:haul0027];

    // Добавляем станцию Capen St
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0007.elements addObject:station0029];
    
    station0029.nameOriginal = @"Capen Street";
    station0029.geoLocation = CGPointMake(42.267622, -71.087436);
    station0029.mapLocation = CGPointMake(1986.5, 2768.5);

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 474;
    [edge0007.elements addObject:haul0028];

    // Добавляем станцию Mattapan
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0007.elements addObject:station0030];
    
    station0030.nameOriginal = @"Mattapan";
    station0030.geoLocation = CGPointMake(42.2675, -71.093056);
    station0030.mapLocation = CGPointMake(1915, 2768.5);

    // Добавляем вершину
    edge0007.finishVertex = vertex0008;

    ////////////////////////////////////////////////////////////////
    // 3. Orange Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Forest Hills - Tufts Medical Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Forest Hills - Tufts Medical Center";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0003;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0009;

    // Добавляем станцию Forest Hills
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0008.elements addObject:station0031];
    
    station0031.nameOriginal = @"Forest Hills";
    station0031.geoLocation = CGPointMake(42.2988, -71.1149);
    station0031.mapLocation = CGPointMake(1163, 2453.5);

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1395;
    [edge0008.elements addObject:haul0029];

    // Добавляем станцию Green St
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0008.elements addObject:station0032];
    
    station0032.nameOriginal = @"Green Street";
    station0032.geoLocation = CGPointMake(42.3102, -71.1078);
    station0032.mapLocation = CGPointMake(1267.5, 2348);

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 835;
    [edge0008.elements addObject:haul0030];

    // Добавляем станцию Stony Brook
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0008.elements addObject:station0033];
    
    station0033.nameOriginal = @"Stony Brook";
    station0033.geoLocation = CGPointMake(42.3172, -71.1043);
    station0033.mapLocation = CGPointMake(1372.5, 2243.5);

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 727;
    [edge0008.elements addObject:haul0031];

    // Добавляем станцию Jackson Sq
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0008.elements addObject:station0034];
    
    station0034.nameOriginal = @"Jackson Square";
    station0034.geoLocation = CGPointMake(42.3229, -71.1);
    station0034.mapLocation = CGPointMake(1437.5, 2138.5);

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 1016;
    [edge0008.elements addObject:haul0032];

    // Добавляем станцию Roxbury Crossing
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0008.elements addObject:station0035];
    
    station0035.nameOriginal = @"Roxbury Crossing";
    station0035.geoLocation = CGPointMake(42.3313, -71.0956);
    station0035.mapLocation = CGPointMake(1581.5, 2033);

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 740;
    [edge0008.elements addObject:haul0033];

    // Добавляем станцию Ruggles
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0008.elements addObject:station0036];
    
    station0036.nameOriginal = @"Ruggles";
    station0036.geoLocation = CGPointMake(42.3362, -71.0895);
    station0036.mapLocation = CGPointMake(1665, 1951);

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 786;
    [edge0008.elements addObject:haul0034];

    // Добавляем станцию Mass. Ave
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0008.elements addObject:station0037];
    
    station0037.nameOriginal = @"Massachusetts Avenue";
    station0037.geoLocation = CGPointMake(42.3416, -71.0833);
    station0037.mapLocation = CGPointMake(1748.5, 1867);

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 917;
    [edge0008.elements addObject:haul0035];

    // Добавляем станцию Back Bay
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0008.elements addObject:station0038];
    
    station0038.nameOriginal = @"Back Bay";
    station0038.geoLocation = CGPointMake(42.3473, -71.0755);
    station0038.mapLocation = CGPointMake(1827, 1789);

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 964;
    [edge0008.elements addObject:haul0036];

    // Добавляем станцию Tufts Medical Center
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0008.elements addObject:station0039];
    
    station0039.nameOriginal = @"Tufts Medical Center";
    station0039.geoLocation = CGPointMake(42.3486, -71.0645);
    station0039.mapLocation = CGPointMake(1915, 1701);

    // Добавляем вершину
    edge0008.finishVertex = vertex0010;

    // Создаем участок линии Tufts Medical Center - Chinatown
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Tufts Medical Center - Chinatown";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0003;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0010;

    // Добавляем станцию Tufts Medical Center
    [edge0009.elements addObject:station0039];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 434;
    [edge0009.elements addObject:haul0037];

    // Добавляем станцию Chinatown
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0009.elements addObject:station0040];
    
    station0040.nameOriginal = @"Chinatown";
    station0040.geoLocation = CGPointMake(42.3522, -71.0627);
    station0040.mapLocation = CGPointMake(2066.5, 1549);

    // Добавляем вершину
    edge0009.finishVertex = vertex0011;

    // Создаем участок линии Chinatown - Downtown Crossing
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Chinatown - Downtown Crossing";
    [self.edges addObject:edge0010];
    
    // Добавляем линию
    edge0010.line = line0003;
    
    // Добавляем вершину
    edge0010.startVertex = vertex0011;

    // Добавляем станцию Chinatown
    [edge0010.elements addObject:station0040];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 421;
    [edge0010.elements addObject:haul0038];
    
    // Добавляем станцию Downtown Crossing
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0010.elements addObject:station0041];
    
    station0041.nameOriginal = @"Downtown Crossing";
    station0041.geoLocation = CGPointMake(42.3555, -71.0605);
    station0041.mapLocation = CGPointMake(2202.5, 1412);
    
    // Добавляем вершину
    edge0010.finishVertex = vertex0003;

    // Создаем участок линии Downtown Crossing - State
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0011 = [[MWEdge alloc] init];
    edge0011.identifier = @"edge0011";
    edge0011.developmentName = @"Ребро: Downtown Crossing - State";
    [self.edges addObject:edge0011];
    
    // Добавляем линию
    edge0011.line = line0003;
    
    // Добавляем вершину
    edge0011.startVertex = vertex0003;

    // Добавляем станцию Downtown Crossing
    [edge0011.elements addObject:station0041];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 436;
    [edge0011.elements addObject:haul0039];

    // Добавляем станцию State
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0011.elements addObject:station0042];
    
    station0042.nameOriginal = @"State";
    station0042.geoLocation = CGPointMake(42.3587, -71.0578);
    station0042.mapLocation = CGPointMake(2270, 1258);
    
    // Добавляем вершину
    edge0011.finishVertex = vertex0012;

    // Создаем участок линии State - Haymarket
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0012 = [[MWEdge alloc] init];
    edge0012.identifier = @"edge0012";
    edge0012.developmentName = @"Ребро: State - Haymarket";
    [self.edges addObject:edge0012];
    
    // Добавляем линию
    edge0012.line = line0003;
    
    // Добавляем вершину
    edge0012.startVertex = vertex0012;

    // Добавляем станцию State
    [edge0012.elements addObject:station0042];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 514;
    [edge0012.elements addObject:haul0040];

    // Добавляем станцию Haymarket
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0012.elements addObject:station0043];
    
    station0043.nameOriginal = @"Haymarket";
    station0043.geoLocation = CGPointMake(42.3633, -71.0582);
    station0043.mapLocation = CGPointMake(2269.5, 1071);

    // Добавляем вершину
    edge0012.finishVertex = vertex0013;

    // Создаем участок линии Haymarket - North Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0013 = [[MWEdge alloc] init];
    edge0013.identifier = @"edge0013";
    edge0013.developmentName = @"Ребро: Haymarket - North Station";
    [self.edges addObject:edge0013];
    
    // Добавляем линию
    edge0013.line = line0003;
    
    // Добавляем вершину
    edge0013.startVertex = vertex0013;

    // Добавляем станцию Haymarket
    [edge0013.elements addObject:station0043];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 351;
    [edge0013.elements addObject:haul0041];

    // Добавляем станцию North Station
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0013.elements addObject:station0044];
    
    station0044.nameOriginal = @"North Station";
    station0044.geoLocation = CGPointMake(42.3657, -71.061);
    station0044.mapLocation = CGPointMake(2269.5, 906.5);

    // Добавляем вершину
    edge0013.finishVertex = vertex0014;

    // Создаем участок линии North Station - Oak Grove
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0014 = [[MWEdge alloc] init];
    edge0014.identifier = @"edge0014";
    edge0014.developmentName = @"Ребро: North Station - Oak Grove";
    [self.edges addObject:edge0014];
    
    // Добавляем линию
    edge0014.line = line0003;
    
    // Добавляем вершину
    edge0014.startVertex = vertex0014;

    // Добавляем станцию North Station
    [edge0014.elements addObject:station0044];

    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 1194;
    [edge0014.elements addObject:haul0042];

    // Добавляем станцию Community College
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0014.elements addObject:station0045];
    
    station0045.nameOriginal = @"Community College";
    station0045.geoLocation = CGPointMake(42.3737, -71.0702);
    station0045.mapLocation = CGPointMake(2270, 691);

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 1372;
    [edge0014.elements addObject:haul0043];

    // Добавляем станцию Sullivan Sq
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0014.elements addObject:station0046];
    
    station0046.nameOriginal = @"Sullivan Square";
    station0046.geoLocation = CGPointMake(42.384031, -71.07697);
    station0046.mapLocation = CGPointMake(2270, 601.5);

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 926;
    [edge0014.elements addObject:haul0044];

    // Добавляем станцию Assembly
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0014.elements addObject:station0047];
    
    station0047.nameOriginal = @"Assembly";
    station0047.geoLocation = CGPointMake(42.392356, -71.077333);
    station0047.mapLocation = CGPointMake(2269.5, 512);

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 1064;
    [edge0014.elements addObject:haul0045];

    // Добавляем станцию Wellington
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0014.elements addObject:station0048];
    
    station0048.nameOriginal = @"Wellington";
    station0048.geoLocation = CGPointMake(42.401907, -71.077096);
    station0048.mapLocation = CGPointMake(2269.5, 422.5);

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 2786;
    [edge0014.elements addObject:haul0046];

    // Добавляем станцию Malden Center
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0014.elements addObject:station0049];
    
    station0049.nameOriginal = @"Malden Center";
    station0049.geoLocation = CGPointMake(42.426715, -71.074349);
    station0049.mapLocation = CGPointMake(2269.5, 333);
    
    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 1174;
    [edge0014.elements addObject:haul0047];

    // Добавляем станцию Oak Grove
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0014.elements addObject:station0050];
    
    station0050.nameOriginal = @"Oak Grove";
    station0050.geoLocation = CGPointMake(42.436942, -71.070889);
    station0050.mapLocation = CGPointMake(2269.5, 243.5);

    // Добавляем вершину
    edge0014.finishVertex = vertex0015;

    ////////////////////////////////////////////////////////////////
    // 4. Blue Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Bowdoin - Government Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0015 = [[MWEdge alloc] init];
    edge0015.identifier = @"edge0015";
    edge0015.developmentName = @"Ребро: Bowdoin - Government Center";
    [self.edges addObject:edge0015];
    
    // Добавляем линию
    edge0015.line = line0004;
    
    // Добавляем вершину
    edge0015.startVertex = vertex0016;

    // Добавляем станцию Bowdoin
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0015.elements addObject:station0051];
    
    station0051.nameOriginal = @"Bowdoin";
    station0051.geoLocation = CGPointMake(42.3614, -71.0622);
    station0051.mapLocation = CGPointMake(2073, 1078.5);

    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 329;
    [edge0015.elements addObject:haul0048];

    // Добавляем станцию Government Center
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0015.elements addObject:station0052];
    
    station0052.nameOriginal = @"Government Center";
    station0052.geoLocation = CGPointMake(42.359444, -71.059444);
    station0052.mapLocation = CGPointMake(2167.5, 1172.5);

    // Добавляем вершину
    edge0015.finishVertex = vertex0017;

    // Создаем участок линии Government Center - State
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0016 = [[MWEdge alloc] init];
    edge0016.identifier = @"edge0016";
    edge0016.developmentName = @"Ребро: Government Center - State";
    [self.edges addObject:edge0016];
    
    // Добавляем линию
    edge0016.line = line0004;
    
    // Добавляем вершину
    edge0016.startVertex = vertex0017;

    // Добавляем станцию Government Center
    [edge0016.elements addObject:station0052];

    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 163;
    [edge0016.elements addObject:haul0049];

    // Добавляем станцию State
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0016.elements addObject:station0053];
    
    station0053.nameOriginal = @"State";
    station0053.geoLocation = CGPointMake(42.3587, -71.0578);
    station0053.mapLocation = CGPointMake(2270, 1258);

    // Добавляем вершину
    edge0016.finishVertex = vertex0012;

    // Создаем участок линии Government State - Wonderland
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0017 = [[MWEdge alloc] init];
    edge0017.identifier = @"edge0017";
    edge0017.developmentName = @"Ребро: Government State - Wonderland";
    [self.edges addObject:edge0017];
    
    // Добавляем линию
    edge0017.line = line0004;
    
    // Добавляем вершину
    edge0017.startVertex = vertex0012;

    // Добавляем станцию State
    [edge0017.elements addObject:station0053];

    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 397;
    [edge0017.elements addObject:haul0050];

    // Добавляем станцию Aquarium
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0017.elements addObject:station0054];
    
    station0054.nameOriginal = @"Aquarium";
    station0054.geoLocation = CGPointMake(42.3593, -71.0531);
    station0054.mapLocation = CGPointMake(2395, 1149.5);

    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 1666;
    [edge0017.elements addObject:haul0051];

    // Добавляем станцию Maverick
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0017.elements addObject:station0055];
    
    station0055.nameOriginal = @"Maverick";
    station0055.geoLocation = CGPointMake(42.3691, -71.0395);
    station0055.mapLocation = CGPointMake(2585, 961);

    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 991;
    [edge0017.elements addObject:haul0052];

    // Добавляем станцию Airport
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0017.elements addObject:station0056];
    
    station0056.nameOriginal = @"Airport";
    station0056.geoLocation = CGPointMake(42.374374, -71.030243);
    station0056.mapLocation = CGPointMake(2653.5, 891.5);

    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 846;
    [edge0017.elements addObject:haul0053];

    // Добавляем станцию Wood Island
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0017.elements addObject:station0057];
    
    station0057.nameOriginal = @"Wood Island";
    station0057.geoLocation = CGPointMake(42.3797, -71.023);
    station0057.mapLocation = CGPointMake(2724.5, 820.5);

    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 1812;
    [edge0017.elements addObject:haul0054];

    // Добавляем станцию Orient Heights
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0017.elements addObject:station0058];
    
    station0058.nameOriginal = @"Orient Heights";
    station0058.geoLocation = CGPointMake(42.3871, -71.0042);
    station0058.mapLocation = CGPointMake(2811.5, 733.5);

    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 702;
    [edge0017.elements addObject:haul0055];

    // Добавляем станцию Suffolk Downs
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0017.elements addObject:station0059];
    
    station0059.nameOriginal = @"Suffolk Downs";
    station0059.geoLocation = CGPointMake(42.3904, -70.997);
    station0059.mapLocation = CGPointMake(2899, 646);

    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 878;
    [edge0017.elements addObject:haul0056];

    // Добавляем станцию Beachmont
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0017.elements addObject:station0060];
    
    station0060.nameOriginal = @"Beachmont";
    station0060.geoLocation = CGPointMake(42.3975, -70.9922);
    station0060.mapLocation = CGPointMake(2986, 559);

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 1158;
    [edge0017.elements addObject:haul0057];

    // Добавляем станцию Revere Beach
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0017.elements addObject:station0061];
    
    station0061.nameOriginal = @"Revere Beach";
    station0061.geoLocation = CGPointMake(42.4078, -70.9926);
    station0061.mapLocation = CGPointMake(3071.5, 474);

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 638;
    [edge0017.elements addObject:haul0058];

    // Добавляем станцию Wonderland
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0017.elements addObject:station0062];
    
    station0062.nameOriginal = @"Wonderland";
    station0062.geoLocation = CGPointMake(42.4135, -70.9918);
    station0062.mapLocation = CGPointMake(3175.5, 370);

    // Добавляем вершину
    edge0017.finishVertex = vertex0018;

    ////////////////////////////////////////////////////////////////
    // 5. Silver Line SL1
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Terminal A - Silver Line Way
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0018 = [[MWEdge alloc] init];
    edge0018.identifier = @"edge0018";
    edge0018.developmentName = @"Ребро: Terminal A - Silver Line Way";
    [self.edges addObject:edge0018];
    
    // Добавляем линию
    edge0018.line = line0005;
    
    // Добавляем вершину
    edge0018.startVertex = vertex0019;
    
    // Добавляем станцию Terminal A
    MWStation *station0063 = [[MWStation alloc] init];
    station0063.identifier = @"station0063";
    [edge0018.elements addObject:station0063];
    
    station0063.nameOriginal = @"Logan Airport Term. A";
    edge0018.directionFromStation = station0063;
    station0063.geoLocation = CGPointMake(42.364665, -71.020897);
    station0063.mapLocation = CGPointMake(2861.5, 1164);

    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 365;
    [edge0018.elements addObject:haul0059];

    // Добавляем станцию Terminal B West
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0018.elements addObject:station0064];
    
    station0064.nameOriginal = @"Logan Airport Term. B West";
    station0064.geoLocation = CGPointMake(42.362156, -71.018856);
    station0064.mapLocation = CGPointMake(2936.5, 1222.5);

    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 218;
    [edge0018.elements addObject:haul0060];

    // Добавляем станцию Terminal B East
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0018.elements addObject:station0065];
    
    station0065.nameOriginal = @"Logan Airport Term. B East";
    station0065.geoLocation = CGPointMake(42.361708, -71.017863);
    station0065.mapLocation = CGPointMake(1197, 2977.5);

    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 607;
    [edge0018.elements addObject:haul0061];

    // Добавляем станцию Terminal C
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0018.elements addObject:station0066];
    
    station0066.nameOriginal = @"Logan Airport Term. C";
    station0066.geoLocation = CGPointMake(42.366651, -71.017160);
    station0066.mapLocation = CGPointMake(1121.5, 2950);

    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length = 422;
    [edge0018.elements addObject:haul0062];

    // Добавляем станцию Terminal E
    MWStation *station0067 = [[MWStation alloc] init];
    station0067.identifier = @"station0067";
    [edge0018.elements addObject:station0067];
    
    station0067.nameOriginal = @"Logan Airport Term. E";
    station0067.geoLocation = CGPointMake(42.369367, -71.020240);
    station0067.mapLocation = CGPointMake(2907, 1078.5);

    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 3000;
    [edge0018.elements addObject:haul0063];

    // Добавляем станцию Silver Line Way
    MWStation *station0068 = [[MWStation alloc] init];
    station0068.identifier = @"station0068";
    [edge0018.elements addObject:station0068];
    
    station0068.nameOriginal = @"Silver Line Way";
    station0068.geoLocation = CGPointMake(42.3472, -71.0386);
    station0068.mapLocation = CGPointMake(2579, 1549);
    station0068.platformIndex = 1;

    // Добавляем вершину
    edge0018.finishVertex = vertex0020;

    // Создаем участок линии  Silver Line Way - Terminal A
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0019 = [[MWEdge alloc] init];
    edge0019.identifier = @"edge0019";
    edge0019.developmentName = @"Ребро: Silver Line Way - Terminal A";
    [self.edges addObject:edge0019];
    
    // Добавляем линию
    edge0019.line = line0005;
    
    // Добавляем вершину
    edge0019.startVertex = vertex0020;

    // Добавляем станцию Silver Line Way
    [edge0019.elements addObject:station0068];
    edge0019.directionFromStation = station0068;

    // Добавляем перегон
    MWHaul *haul0064 = [[MWHaul alloc] init];
    haul0064.identifier = @"haul0064";
    haul0064.length = 2900;
    [edge0019.elements addObject:haul0064];

    // Добавляем станцию Terminal A
    [edge0019.elements addObject:station0063];

    // Добавляем вершину
    edge0019.finishVertex = vertex0019;

    // Создаем участок линии  Silver Line Way - World Trade Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0020 = [[MWEdge alloc] init];
    edge0020.identifier = @"edge0020";
    edge0020.developmentName = @"Ребро: Silver Line Way - World Trade Ctr";
    [self.edges addObject:edge0020];
    
    // Добавляем линию
    edge0020.line = line0005;
    
    // Добавляем вершину
    edge0020.startVertex = vertex0020;

    // Добавляем станцию Silver Line Way
    [edge0020.elements addObject:station0068];
    
    // Добавляем перегон
    MWHaul *haul0065 = [[MWHaul alloc] init];
    haul0065.identifier = @"haul0065";
    haul0065.length = 600;
    [edge0020.elements addObject:haul0065];
    
    // Добавляем станцию World Trade Ctr
    MWStation *station0069 = [[MWStation alloc] init];
    station0069.identifier = @"station0069";
    [edge0020.elements addObject:station0069];
    
    station0069.nameOriginal = @"World Trade Center";
    station0069.geoLocation = CGPointMake(42.348667, -71.042525);
    station0069.mapLocation = CGPointMake(2525, 1548.5);
    station0069.platformIndex = 1;

    // Добавляем вершину
    edge0020.finishVertex = vertex0023;

    // Создаем участок линии  World Trade Ctr - Courthouse
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0021 = [[MWEdge alloc] init];
    edge0021.identifier = @"edge0021";
    edge0021.developmentName = @"Ребро: World Trade Ctr - Courthouse";
    [self.edges addObject:edge0021];
    
    // Добавляем линию
    edge0021.line = line0005;
    
    // Добавляем вершину
    edge0021.startVertex = vertex0023;

    // Добавляем станцию World Trade Ctr
    [edge0021.elements addObject:station0069];

    // Добавляем перегон
    MWHaul *haul0066 = [[MWHaul alloc] init];
    haul0066.identifier = @"haul0066";
    haul0066.length = 403;
    [edge0021.elements addObject:haul0066];

    // Добавляем станцию Courthouse
    MWStation *station0070 = [[MWStation alloc] init];
    station0070.identifier = @"station0070";
    [edge0021.elements addObject:station0070];
    
    station0070.nameOriginal = @"Courthouse";
    station0070.geoLocation = CGPointMake(42.352336, -71.046573);
    station0070.mapLocation = CGPointMake(2471, 1548.5);
    station0070.platformIndex = 1;
    
    // Добавляем вершину
    edge0021.finishVertex = vertex0024;

    // Создаем участок линии  Courthouse - South Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0022 = [[MWEdge alloc] init];
    edge0022.identifier = @"edge002";
    edge0022.developmentName = @"Ребро: Courthouse - South Station";
    [self.edges addObject:edge0022];
    
    // Добавляем линию
    edge0022.line = line0005;
    
    // Добавляем вершину
    edge0022.startVertex = vertex0024;

    // Добавляем станцию Courthouse
    [edge0022.elements addObject:station0069];

    // Добавляем перегон
    MWHaul *haul0067 = [[MWHaul alloc] init];
    haul0067.identifier = @"haul0067";
    haul0067.length = 882;
    [edge0022.elements addObject:haul0067];

    // Добавляем станцию South Station
    MWStation *station0071 = [[MWStation alloc] init];
    station0071.identifier = @"station0071";
    [edge0022.elements addObject:station0071];
    
    station0071.nameOriginal = @"South Station";
    station0071.geoLocation = CGPointMake(42.35261, -71.05536);
    station0071.mapLocation = CGPointMake(2338, 1549);
    station0071.platformIndex = 1;

    // Добавляем вершину
    edge0022.finishVertex = vertex0004;

    ////////////////////////////////////////////////////////////////
    // 6. Silver Line SL2
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Tide St - Black Falcon Ave
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0023 = [[MWEdge alloc] init];
    edge0023.identifier = @"edge0023";
    edge0023.developmentName = @"Ребро: Tide St - Black Falcon Ave";
    [self.edges addObject:edge0023];
    
    // Добавляем линию
    edge0023.line = line0006;
    
    // Добавляем вершину
    edge0023.startVertex = vertex0021;
    
    // Добавляем станцию Tide St
    MWStation *station0072 = [[MWStation alloc] init];
    station0072.identifier = @"station0072";
    [edge0023.elements addObject:station0072];
    
    station0072.nameOriginal = @"Tide Street";
    edge0023.directionFromStation = station0072;
    station0072.geoLocation = CGPointMake(42.345121, -71.032036);
    station0072.mapLocation = CGPointMake(2654, 1624.5);

    // Добавляем перегон
    MWHaul *haul0068 = [[MWHaul alloc] init];
    haul0068.identifier = @"haul0068";
    haul0068.length = 148;
    [edge0023.elements addObject:haul0068];

    // Добавляем станцию 21 Dry Dock Ave
    MWStation *station0073 = [[MWStation alloc] init];
    station0073.identifier = @"station0073";
    [edge0023.elements addObject:station0073];
    
    station0073.nameOriginal = @"21 Dry Dock Avenue";
    station0073.geoLocation = CGPointMake(42.344692, -71.031056);
    station0073.mapLocation = CGPointMake(2720, 1635);

    // Добавляем перегон
    MWHaul *haul0069 = [[MWHaul alloc] init];
    haul0069.identifier = @"haul0069";
    haul0069.length = 213;
    [edge0023.elements addObject:haul0069];

    // Добавляем станцию 25 Dry Dock Ave
    MWStation *station0074 = [[MWStation alloc] init];
    station0074.identifier = @"station0074";
    [edge0023.elements addObject:station0074];
    
    station0074.nameOriginal = @"25 Dry Dock Avenue";
    station0074.geoLocation = CGPointMake(42.344747, -71.028468);
    station0074.mapLocation = CGPointMake(2776.5, 1635.5);

    // Добавляем перегон
    MWHaul *haul0070 = [[MWHaul alloc] init];
    haul0070.identifier = @"haul0070";
    haul0070.length = 148;
    [edge0023.elements addObject:haul0070];

    // Добавляем станцию Black Falcon Ave
    MWStation *station0075 = [[MWStation alloc] init];
    station0075.identifier = @"station0075";
    [edge0023.elements addObject:station0075];
    
    station0075.nameOriginal = @"Black Falcon Avenue";
    station0075.geoLocation = CGPointMake(42.344279, -71.027267);
    station0075.mapLocation = CGPointMake(2832.5, 1665);

    // Добавляем вершину
    edge0023.finishVertex = vertex0022;
    
    // Создаем участок линии Black Falcon Ave - Tide St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0024 = [[MWEdge alloc] init];
    edge0024.identifier = @"edge0024";
    edge0024.developmentName = @"Ребро: Black Falcon Ave - Tide St";
    [self.edges addObject:edge0024];
    
    // Добавляем линию
    edge0024.line = line0006;
    
    // Добавляем вершину
    edge0024.startVertex = vertex0022;

    // Добавляем станцию Black Falcon Ave
    [edge0024.elements addObject:station0075];
    edge0024.directionFromStation = station0075;

    // Добавляем перегон
    MWHaul *haul0071 = [[MWHaul alloc] init];
    haul0071.identifier = @"haul0071";
    haul0071.length = 689;
    [edge0024.elements addObject:haul0071];

    // Добавляем станцию Design Center
    MWStation *station0076 = [[MWStation alloc] init];
    station0076.identifier = @"station0076";
    [edge0024.elements addObject:station0076];
    
    station0076.nameOriginal = @"Design Center";
    station0076.geoLocation = CGPointMake(42.344637, -71.034531);
    station0076.mapLocation = CGPointMake(2712.5, 1685);

    // Добавляем перегон
    MWHaul *haul0072 = [[MWHaul alloc] init];
    haul0072.identifier = @"haul0072";
    haul0072.length = 259;
    [edge0024.elements addObject:haul0072];

    // Добавляем станцию Tide St
    [edge0024.elements addObject:station0072];

    // Добавляем вершину
    edge0024.finishVertex = vertex0021;

    // Создаем участок линии Tide St - Silver Line Way
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0025 = [[MWEdge alloc] init];
    edge0025.identifier = @"edge0025";
    edge0025.developmentName = @"Ребро: Tide St - Silver Line Way";
    [self.edges addObject:edge0025];
    
    // Добавляем линию
    edge0025.line = line0006;
    
    // Добавляем вершину
    edge0025.startVertex = vertex0021;

    // Добавляем станцию Tide St
    [edge0025.elements addObject:station0072];

    // Добавляем перегон
    MWHaul *haul0073 = [[MWHaul alloc] init];
    haul0073.identifier = @"haul0073";
    haul0073.length = 282;
    [edge0025.elements addObject:haul0073];

    // Добавляем станцию Harbor St
    MWStation *station0077 = [[MWStation alloc] init];
    station0077.identifier = @"station0077";
    [edge0025.elements addObject:station0077];
    
    station0077.nameOriginal = @"Harbor Street";
    station0077.geoLocation = CGPointMake(42.346593, -71.034925);
    station0077.mapLocation = CGPointMake(2614, 1589.5);

    // Добавляем перегон
    MWHaul *haul0074 = [[MWHaul alloc] init];
    haul0074.identifier = @"haul0074";
    haul0074.length = 448;
    [edge0025.elements addObject:haul0074];

    // Добавляем станцию Silver Line Way
    MWStation *station0078 = [[MWStation alloc] init];
    station0078.identifier = @"station0078";
    [edge0025.elements addObject:station0078];
    
    station0078.nameOriginal = @"Silver Line Way";
    station0078.geoLocation = CGPointMake(42.3472, -71.0386);
    station0078.mapLocation = CGPointMake(2579, 1549);
    station0078.platformIndex = 1;

    // Добавляем вершину
    edge0025.finishVertex = vertex0020;

    // Создаем участок линии Silver Line Way - World Trade Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0026 = [[MWEdge alloc] init];
    edge0026.identifier = @"edge0026";
    edge0026.developmentName = @"Ребро: Silver Line Way - World Trade Ctr";
    [self.edges addObject:edge0026];
    
    // Добавляем линию
    edge0026.line = line0006;
    
    // Добавляем вершину
    edge0026.startVertex = vertex0020;

    // Добавляем станцию Silver Line Way
    [edge0026.elements addObject:station0078];

    // Добавляем перегон
    MWHaul *haul0075 = [[MWHaul alloc] init];
    haul0075.identifier = @"haul0075";
    haul0075.length = 600;
    [edge0026.elements addObject:haul0075];

    // Добавляем станцию World Trade Ctr
    MWStation *station0079 = [[MWStation alloc] init];
    station0079.identifier = @"station0079";
    [edge0026.elements addObject:station0079];
    
    station0079.nameOriginal = @"World Trade Center";
    station0079.geoLocation = CGPointMake(42.348667, -71.042525);
    station0079.mapLocation = CGPointMake(2525, 1548.5);
    station0079.platformIndex = 1;

    // Добавляем вершину
    edge0026.finishVertex = vertex0023;

    // Создаем участок линии World Trade Ctr - Courthouse
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0027 = [[MWEdge alloc] init];
    edge0027.identifier = @"edge0027";
    edge0027.developmentName = @"Ребро: World Trade Ctr - Courthouse";
    [self.edges addObject:edge0027];
    
    // Добавляем линию
    edge0027.line = line0006;
    
    // Добавляем вершину
    edge0027.startVertex = vertex0023;

    // Добавляем станцию World Trade Ctr
    [edge0027.elements addObject:station0079];

    // Добавляем перегон
    MWHaul *haul0076 = [[MWHaul alloc] init];
    haul0076.identifier = @"haul0076";
    haul0076.length = 403;
    [edge0027.elements addObject:haul0076];

    // Добавляем станцию Courthouse
    MWStation *station0080 = [[MWStation alloc] init];
    station0080.identifier = @"station0080";
    [edge0027.elements addObject:station0080];
    
    station0080.nameOriginal = @"Courthouse";
    station0080.geoLocation = CGPointMake(42.352336, -71.046573);
    station0080.mapLocation = CGPointMake(2471, 1548.5);
    station0080.platformIndex = 1;

    // Добавляем вершину
    edge0027.finishVertex = vertex0024;

    // Создаем участок линии Courthouse - South Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0028 = [[MWEdge alloc] init];
    edge0028.identifier = @"edge0028";
    edge0028.developmentName = @"Ребро: Courthouse - South Station";
    [self.edges addObject:edge0028];
    
    // Добавляем линию
    edge0028.line = line0006;
    
    // Добавляем вершину
    edge0028.startVertex = vertex0024;

    // Добавляем станцию Courthouse
    [edge0028.elements addObject:station0080];

    // Добавляем перегон
    MWHaul *haul0077 = [[MWHaul alloc] init];
    haul0077.identifier = @"haul0077";
    haul0077.length = 882;
    [edge0028.elements addObject:haul0077];

    // Добавляем станцию South Station
    MWStation *station0081 = [[MWStation alloc] init];
    station0081.identifier = @"station0081";
    [edge0028.elements addObject:station0081];
    
    station0081.nameOriginal = @"South Station";
    station0081.geoLocation = CGPointMake(42.35261, -71.05536);
    station0081.mapLocation = CGPointMake(2338, 1549);
    station0081.platformIndex = 1;

    // Добавляем вершину
    edge0028.finishVertex = vertex0004;

    ////////////////////////////////////////////////////////////////
    // 7. Silver Line SL4
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Tufts Medical Center - Chinatown
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0029 = [[MWEdge alloc] init];
    edge0029.identifier = @"edge0029";
    edge0029.developmentName = @"Ребро: Tufts Medical Center - Chinatown";
    [self.edges addObject:edge0029];
    
    // Добавляем линию
    edge0029.line = line0007;
    
    // Добавляем вершину
    edge0029.startVertex = vertex0010;

    // Добавляем станцию Tufts Medical Center
    MWStation *station0082 = [[MWStation alloc] init];
    station0082.identifier = @"station0082";
    [edge0029.elements addObject:station0082];
    
    station0082.nameOriginal = @"Tufts Medical Center";
    edge0029.directionFromStation = station0082;
    station0082.geoLocation = CGPointMake(42.3486, -71.0645);
    station0082.mapLocation = CGPointMake(1915, 1701);
    station0082.platformIndex = 1;
    
    // Добавляем перегон
    MWHaul *haul0078 = [[MWHaul alloc] init];
    haul0078.identifier = @"haul0078";
    haul0078.length = 332;
    [edge0029.elements addObject:haul0078];

    // Добавляем станцию Chinatown
    MWStation *station0083 = [[MWStation alloc] init];
    station0083.identifier = @"station0083";
    [edge0029.elements addObject:station0083];
    
    station0083.nameOriginal = @"Chinatown";
    station0083.geoLocation = CGPointMake(42.3522, -71.0627);
    station0083.mapLocation = CGPointMake(2066.5, 1549);
    station0083.platformIndex = 1;

    // Добавляем вершину
    edge0029.finishVertex = vertex0011;

    // Создаем участок линии Chinatown - South Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0030 = [[MWEdge alloc] init];
    edge0030.identifier = @"edge0030";
    edge0030.developmentName = @"Ребро: Chinatown - South Station";
    [self.edges addObject:edge0030];
    
    // Добавляем линию
    edge0030.line = line0007;
    
    // Добавляем вершину
    edge0030.startVertex = vertex0011;

    // Добавляем станцию Chinatown
    [edge0030.elements addObject:station0083];
    edge0030.directionFromStation = station0083;

    // Добавляем перегон
    MWHaul *haul0079 = [[MWHaul alloc] init];
    haul0079.identifier = @"haul0079";
    haul0079.length = 803;
    [edge0030.elements addObject:haul0079];

    // Добавляем станцию South Station
    MWStation *station0084 = [[MWStation alloc] init];
    station0084.identifier = @"station0084";
    [edge0030.elements addObject:station0084];
    
    station0084.nameOriginal = @"South Station";
    station0084.geoLocation = CGPointMake(42.35261, -71.05536);
    station0084.mapLocation = CGPointMake(2338, 1549);

    // Добавляем вершину
    edge0030.finishVertex = vertex0004;

    // Создаем участок линии South Station - Tufts Medical Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0031 = [[MWEdge alloc] init];
    edge0031.identifier = @"edge0031";
    edge0031.developmentName = @"Ребро: South Station - Tufts Medical Center";
    [self.edges addObject:edge0031];
    
    // Добавляем линию
    edge0031.line = line0007;
    
    // Добавляем вершину
    edge0031.startVertex = vertex0004;

    // Добавляем станцию South Station
    [edge0031.elements addObject:station0084];
    edge0031.directionFromStation = station0084;

    // Добавляем перегон
    MWHaul *haul0080 = [[MWHaul alloc] init];
    haul0080.identifier = @"haul0080";
    haul0080.length = 1202;
    [edge0031.elements addObject:haul0080];

    // Добавляем станцию Tufts Medical Center
    [edge0031.elements addObject:station0082];

    // Добавляем вершину
    edge0031.finishVertex = vertex0010;

    // Создаем участок линии Tufts Medical Center - Herald St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0032 = [[MWEdge alloc] init];
    edge0032.identifier = @"edge0032";
    edge0032.developmentName = @"Ребро: Tufts Medical Center - Herald St";
    [self.edges addObject:edge0032];
    
    // Добавляем линию
    edge0032.line = line0007;
    
    // Добавляем вершину
    edge0032.startVertex = vertex0010;

    // Добавляем станцию Tufts Medical Center
    [edge0032.elements addObject:station0082];

    // Добавляем перегон
    MWHaul *haul0081 = [[MWHaul alloc] init];
    haul0081.identifier = @"haul0081";
    haul0081.length = 232;
    [edge0032.elements addObject:haul0081];

    // Добавляем станцию Herald St
    MWStation *station0085 = [[MWStation alloc] init];
    station0085.identifier = @"station0085";
    [edge0032.elements addObject:station0085];
    
    station0085.nameOriginal = @"Herald Street";
    station0085.geoLocation = CGPointMake(42.3464, -71.0648);
    station0085.mapLocation = CGPointMake(1915, 1757);
    station0085.platformIndex = 1;

    // Добавляем вершину
    edge0032.finishVertex = vertex0026;

    // Создаем участок линии Herald St - East Berkeley St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0033 = [[MWEdge alloc] init];
    edge0033.identifier = @"edge0033";
    edge0033.developmentName = @"Ребро: Herald St - East Berkeley St";
    [self.edges addObject:edge0033];
    
    // Добавляем линию
    edge0033.line = line0007;
    
    // Добавляем вершину
    edge0033.startVertex = vertex0026;

    // Добавляем станцию Herald St
    [edge0033.elements addObject:station0085];

    // Добавляем перегон
    MWHaul *haul0082 = [[MWHaul alloc] init];
    haul0082.identifier = @"haul0082";
    haul0082.length = 286;
    [edge0033.elements addObject:haul0082];

    // Добавляем станцию East Berkeley St
    MWStation *station0086 = [[MWStation alloc] init];
    station0086.identifier = @"station0086";
    [edge0033.elements addObject:station0086];
    
    station0086.nameOriginal = @"East Berkeley Street";
    station0086.geoLocation = CGPointMake(42.344, -71.066);
    station0086.mapLocation = CGPointMake(1915, 1812);
    station0086.platformIndex = 1;

    // Добавляем вершину
    edge0033.finishVertex = vertex0027;

    // Создаем участок линии East Berkeley St - Union Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0034 = [[MWEdge alloc] init];
    edge0034.identifier = @"edge0034";
    edge0034.developmentName = @"Ребро: East Berkeley St - Union Park St";
    [self.edges addObject:edge0034];
    
    // Добавляем линию
    edge0034.line = line0007;
    
    // Добавляем вершину
    edge0034.startVertex = vertex0027;

    // Добавляем станцию East Berkeley St
    [edge0034.elements addObject:station0086];

    // Добавляем перегон
    MWHaul *haul0083 = [[MWHaul alloc] init];
    haul0083.identifier = @"haul0083";
    haul0083.length = 397;
    [edge0034.elements addObject:haul0083];

    // Добавляем станцию Union Part St
    MWStation *station0087 = [[MWStation alloc] init];
    station0087.identifier = @"station0087";
    [edge0034.elements addObject:station0087];
    
    station0087.nameOriginal = @"Union Park Street";
    station0087.geoLocation = CGPointMake(42.3414, -71.0692);
    station0087.mapLocation = CGPointMake(1915, 1867.5);
    station0087.platformIndex = 1;

    // Добавляем вершину
    edge0034.finishVertex = vertex0028;
    
    // Создаем участок линии Union Park St - Newton St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0035 = [[MWEdge alloc] init];
    edge0035.identifier = @"edge0035";
    edge0035.developmentName = @"Ребро: Union Park St - Newton St";
    [self.edges addObject:edge0035];
    
    // Добавляем линию
    edge0035.line = line0007;
    
    // Добавляем вершину
    edge0035.startVertex = vertex0028;

    // Добавляем станцию Union Park St
    [edge0035.elements addObject:station0087];

    // Добавляем перегон
    MWHaul *haul0084 = [[MWHaul alloc] init];
    haul0084.identifier = @"haul0084";
    haul0084.length = 486;
    [edge0035.elements addObject:haul0084];

    // Добавляем станцию Newton St
    MWStation *station0088 = [[MWStation alloc] init];
    station0088.identifier = @"station0088";
    [edge0035.elements addObject:station0088];
    
    station0088.nameOriginal = @"Newton Street";
    station0088.geoLocation = CGPointMake(42.3387, -71.0738);
    station0088.mapLocation = CGPointMake(1915, 1923);
    station0088.platformIndex = 1;
    
    // Добавляем вершину
    edge0035.finishVertex = vertex0029;
    
    // Создаем участок линии Newton St - Worcester Sq
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0036 = [[MWEdge alloc] init];
    edge0036.identifier = @"edge0036";
    edge0036.developmentName = @"Ребро: Newton St - Worcester Sq";
    [self.edges addObject:edge0036];
    
    // Добавляем линию
    edge0036.line = line0007;
    
    // Добавляем вершину
    edge0036.startVertex = vertex0029;

    // Добавляем станцию Newton St
    [edge0036.elements addObject:station0088];

    // Добавляем перегон
    MWHaul *haul0085 = [[MWHaul alloc] init];
    haul0085.identifier = @"haul0085";
    haul0085.length = 221;
    [edge0036.elements addObject:haul0085];

    // Добавляем станцию Worcester Sq
    MWStation *station0089 = [[MWStation alloc] init];
    station0089.identifier = @"station0089";
    [edge0036.elements addObject:station0089];
    
    station0089.nameOriginal = @"Worcester Square";
    station0089.geoLocation = CGPointMake(42.337389, -71.075833);
    station0089.mapLocation = CGPointMake(1915, 1978);
    station0089.platformIndex = 1;

    // Добавляем вершину
    edge0036.finishVertex = vertex0030;

    // Создаем участок линии Worcester Sq - Mass. Ave
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0037 = [[MWEdge alloc] init];
    edge0037.identifier = @"edge0037";
    edge0037.developmentName = @"Ребро: Worcester Sq - Mass. Ave";
    [self.edges addObject:edge0037];
    
    // Добавляем линию
    edge0037.line = line0007;
    
    // Добавляем вершину
    edge0037.startVertex = vertex0030;

    // Добавляем станцию Worcester Sq
    [edge0037.elements addObject:station0089];

    // Добавляем перегон
    MWHaul *haul0086 = [[MWHaul alloc] init];
    haul0086.identifier = @"haul0086";
    haul0086.length = 163;
    [edge0037.elements addObject:haul0086];

    // Добавляем станцию Mass. Ave
    MWStation *station0090 = [[MWStation alloc] init];
    station0090.identifier = @"station0090";
    [edge0037.elements addObject:station0090];
    
    station0090.nameOriginal = @"Massachusetts Avenue";
    station0090.geoLocation = CGPointMake(42.3363, -71.0772);
    station0090.mapLocation = CGPointMake(1915, 2033.5);
    station0090.platformIndex = 1;

    // Добавляем вершину
    edge0037.finishVertex = vertex0031;

    // Создаем участок линии Mass. Ave - Lenox St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0038 = [[MWEdge alloc] init];
    edge0038.identifier = @"edge0038";
    edge0038.developmentName = @"Ребро: Mass. Ave - Lenox St";
    [self.edges addObject:edge0038];
    
    // Добавляем линию
    edge0038.line = line0007;
    
    // Добавляем вершину
    edge0038.startVertex = vertex0031;

    // Добавляем станцию Mass. Ave
    [edge0038.elements addObject:station0090];

    // Добавляем перегон
    MWHaul *haul0087 = [[MWHaul alloc] init];
    haul0087.identifier = @"haul0087";
    haul0087.length = 183;
    [edge0038.elements addObject:haul0087];

    // Добавляем станцию Lenox St
    MWStation *station0091 = [[MWStation alloc] init];
    station0091.identifier = @"station0091";
    [edge0038.elements addObject:station0091];
    
    station0091.nameOriginal = @"Lenox Street";
    station0091.geoLocation = CGPointMake(42.3351, -71.0788);
    station0091.mapLocation = CGPointMake(1915, 2088.5);
    station0091.platformIndex = 1;
    
    // Добавляем вершину
    edge0038.finishVertex = vertex0032;

    // Создаем участок линии Lenox St - Melnea Cass
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0039 = [[MWEdge alloc] init];
    edge0039.identifier = @"edge0039";
    edge0039.developmentName = @"Ребро: Lenox St - Melnea Cass";
    [self.edges addObject:edge0039];
    
    // Добавляем линию
    edge0039.line = line0007;
    
    // Добавляем вершину
    edge0039.startVertex = vertex0032;

    // Добавляем станцию Lenox St
    [edge0039.elements addObject:station0091];

    // Добавляем перегон
    MWHaul *haul0088 = [[MWHaul alloc] init];
    haul0088.identifier = @"haul0088";
    haul0088.length = 311;
    [edge0039.elements addObject:haul0088];

    // Добавляем станцию Melnea Cass
    MWStation *station0092 = [[MWStation alloc] init];
    station0092.identifier = @"station0092";
    [edge0039.elements addObject:station0092];
    
    station0092.nameOriginal = @"Melnea Cass Boulevard";
    station0092.geoLocation = CGPointMake(42.3329, -71.081);
    station0092.mapLocation = CGPointMake(1915, 2144);
    station0092.platformIndex = 1;
    
    // Добавляем вершину
    edge0039.finishVertex = vertex0033;

    // Создаем участок линии Melnea Cass - Dudley Sq
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0040 = [[MWEdge alloc] init];
    edge0040.identifier = @"edge0040";
    edge0040.developmentName = @"Ребро: Melnea Cass - Dudley Sq";
    [self.edges addObject:edge0040];
    
    // Добавляем линию
    edge0040.line = line0007;
    
    // Добавляем вершину
    edge0040.startVertex = vertex0033;

    // Добавляем станцию Melnea Cass
    [edge0040.elements addObject:station0092];

    // Добавляем перегон
    MWHaul *haul0089 = [[MWHaul alloc] init];
    haul0089.identifier = @"haul0089";
    haul0089.length = 535;
    [edge0040.elements addObject:haul0089];

    // Добавляем станцию Dudley Sq
    MWStation *station0093 = [[MWStation alloc] init];
    station0093.identifier = @"station0093";
    [edge0040.elements addObject:station0093];
    
    station0093.nameOriginal = @"Dudley Square";
    station0093.geoLocation = CGPointMake(42.3292, -71.0842);
    station0093.mapLocation = CGPointMake(1915, 2199);
    station0093.platformIndex = 1;

    // Добавляем вершину
    edge0040.finishVertex = vertex0034;

    ////////////////////////////////////////////////////////////////
    // 8. Silver Line SL5
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Tufts Medical Center - Chinatown
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0041 = [[MWEdge alloc] init];
    edge0041.identifier = @"edge0041";
    edge0041.developmentName = @"Ребро: Tufts Medical Center - Chinatown";
    [self.edges addObject:edge0041];
    
    // Добавляем линию
    edge0041.line = line0008;
    
    // Добавляем вершину
    edge0041.startVertex = vertex0010;
    
    // Добавляем станцию Tufts Medical Center
    MWStation *station0094 = [[MWStation alloc] init];
    station0094.identifier = @"station0094";
    [edge0041.elements addObject:station0094];
    
    station0094.nameOriginal = @"Tufts Medical Center";
    edge0041.directionFromStation = station0094;
    station0094.geoLocation = CGPointMake(42.3486, -71.0645);
    station0094.mapLocation = CGPointMake(1915, 1701.5);
    station0094.platformIndex = 1;
    
    // Добавляем перегон
    MWHaul *haul0090 = [[MWHaul alloc] init];
    haul0090.identifier = @"haul0090";
    haul0090.length = 332;
    [edge0041.elements addObject:haul0090];

    // Добавляем станцию Chinatown
    MWStation *station0095 = [[MWStation alloc] init];
    station0095.identifier = @"station0095";
    [edge0041.elements addObject:station0095];
    
    station0095.nameOriginal = @"Chinatown";
    station0095.geoLocation = CGPointMake(42.3522, -71.0627);
    station0095.mapLocation = CGPointMake(2066.5, 1549);
    station0095.platformIndex = 1;

    // Добавляем вершину
    edge0041.finishVertex = vertex0011;

    // Создаем участок линии Chinatown - Downtown Crossing
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0042 = [[MWEdge alloc] init];
    edge0042.identifier = @"edge0042";
    edge0042.developmentName = @"Ребро: Chinatown - Downtown Crossing";
    [self.edges addObject:edge0042];
    
    // Добавляем линию
    edge0042.line = line0008;
    
    // Добавляем вершину
    edge0042.startVertex = vertex0011;

    // Добавляем станцию Chinatown
    [edge0042.elements addObject:station0095];
    edge0042.directionFromStation = station0095;
    
    // Добавляем перегон
    MWHaul *haul0091 = [[MWHaul alloc] init];
    haul0091.identifier = @"haul0091";
    haul0091.length = 421;
    [edge0042.elements addObject:haul0091];

    // Добавляем станцию Downtown Crossing
    MWStation *station0096 = [[MWStation alloc] init];
    station0096.identifier = @"station0096";
    [edge0042.elements addObject:station0096];
    
    station0096.nameOriginal = @"Downtown Crossing";
    station0096.geoLocation = CGPointMake(42.3555, -71.0605);
    station0096.mapLocation = CGPointMake(2202.5, 1412);

    // Добавляем вершину
    edge0042.finishVertex = vertex0003;

    // Создаем участок линии Downtown Crossing - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0043 = [[MWEdge alloc] init];
    edge0043.identifier = @"edge0043";
    edge0043.developmentName = @"Ребро: Downtown Crossing - Boylston";
    [self.edges addObject:edge0043];
    
    // Добавляем линию
    edge0043.line = line0008;
    
    // Добавляем вершину
    edge0043.startVertex = vertex0003;

    // Добавляем станцию Downtown Crossing
    [edge0043.elements addObject:station0096];
    edge0043.directionFromStation = station0096;
    
    // Добавляем перегон
    MWHaul *haul0092 = [[MWHaul alloc] init];
    haul0092.identifier = @"haul0092";
    haul0092.length = 580;
    [edge0043.elements addObject:haul0092];

    // Добавляем станцию Boylston
    MWStation *station0097 = [[MWStation alloc] init];
    station0097.identifier = @"station0097";
    [edge0043.elements addObject:station0097];
    
    station0097.nameOriginal = @"Boylston";
    station0097.geoLocation = CGPointMake(42.3525, -71.064722);
    station0097.mapLocation = CGPointMake(1974.5, 1411.5);
    
    // Добавляем вершину
    edge0043.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Tufts Medical Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0044 = [[MWEdge alloc] init];
    edge0044.identifier = @"edge0044";
    edge0044.developmentName = @"Ребро: Boylston - Tufts Medical Center";
    [self.edges addObject:edge0044];
    
    // Добавляем линию
    edge0044.line = line0008;
    
    // Добавляем вершину
    edge0044.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0044.elements addObject:station0097];
    edge0044.directionFromStation = station0097;
    
    // Добавляем перегон
    MWHaul *haul0093 = [[MWHaul alloc] init];
    haul0093.identifier = @"haul0093";
    haul0093.length = 529;
    [edge0044.elements addObject:haul0093];

    // Добавляем станцию Tufts Medical Center
    [edge0044.elements addObject:station0094];

    // Добавляем вершину
    edge0044.finishVertex = vertex0010;

    // Создаем участок линии Tufts Medical Center - Herald St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0045 = [[MWEdge alloc] init];
    edge0045.identifier = @"edge0045";
    edge0045.developmentName = @"Ребро: Tufts Medical Center - Herald St";
    [self.edges addObject:edge0045];
    
    // Добавляем линию
    edge0045.line = line0008;
    
    // Добавляем вершину
    edge0045.startVertex = vertex0010;

    // Добавляем станцию Tufts Medical Center
    [edge0045.elements addObject:station0094];

    // Добавляем перегон
    MWHaul *haul0094 = [[MWHaul alloc] init];
    haul0094.identifier = @"haul0094";
    haul0094.length = 232;
    [edge0045.elements addObject:haul0094];

    // Добавляем станцию Herald St
    MWStation *station0098 = [[MWStation alloc] init];
    station0098.identifier = @"station0098";
    [edge0045.elements addObject:station0098];
    
    station0098.nameOriginal = @"Herald Street";
    station0098.geoLocation = CGPointMake(42.3464, -71.0648);
    station0098.mapLocation = CGPointMake(1915, 1757);
    station0098.platformIndex = 1;

    // Добавляем вершину
    edge0045.finishVertex = vertex0026;

    // Создаем участок линии Herald St - East Berkeley St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0046 = [[MWEdge alloc] init];
    edge0046.identifier = @"edge0046";
    edge0046.developmentName = @"Ребро: Herald St - East Berkeley St";
    [self.edges addObject:edge0046];
    
    // Добавляем линию
    edge0046.line = line0008;
    
    // Добавляем вершину
    edge0046.startVertex = vertex0026;

    // Добавляем станцию Herald St
    [edge0046.elements addObject:station0098];
    
    // Добавляем перегон
    MWHaul *haul0095 = [[MWHaul alloc] init];
    haul0095.identifier = @"haul0095";
    haul0095.length = 286;
    [edge0046.elements addObject:haul0095];

    // Добавляем станцию East Berkeley St
    MWStation *station0099 = [[MWStation alloc] init];
    station0099.identifier = @"station0099";
    [edge0046.elements addObject:station0099];
    
    station0099.nameOriginal = @"East Berkeley Street";
    station0099.geoLocation = CGPointMake(42.344, -71.066);
    station0099.mapLocation = CGPointMake(1915, 1812);
    station0099.platformIndex = 1;
    
    // Добавляем вершину
    edge0046.finishVertex = vertex0027;

    // Создаем участок линии East Berkeley St - Union Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0047 = [[MWEdge alloc] init];
    edge0047.identifier = @"edge0047";
    edge0047.developmentName = @"Ребро: East Berkeley St - Union Park St";
    [self.edges addObject:edge0047];
    
    // Добавляем линию
    edge0047.line = line0008;
    
    // Добавляем вершину
    edge0047.startVertex = vertex0027;

    // Добавляем станцию East Berkeley St
    [edge0047.elements addObject:station0099];

    // Добавляем перегон
    MWHaul *haul0096 = [[MWHaul alloc] init];
    haul0096.identifier = @"haul0096";
    haul0096.length = 397;
    [edge0047.elements addObject:haul0096];

    // Добавляем станцию Union Park St
    MWStation *station0100 = [[MWStation alloc] init];
    station0100.identifier = @"station0100";
    [edge0047.elements addObject:station0100];
    
    station0100.nameOriginal = @"Union Park Street";
    station0100.geoLocation = CGPointMake(42.3414, -71.0692);
    station0100.mapLocation = CGPointMake(1915, 1867.5);
    station0100.platformIndex = 1;
    
    // Добавляем вершину
    edge0047.finishVertex = vertex0028;

    // Создаем участок линии Union Park St - Newton St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0048 = [[MWEdge alloc] init];
    edge0048.identifier = @"edge0048";
    edge0048.developmentName = @"Ребро: Union Park St - Newton St";
    [self.edges addObject:edge0048];
    
    // Добавляем линию
    edge0048.line = line0008;
    
    // Добавляем вершину
    edge0048.startVertex = vertex0028;

    // Добавляем станцию Union Park St
    [edge0048.elements addObject:station0100];

    // Добавляем перегон
    MWHaul *haul0097 = [[MWHaul alloc] init];
    haul0097.identifier = @"haul0097";
    haul0097.length = 486;
    [edge0048.elements addObject:haul0097];

    // Добавляем станцию Newton St
    MWStation *station0101 = [[MWStation alloc] init];
    station0101.identifier = @"station0101";
    [edge0048.elements addObject:station0101];
    
    station0101.nameOriginal = @"Newton Street";
    station0101.geoLocation = CGPointMake(42.3387, -71.0738);
    station0101.mapLocation = CGPointMake(1915, 1923);
    station0101.platformIndex = 1;

    // Добавляем вершину
    edge0048.finishVertex = vertex0029;

    // Создаем участок линии Newton St - Worcester Sq
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0049 = [[MWEdge alloc] init];
    edge0049.identifier = @"edge0049";
    edge0049.developmentName = @"Ребро: Newton St - Worcester Sq";
    [self.edges addObject:edge0049];
    
    // Добавляем линию
    edge0049.line = line0008;
    
    // Добавляем вершину
    edge0049.startVertex = vertex0029;

    // Добавляем станцию Newton St
    [edge0049.elements addObject:station0101];

    // Добавляем перегон
    MWHaul *haul0098 = [[MWHaul alloc] init];
    haul0098.identifier = @"haul0098";
    haul0098.length = 221;
    [edge0049.elements addObject:haul0098];

    // Добавляем станцию Worcester Sq
    MWStation *station0102 = [[MWStation alloc] init];
    station0102.identifier = @"station0102";
    [edge0049.elements addObject:station0102];
    
    station0102.nameOriginal = @"Worcester Square";
    station0102.geoLocation = CGPointMake(42.337389, -71.075833);
    station0102.mapLocation = CGPointMake(1915, 1978);
    station0102.platformIndex = 1;
    
    // Добавляем вершину
    edge0049.finishVertex = vertex0030;

    // Создаем участок линии Worcester Sq - Mass. Ave
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0050 = [[MWEdge alloc] init];
    edge0050.identifier = @"edge0050";
    edge0050.developmentName = @"Ребро: Worcester Sq - Mass. Ave";
    [self.edges addObject:edge0050];
    
    // Добавляем линию
    edge0050.line = line0008;
    
    // Добавляем вершину
    edge0050.startVertex = vertex0030;

    // Добавляем станцию Worcester Sq
    [edge0050.elements addObject:station0102];

    // Добавляем перегон
    MWHaul *haul0099 = [[MWHaul alloc] init];
    haul0099.identifier = @"haul0099";
    haul0099.length = 163;
    [edge0050.elements addObject:haul0099];

    // Добавляем станцию Mass. Ave
    MWStation *station0103 = [[MWStation alloc] init];
    station0103.identifier = @"station0103";
    [edge0050.elements addObject:station0103];
    
    station0103.nameOriginal = @"Massachusetts Avenue";
    station0103.geoLocation = CGPointMake(42.3363, -71.0772);
    station0103.mapLocation = CGPointMake(1915, 2033.5);
    station0103.platformIndex = 1;
    
    // Добавляем вершину
    edge0050.finishVertex = vertex0031;

    // Создаем участок линии Mass. Ave - Lenox St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0051 = [[MWEdge alloc] init];
    edge0051.identifier = @"edge0051";
    edge0051.developmentName = @"Ребро: Mass. Ave - Lenox St";
    [self.edges addObject:edge0051];
    
    // Добавляем линию
    edge0051.line = line0008;
    
    // Добавляем вершину
    edge0051.startVertex = vertex0031;

    // Добавляем станцию Mass. Ave
    [edge0051.elements addObject:station0103];

    // Добавляем перегон
    MWHaul *haul0100 = [[MWHaul alloc] init];
    haul0100.identifier = @"haul0100";
    haul0100.length = 183;
    [edge0051.elements addObject:haul0100];
    
    // Добавляем станцию Lenox St
    MWStation *station0104 = [[MWStation alloc] init];
    station0104.identifier = @"station0104";
    [edge0051.elements addObject:station0104];
    
    station0104.nameOriginal = @"Lenox Street";
    station0104.geoLocation = CGPointMake(42.3351, -71.0788);
    station0104.mapLocation = CGPointMake(1915, 2088.5);
    station0104.platformIndex = 1;
    
    // Добавляем вершину
    edge0051.finishVertex = vertex0032;

    // Создаем участок линии Lenox St - Melnea Cass
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0052 = [[MWEdge alloc] init];
    edge0052.identifier = @"edge0052";
    edge0052.developmentName = @"Ребро: Lenox St - Melnea Cass";
    [self.edges addObject:edge0052];
    
    // Добавляем линию
    edge0052.line = line0008;
    
    // Добавляем вершину
    edge0052.startVertex = vertex0032;

    // Добавляем станцию Lenox St
    [edge0052.elements addObject:station0104];

    // Добавляем перегон
    MWHaul *haul0101 = [[MWHaul alloc] init];
    haul0101.identifier = @"haul0101";
    haul0101.length = 311;
    [edge0052.elements addObject:haul0101];

    // Добавляем станцию Melnea Cass
    MWStation *station0105 = [[MWStation alloc] init];
    station0105.identifier = @"station0105";
    [edge0052.elements addObject:station0105];
    
    station0105.nameOriginal = @"Melnea Cass Boulevard";
    station0105.geoLocation = CGPointMake(42.3329, -71.081);
    station0105.mapLocation = CGPointMake(1915, 2144);
    station0105.platformIndex = 1;
    
    // Добавляем вершину
    edge0052.finishVertex = vertex0033;

    // Создаем участок линии Melnea Cass - Dudley Sq
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0053 = [[MWEdge alloc] init];
    edge0053.identifier = @"edge0053";
    edge0053.developmentName = @"Ребро: Melnea Cass - Dudley Sq";
    [self.edges addObject:edge0053];
    
    // Добавляем линию
    edge0053.line = line0008;
    
    // Добавляем вершину
    edge0053.startVertex = vertex0033;

    // Добавляем станцию Melnea Cass
    [edge0053.elements addObject:station0105];

    // Добавляем перегон
    MWHaul *haul0102 = [[MWHaul alloc] init];
    haul0102.identifier = @"haul0102";
    haul0102.length = 535;
    [edge0053.elements addObject:haul0102];

    // Добавляем станцию Dudley Sq
    MWStation *station0106 = [[MWStation alloc] init];
    station0106.identifier = @"station0106";
    [edge0053.elements addObject:station0106];
    
    station0106.nameOriginal = @"Dudley Square";
    station0106.geoLocation = CGPointMake(42.3292, -71.0842);
    station0106.mapLocation = CGPointMake(1915, 2199);
    station0106.platformIndex = 1;
    
    // Добавляем вершину
    edge0053.finishVertex = vertex0034;

    ////////////////////////////////////////////////////////////////
    // 9. Green Line B
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Boston College - Kenmore
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0054 = [[MWEdge alloc] init];
    edge0054.identifier = @"edge0054";
    edge0054.developmentName = @"Ребро: Boston College - Kenmore";
    [self.edges addObject:edge0054];
    
    // Добавляем линию
    edge0054.line = line0009;
    
    // Добавляем вершину
    edge0054.startVertex = vertex0041;

    // Добавляем станцию Boston College
    MWStation *station0107 = [[MWStation alloc] init];
    station0107.identifier = @"station0107";
    [edge0054.elements addObject:station0107];
    
    station0107.nameOriginal = @"Boston College";
    station0107.geoLocation = CGPointMake(42.340083, -71.167);
    station0107.mapLocation = CGPointMake(395.5, 1418);

    // Добавляем перегон
    MWHaul *haul0103 = [[MWHaul alloc] init];
    haul0103.identifier = @"haul0103";
    haul0103.length = 793;
    [edge0054.elements addObject:haul0103];

    // Добавляем станцию South St
    MWStation *station0108 = [[MWStation alloc] init];
    station0108.identifier = @"station0108";
    [edge0054.elements addObject:station0108];
    
    station0108.nameOriginal = @"South Street";
    station0108.geoLocation = CGPointMake(42.339531, -71.157489);
    station0108.mapLocation = CGPointMake(475, 1374.5);

    // Добавляем перегон
    MWHaul *haul0104 = [[MWHaul alloc] init];
    haul0104.identifier = @"haul0104";
    haul0104.length = 1198;
    [edge0054.elements addObject:haul0104];

    // Добавляем станцию Chestnut Hill Ave
    MWStation *station0109 = [[MWStation alloc] init];
    station0109.identifier = @"station0109";
    [edge0054.elements addObject:station0109];
    
    station0109.nameOriginal = @"Chestnut Hill Avenue";
    station0109.geoLocation = CGPointMake(42.33817, -71.1531);
    station0109.mapLocation = CGPointMake(522.5, 1327.5);
    
    // Добавляем перегон
    MWHaul *haul0105 = [[MWHaul alloc] init];
    haul0105.identifier = @"haul0105";
    haul0105.length = 375;
    [edge0054.elements addObject:haul0105];

    // Добавляем станцию Chiswick Rd
    MWStation *station0110 = [[MWStation alloc] init];
    station0110.identifier = @"station0110";
    [edge0054.elements addObject:station0110];
    
    station0110.nameOriginal = @"Chiswick Road";
    station0110.geoLocation = CGPointMake(42.340839, -71.150459);
    station0110.mapLocation = CGPointMake(569, 1280.5);

    // Добавляем перегон
    MWHaul *haul0106 = [[MWHaul alloc] init];
    haul0106.identifier = @"haul0106";
    haul0106.length = 378;
    [edge0054.elements addObject:haul0106];

    // Добавляем станцию Sutherland Rd
    MWStation *station0111 = [[MWStation alloc] init];
    station0111.identifier = @"station0111";
    [edge0054.elements addObject:station0111];
    
    station0111.nameOriginal = @"Sutherland Road";
    station0111.geoLocation = CGPointMake(42.341483, -71.146162);
    station0111.mapLocation = CGPointMake(616, 1233);

    // Добавляем перегон
    MWHaul *haul0107 = [[MWHaul alloc] init];
    haul0107.identifier = @"haul0107";
    haul0107.length = 407;
    [edge0054.elements addObject:haul0107];

    // Добавляем станцию Washington St
    MWStation *station0112 = [[MWStation alloc] init];
    station0112.identifier = @"station0112";
    [edge0054.elements addObject:station0112];
    
    station0112.nameOriginal = @"Washington Street";
    station0112.geoLocation = CGPointMake(42.343886, -71.142593);
    station0112.mapLocation = CGPointMake(663, 1186.5);

    // Добавляем перегон
    MWHaul *haul0108 = [[MWHaul alloc] init];
    haul0108.identifier = @"haul0108";
    haul0108.length = 539;
    [edge0054.elements addObject:haul0108];

    // Добавляем станцию Warren St
    MWStation *station0113 = [[MWStation alloc] init];
    station0113.identifier = @"station0113";
    [edge0054.elements addObject:station0113];
    
    station0113.nameOriginal = @"Warren Street";
    station0113.geoLocation = CGPointMake(42.348366, -71.140224);
    station0113.mapLocation = CGPointMake(710, 1140);
    // Добавляем перегон
    MWHaul *haul0109 = [[MWHaul alloc] init];
    haul0109.identifier = @"haul0109";
    haul0109.length = 260;
    [edge0054.elements addObject:haul0109];

    // Добавляем станцию Allston St
    MWStation *station0114 = [[MWStation alloc] init];
    station0114.identifier = @"station0114";
    [edge0054.elements addObject:station0114];
    
    station0114.nameOriginal = @"Allston Street";
    station0114.geoLocation = CGPointMake(42.348539, -71.137633);
    station0114.mapLocation = CGPointMake(757, 1092.5);

    // Добавляем перегон
    MWHaul *haul0110 = [[MWHaul alloc] init];
    haul0110.identifier = @"haul0110";
    haul0110.length = 262;
    [edge0054.elements addObject:haul0110];

    // Добавляем станцию Griggs St
    MWStation *station0115 = [[MWStation alloc] init];
    station0115.identifier = @"station0115";
    [edge0054.elements addObject:station0115];
    
    station0115.nameOriginal = @"Griggs Street / Long Avenue";
    station0115.geoLocation = CGPointMake(42.348542, -71.134551);
    station0115.mapLocation = CGPointMake(805, 1045.5);

    // Добавляем перегон
    MWHaul *haul0111 = [[MWHaul alloc] init];
    haul0111.identifier = @"haul0111";
    haul0111.length = 330;
    [edge0054.elements addObject:haul0111];

    // Добавляем станцию Harvard Ave
    MWStation *station0116 = [[MWStation alloc] init];
    station0116.identifier = @"station0116";
    [edge0054.elements addObject:station0116];
    
    station0116.nameOriginal = @"Harvard Avenue";
    station0116.geoLocation = CGPointMake(42.350118, -71.131197);
    station0116.mapLocation = CGPointMake(878, 1018.5);

    // Добавляем перегон
    MWHaul *haul0112 = [[MWHaul alloc] init];
    haul0112.identifier = @"haul0112";
    haul0112.length = 607;
    [edge0054.elements addObject:haul0112];

    // Добавляем станцию Packards Corner
    MWStation *station0117 = [[MWStation alloc] init];
    station0117.identifier = @"station0117";
    [edge0054.elements addObject:station0117];
    
    station0117.nameOriginal = @"Packards Corner";
    station0117.geoLocation = CGPointMake(42.352086, -71.124722);
    station0117.mapLocation = CGPointMake(947, 1045.5);

    // Добавляем перегон
    MWHaul *haul0113 = [[MWHaul alloc] init];
    haul0113.identifier = @"haul0113";
    haul0113.length = 269;
    [edge0054.elements addObject:haul0113];

    // Добавляем станцию Babcock St
    MWStation *station0118 = [[MWStation alloc] init];
    station0118.identifier = @"station0118";
    [edge0054.elements addObject:station0118];
    
    station0118.nameOriginal = @"Babcock Street";
    station0118.geoLocation = CGPointMake(42.35169, -71.121547);
    station0118.mapLocation = CGPointMake(996.5, 1094);

    // Добавляем перегон
    MWHaul *haul0114 = [[MWHaul alloc] init];
    haul0114.identifier = @"haul0114";
    haul0114.length = 232;
    [edge0054.elements addObject:haul0114];

    // Добавляем станцию Pleasant St
    MWStation *station0119 = [[MWStation alloc] init];
    station0119.identifier = @"station0119";
    [edge0054.elements addObject:station0119];
    
    station0119.nameOriginal = @"Pleasant Street";
    station0119.geoLocation = CGPointMake(42.351345, -71.118783);
    station0119.mapLocation = CGPointMake(1046.5, 1144);

    // Добавляем перегон
    MWHaul *haul0115 = [[MWHaul alloc] init];
    haul0115.identifier = @"haul0115";
    haul0115.length = 232;
    [edge0054.elements addObject:haul0115];

    // Добавляем станцию St. Paul St
    MWStation *station0120 = [[MWStation alloc] init];
    station0120.identifier = @"station0120";
    [edge0054.elements addObject:station0120];
    
    station0120.nameOriginal = @"St. Paul Street";
    station0120.geoLocation = CGPointMake(42.350997, -71.115997);
    station0120.mapLocation = CGPointMake(1090.5, 1187.5);

    // Добавляем перегон
    MWHaul *haul0116 = [[MWHaul alloc] init];
    haul0116.identifier = @"haul0116";
    haul0116.length = 180;
    [edge0054.elements addObject:haul0116];

    // Добавляем станцию BU West
    MWStation *station0121 = [[MWStation alloc] init];
    station0121.identifier = @"station0121";
    [edge0054.elements addObject:station0121];
    
    station0121.nameOriginal = @"Boston University West";
    station0121.geoLocation = CGPointMake(42.350759, -71.113833);
    station0121.mapLocation = CGPointMake(1140, 1237.5);

    // Добавляем перегон
    MWHaul *haul0117 = [[MWHaul alloc] init];
    haul0117.identifier = @"haul0117";
    haul0117.length = 591;
    [edge0054.elements addObject:haul0117];

    // Добавляем станцию BU Central
    MWStation *station0122 = [[MWStation alloc] init];
    station0122.identifier = @"station0122";
    [edge0054.elements addObject:station0122];
    
    station0122.nameOriginal = @"Boston University Central";
    station0122.geoLocation = CGPointMake(42.34989, -71.106804);
    station0122.mapLocation = CGPointMake(1183, 1280.5);

    // Добавляем перегон
    MWHaul *haul0118 = [[MWHaul alloc] init];
    haul0118.identifier = @"haul0118";
    haul0118.length = 244;
    [edge0054.elements addObject:haul0118];

    // Добавляем станцию BU East
    MWStation *station0123 = [[MWStation alloc] init];
    station0123.identifier = @"station0123";
    [edge0054.elements addObject:station0123];
    
    station0123.nameOriginal = @"Boston University East";
    station0123.geoLocation = CGPointMake(42.349569, -71.103866);
    station0123.mapLocation = CGPointMake(1233, 1330.5);

    // Добавляем перегон
    MWHaul *haul0119 = [[MWHaul alloc] init];
    haul0119.identifier = @"haul0119";
    haul0119.length = 303;
    [edge0054.elements addObject:haul0119];

    // Добавляем станцию Blandford St
    MWStation *station0124 = [[MWStation alloc] init];
    station0124.identifier = @"station0124";
    [edge0054.elements addObject:station0124];
    
    station0124.nameOriginal = @"Blandford Street";
    station0124.geoLocation = CGPointMake(42.349126, -71.100235);
    station0124.mapLocation = CGPointMake(1276.5, 1374);

    // Добавляем перегон
    MWHaul *haul0120 = [[MWHaul alloc] init];
    haul0120.identifier = @"haul0120";
    haul0120.length = 379;
    [edge0054.elements addObject:haul0120];

    // Добавляем станцию Kenmore
    MWStation *station0125 = [[MWStation alloc] init];
    station0125.identifier = @"station0125";
    [edge0054.elements addObject:station0125];
    
    station0125.nameOriginal = @"Kenmore";
    station0125.geoLocation = CGPointMake(42.348925, -71.095608);
    station0125.mapLocation = CGPointMake(1362, 1416.5);
    station0125.platformIndex = 1;

    // Добавляем вершину
    edge0054.finishVertex = vertex0040;

    // Создаем участок линии Kenmore - Hynes Convention Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0055 = [[MWEdge alloc] init];
    edge0055.identifier = @"edge0055";
    edge0055.developmentName = @"Ребро: Kenmore - Hynes Convention Ctr";
    [self.edges addObject:edge0055];
    
    // Добавляем линию
    edge0055.line = line0009;
    
    // Добавляем вершину
    edge0055.startVertex = vertex0040;

    // Добавляем станцию Kenmore
    [edge0055.elements addObject:station0125];

    // Добавляем перегон
    MWHaul *haul0121 = [[MWHaul alloc] init];
    haul0121.identifier = @"haul0121";
    haul0121.length = 709;
    [edge0055.elements addObject:haul0121];

    // Добавляем станцию Hynes Convention Ctr
    MWStation *station0126 = [[MWStation alloc] init];
    station0126.identifier = @"station0126";
    [edge0055.elements addObject:station0126];
    
    station0126.nameOriginal = @"Hynes Convention Center";
    station0126.geoLocation = CGPointMake(42.347806, -71.087828);
    station0126.mapLocation = CGPointMake(1501, 1416);
    station0126.platformIndex = 1;

    // Добавляем вершину
    edge0055.finishVertex = vertex0039;

    // Создаем участок линии Hynes Convention Ctr - Copley
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0056 = [[MWEdge alloc] init];
    edge0056.identifier = @"edge0056";
    edge0056.developmentName = @"Ребро: Hynes Convention Ctr - Copley";
    [self.edges addObject:edge0056];
    
    // Добавляем линию
    edge0056.line = line0009;
    
    // Добавляем вершину
    edge0056.startVertex = vertex0039;

    // Добавляем станцию Hynes Convention Ctr
    [edge0056.elements addObject:station0126];

    // Добавляем перегон
    MWHaul *haul0122 = [[MWHaul alloc] init];
    haul0122.identifier = @"haul0122";
    haul0122.length = 930;
    [edge0056.elements addObject:haul0122];

    // Добавляем станцию Copley
    MWStation *station0127 = [[MWStation alloc] init];
    station0127.identifier = @"station0127";
    [edge0056.elements addObject:station0127];
    
    station0127.nameOriginal = @"Copley";
    station0127.geoLocation = CGPointMake(42.350278, -71.0775);
    station0127.mapLocation = CGPointMake(1639, 1416);
    station0127.platformIndex = 1;

    // Добавляем вершину
    edge0056.finishVertex = vertex0037;

    // Создаем участок линии Copley - Arlington
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0057 = [[MWEdge alloc] init];
    edge0057.identifier = @"edge0057";
    edge0057.developmentName = @"Ребро: Copley - Arlington";
    [self.edges addObject:edge0057];
    
    // Добавляем линию
    edge0057.line = line0009;
    
    // Добавляем вершину
    edge0057.startVertex = vertex0037;

    // Добавляем станцию Copley
    [edge0057.elements addObject:station0127];

    // Добавляем перегон
    MWHaul *haul0123 = [[MWHaul alloc] init];
    haul0123.identifier = @"haul0123";
    haul0123.length = 590;
    [edge0057.elements addObject:haul0123];

    // Добавляем станцию Arlington
    MWStation *station0128 = [[MWStation alloc] init];
    station0128.identifier = @"station0128";
    [edge0057.elements addObject:station0128];
    
    station0128.nameOriginal = @"Arlington";
    station0128.geoLocation = CGPointMake(42.35186, -71.070728);
    station0128.mapLocation = CGPointMake(1777, 1416);
    station0128.platformIndex = 1;

    // Добавляем вершину
    edge0057.finishVertex = vertex0036;

    // Создаем участок линии Arlington - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0058 = [[MWEdge alloc] init];
    edge0058.identifier = @"edge0058";
    edge0058.developmentName = @"Ребро: Arlington - Boylston";
    [self.edges addObject:edge0058];
    
    // Добавляем линию
    edge0058.line = line0009;
    
    // Добавляем вершину
    edge0058.startVertex = vertex0036;

    // Добавляем станцию Arlington
    [edge0058.elements addObject:station0128];

    // Добавляем перегон
    MWHaul *haul0124 = [[MWHaul alloc] init];
    haul0124.identifier = @"haul0124";
    haul0124.length = 502;
    [edge0058.elements addObject:haul0124];

    // Добавляем станцию Boylston
    MWStation *station0129 = [[MWStation alloc] init];
    station0129.identifier = @"station0129";
    [edge0058.elements addObject:station0129];
    
    station0129.nameOriginal = @"Boylston";
    station0129.geoLocation = CGPointMake(42.3525, -71.064722);
    station0129.mapLocation = CGPointMake(1915, 1411.5);
    station0129.platformIndex = 1;
    
    // Добавляем вершину
    edge0058.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0059 = [[MWEdge alloc] init];
    edge0059.identifier = @"edge0059";
    edge0059.developmentName = @"Ребро: Boylston - Park St";
    [self.edges addObject:edge0059];
    
    // Добавляем линию
    edge0059.line = line0009;
    
    // Добавляем вершину
    edge0059.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0059.elements addObject:station0129];
    
    // Добавляем перегон
    MWHaul *haul0125 = [[MWHaul alloc] init];
    haul0125.identifier = @"haul0125";
    haul0125.length = 487;
    [edge0059.elements addObject:haul0125];

    // Добавляем станцию Park St
    MWStation *station0130 = [[MWStation alloc] init];
    station0130.identifier = @"station0130";
    [edge0059.elements addObject:station0130];
    
    station0130.nameOriginal = @"Park Street";
    station0130.geoLocation = CGPointMake(42.356389, -71.0625);
    station0130.mapLocation = CGPointMake(2065.5, 1275.5);
    station0130.platformIndex = 1;

    // Добавляем вершину
    edge0059.finishVertex = vertex0002;

    ////////////////////////////////////////////////////////////////
    // 10. Green Line C
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Cleveland Circle - Kenmore
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0060 = [[MWEdge alloc] init];
    edge0060.identifier = @"edge0060";
    edge0060.developmentName = @"Ребро: Cleveland Circle - Kenmore";
    [self.edges addObject:edge0060];
    
    // Добавляем линию
    edge0060.line = line0010;
    
    // Добавляем вершину
    edge0060.startVertex = vertex0042;
    
    // Добавляем станцию Cleveland Circle
    MWStation *station0131 = [[MWStation alloc] init];
    station0131.identifier = @"station0131";
    [edge0060.elements addObject:station0131];
    
    station0131.nameOriginal = @"Cleveland Circle";
    station0131.geoLocation = CGPointMake(42.336217, -71.149006);
    station0131.mapLocation = CGPointMake(461, 1716);

    // Добавляем перегон
    MWHaul *haul0126 = [[MWHaul alloc] init];
    haul0126.identifier = @"haul0126";
    haul0126.length = 315;
    [edge0060.elements addObject:haul0126];

    // Добавляем станцию Englewood Ave
    MWStation *station0132 = [[MWStation alloc] init];
    station0132.identifier = @"station0132";
    [edge0060.elements addObject:station0132];
    
    station0132.nameOriginal = @"Englewood Avenue";
    station0132.geoLocation = CGPointMake(42.337049, -71.145357);
    station0132.mapLocation = CGPointMake(540.5, 1672.5);

    // Добавляем перегон
    MWHaul *haul0127 = [[MWHaul alloc] init];
    haul0127.identifier = @"haul0127";
    haul0127.length = 327;
    [edge0060.elements addObject:haul0127];

    // Добавляем станцию Dean Rd
    MWStation *station0133 = [[MWStation alloc] init];
    station0133.identifier = @"station0133";
    [edge0060.elements addObject:station0133];
    
    station0133.nameOriginal = @"Dean Road";
    station0133.geoLocation = CGPointMake(42.337844, -71.141547);
    station0133.mapLocation = CGPointMake(590.5, 1622.5);

    // Добавляем перегон
    MWHaul *haul0128 = [[MWHaul alloc] init];
    haul0128.identifier = @"haul0128";
    haul0128.length = 244;
    [edge0060.elements addObject:haul0128];

    // Добавляем станцию Tappan St
    MWStation *station0134 = [[MWStation alloc] init];
    station0134.identifier = @"station0134";
    [edge0060.elements addObject:station0134];
    
    station0134.nameOriginal = @"Tappan Street";
    station0134.geoLocation = CGPointMake(42.338469, -71.138705);
    station0134.mapLocation = CGPointMake(640, 1573);

    // Добавляем перегон
    MWHaul *haul0129 = [[MWHaul alloc] init];
    haul0129.identifier = @"haul0129";
    haul0129.length = 285;
    [edge0060.elements addObject:haul0129];

    // Добавляем станцию Washington Sq
    MWStation *station0135 = [[MWStation alloc] init];
    station0135.identifier = @"station0135";
    [edge0060.elements addObject:station0135];
    
    station0135.nameOriginal = @"Washington Square";
    station0135.geoLocation = CGPointMake(42.339256, -71.135386);
    station0135.mapLocation = CGPointMake(690, 1523.5);
    
    // Добавляем перегон
    MWHaul *haul0130 = [[MWHaul alloc] init];
    haul0130.identifier = @"haul0130";
    haul0130.length = 348;
    [edge0060.elements addObject:haul0130];

    // Добавляем станцию Fairbanks St
    MWStation *station0136 = [[MWStation alloc] init];
    station0136.identifier = @"station0136";
    [edge0060.elements addObject:station0136];
    
    station0136.nameOriginal = @"Fairbanks";
    station0136.geoLocation = CGPointMake(42.339472, -71.131303);
    station0136.mapLocation = CGPointMake(739.5, 1473.5);

    // Добавляем перегон
    MWHaul *haul0131 = [[MWHaul alloc] init];
    haul0131.identifier = @"haul0131";
    haul0131.length = 164;
    [edge0060.elements addObject:haul0131];

    // Добавляем станцию Brandon Hall
    MWStation *station0137 = [[MWStation alloc] init];
    station0137.identifier = @"station0137";
    [edge0060.elements addObject:station0137];
    
    station0137.nameOriginal = @"Brandon Hall";
    station0137.geoLocation = CGPointMake(42.339683, -71.129327);
    station0137.mapLocation = CGPointMake(789, 1424);

    // Добавляем перегон
    MWHaul *haul0132 = [[MWHaul alloc] init];
    haul0132.identifier = @"haul0132";
    haul0132.length = 372;
    [edge0060.elements addObject:haul0132];

    // Добавляем станцию Summit Ave
    MWStation *station0138 = [[MWStation alloc] init];
    station0138.identifier = @"station0138";
    [edge0060.elements addObject:station0138];
    
    station0138.nameOriginal = @"Summit Avenue";
    station0138.geoLocation = CGPointMake(42.340946, -71.125182);
    station0138.mapLocation = CGPointMake(839, 1374);

    // Добавляем перегон
    MWHaul *haul0133 = [[MWHaul alloc] init];
    haul0133.identifier = @"haul0133";
    haul0133.length = 390;
    [edge0060.elements addObject:haul0133];

    // Добавляем станцию Coolidge Corner
    MWStation *station0139 = [[MWStation alloc] init];
    station0139.identifier = @"station0139";
    [edge0060.elements addObject:station0139];
    
    station0139.nameOriginal = @"Coolidge Corner";
    station0139.geoLocation = CGPointMake(42.342226, -71.120888);
    station0139.mapLocation = CGPointMake(878, 1334.5);

    // Добавляем перегон
    MWHaul *haul0134 = [[MWHaul alloc] init];
    haul0134.identifier = @"haul0134";
    haul0134.length = 362;
    [edge0060.elements addObject:haul0134];

    // Добавляем станцию St. Paul St
    MWStation *station0140 = [[MWStation alloc] init];
    station0140.identifier = @"station0140";
    [edge0060.elements addObject:station0140];
    
    station0140.nameOriginal = @"St. Paul Street";
    station0140.geoLocation = CGPointMake(42.343366, -71.116759);
    station0140.mapLocation = CGPointMake(930.5, 1282.5);

    // Добавляем перегон
    MWHaul *haul0135 = [[MWHaul alloc] init];
    haul0135.identifier = @"haul0135";
    haul0135.length = 254;
    [edge0060.elements addObject:haul0135];

    // Добавляем станцию Kent St
    MWStation *station0141 = [[MWStation alloc] init];
    station0141.identifier = @"station0141";
    [edge0060.elements addObject:station0141];
    
    station0141.nameOriginal = @"Kent Street";
    station0141.geoLocation = CGPointMake(42.344125, -71.113885);
    station0141.mapLocation = CGPointMake(1089, 1292);

    // Добавляем перегон
    MWHaul *haul0136 = [[MWHaul alloc] init];
    haul0136.identifier = @"haul0136";
    haul0136.length = 244;
    [edge0060.elements addObject:haul0136];

    // Добавляем станцию Hawes St
    MWStation *station0142 = [[MWStation alloc] init];
    station0142.identifier = @"station0142";
    [edge0060.elements addObject:station0142];
    
    station0142.nameOriginal = @"Hawes Street";
    station0142.geoLocation = CGPointMake(42.34487, -71.111129);
    station0142.mapLocation = CGPointMake(1138.5, 1341.5);

    // Добавляем перегон
    MWHaul *haul0137 = [[MWHaul alloc] init];
    haul0137.identifier = @"haul0137";
    haul0137.length = 332;
    [edge0060.elements addObject:haul0137];

    // Добавляем станцию St. Marys St
    MWStation *station0143 = [[MWStation alloc] init];
    station0143.identifier = @"station0143";
    [edge0060.elements addObject:station0143];
    
    station0143.nameOriginal = @"St. Marys Street";
    station0143.geoLocation = CGPointMake(42.345944, -71.107383);
    station0143.mapLocation = CGPointMake(1182, 1385.5);
    
    // Добавляем перегон
    MWHaul *haul0138 = [[MWHaul alloc] init];
    haul0138.identifier = @"haul0138";
    haul0138.length = 1030;
    [edge0060.elements addObject:haul0138];

    // Добавляем станцию Kenmore
    MWStation *station0144 = [[MWStation alloc] init];
    station0144.identifier = @"station0144";
    [edge0060.elements addObject:station0144];
    
    station0144.nameOriginal = @"Kenmore";
    station0144.geoLocation = CGPointMake(42.348925, -71.095608);
    station0144.mapLocation = CGPointMake(1362, 1416.5);
    station0144.platformIndex = 1;

    // Добавляем вершину
    edge0060.finishVertex = vertex0040;

    // Создаем участок линии Kenmore - Hynes Convention Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0061 = [[MWEdge alloc] init];
    edge0061.identifier = @"edge0061";
    edge0061.developmentName = @"Ребро: Kenmore - Hynes Convention Ctr";
    [self.edges addObject:edge0061];
    
    // Добавляем линию
    edge0061.line = line0010;
    
    // Добавляем вершину
    edge0061.startVertex = vertex0040;

    // Добавляем станцию Kenmore
    [edge0061.elements addObject:station0144];

    // Добавляем перегон
    MWHaul *haul0139 = [[MWHaul alloc] init];
    haul0139.identifier = @"haul0139";
    haul0139.length = 709;
    [edge0061.elements addObject:haul0139];

    // Добавляем станцию Hynes Convention Ctr
    MWStation *station0145 = [[MWStation alloc] init];
    station0145.identifier = @"station0145";
    [edge0061.elements addObject:station0145];
    
    station0145.nameOriginal = @"Hynes Convention Center";
    station0145.geoLocation = CGPointMake(42.347806, -71.087828);
    station0145.mapLocation = CGPointMake(1501, 1416);
    station0145.platformIndex = 1;

    // Добавляем вершину
    edge0061.finishVertex = vertex0039;

    // Создаем участок линии Hynes Convention Ctr - Copley
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0062 = [[MWEdge alloc] init];
    edge0062.identifier = @"edge0062";
    edge0062.developmentName = @"Ребро: Hynes Convention Ctr - Copley";
    [self.edges addObject:edge0062];
    
    // Добавляем линию
    edge0062.line = line0010;
    
    // Добавляем вершину
    edge0062.startVertex = vertex0039;

    // Добавляем станцию Hynes Convention Ctr
    [edge0062.elements addObject:station0145];

    // Добавляем перегон
    MWHaul *haul0140 = [[MWHaul alloc] init];
    haul0140.identifier = @"haul0140";
    haul0140.length = 930;
    [edge0062.elements addObject:haul0140];
    
    // Добавляем станцию Copley
    MWStation *station0146 = [[MWStation alloc] init];
    station0146.identifier = @"station0146";
    [edge0062.elements addObject:station0146];
    
    station0146.nameOriginal = @"Copley";
    station0146.geoLocation = CGPointMake(42.350278, -71.0775);
    station0146.mapLocation = CGPointMake(1639, 1416);
    station0146.platformIndex = 1;
    
    // Добавляем вершину
    edge0062.finishVertex = vertex0037;

    // Создаем участок линии Copley - Arlington
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0063 = [[MWEdge alloc] init];
    edge0063.identifier = @"edge0063";
    edge0063.developmentName = @"Ребро: Copley - Arlington";
    [self.edges addObject:edge0063];
    
    // Добавляем линию
    edge0063.line = line0010;
    
    // Добавляем вершину
    edge0063.startVertex = vertex0037;

    // Добавляем станцию Copley
    [edge0063.elements addObject:station0146];

    // Добавляем перегон
    MWHaul *haul0141 = [[MWHaul alloc] init];
    haul0141.identifier = @"haul0141";
    haul0141.length = 590;
    [edge0063.elements addObject:haul0141];

    // Добавляем станцию Arlington
    MWStation *station0147 = [[MWStation alloc] init];
    station0147.identifier = @"station0147";
    [edge0063.elements addObject:station0147];
    
    station0147.nameOriginal = @"Arlington";
    station0147.geoLocation = CGPointMake(42.35186, -71.070728);
    station0147.mapLocation = CGPointMake(1777, 1416.5);
    station0147.platformIndex = 1;

    // Добавляем вершину
    edge0063.finishVertex = vertex0036;

    // Создаем участок линии Arlington - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0064 = [[MWEdge alloc] init];
    edge0064.identifier = @"edge0064";
    edge0064.developmentName = @"Ребро: Arlington - Boylston";
    [self.edges addObject:edge0064];
    
    // Добавляем линию
    edge0064.line = line0010;
    
    // Добавляем вершину
    edge0064.startVertex = vertex0036;

    // Добавляем станцию Arlington
    [edge0064.elements addObject:station0147];

    // Добавляем перегон
    MWHaul *haul0142 = [[MWHaul alloc] init];
    haul0142.identifier = @"haul0142";
    haul0142.length = 502;
    [edge0064.elements addObject:haul0142];
    
    // Добавляем станцию Boylston
    MWStation *station0148 = [[MWStation alloc] init];
    station0148.identifier = @"station0148";
    [edge0064.elements addObject:station0148];
    
    station0148.nameOriginal = @"Boylston";
    station0148.geoLocation = CGPointMake(42.3525, -71.064722);
    station0148.mapLocation = CGPointMake(1915, 1411.5);
    station0148.platformIndex = 1;
    
    // Добавляем вершину
    edge0064.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0065 = [[MWEdge alloc] init];
    edge0065.identifier = @"edge0065";
    edge0065.developmentName = @"Ребро: Boylston - Park St";
    [self.edges addObject:edge0065];
    
    // Добавляем линию
    edge0065.line = line0010;
    
    // Добавляем вершину
    edge0065.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0065.elements addObject:station0148];

    // Добавляем перегон
    MWHaul *haul0143 = [[MWHaul alloc] init];
    haul0143.identifier = @"haul0143";
    haul0143.length = 487;
    [edge0065.elements addObject:haul0143];
    
    // Добавляем станцию Park St
    MWStation *station0149 = [[MWStation alloc] init];
    station0149.identifier = @"station0149";
    [edge0065.elements addObject:station0149];
    
    station0149.nameOriginal = @"Park Street";
    station0149.geoLocation = CGPointMake(42.356389, -71.0625);
    station0149.mapLocation = CGPointMake(2065.5, 1275.5);
    station0149.platformIndex = 1;
    
    // Добавляем вершину
    edge0065.finishVertex = vertex0002;

    // Создаем участок линии Park St - Government Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0066 = [[MWEdge alloc] init];
    edge0066.identifier = @"edge0066";
    edge0066.developmentName = @"Ребро: Park St - Government Center";
    [self.edges addObject:edge0066];
    
    // Добавляем линию
    edge0066.line = line0010;
    
    // Добавляем вершину
    edge0066.startVertex = vertex0002;

    // Добавляем станцию Park St
    [edge0066.elements addObject:station0149];

    // Добавляем перегон
    MWHaul *haul0144 = [[MWHaul alloc] init];
    haul0144.identifier = @"haul0144";
    haul0144.length = 432;
    [edge0066.elements addObject:haul0144];

    // Добавляем станцию Gov’t. Ctr
    MWStation *station0150 = [[MWStation alloc] init];
    station0150.identifier = @"station0150";
    [edge0066.elements addObject:station0150];
    
    station0150.nameOriginal = @"Government Center";
    station0150.geoLocation = CGPointMake(42.359444, -71.059444);
    station0150.mapLocation = CGPointMake(2167.5, 1172.5);
    station0150.platformIndex = 1;
    
    // Добавляем вершину
    edge0066.finishVertex = vertex0017;

    // Создаем участок линии Government Center - Haymarket
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0067 = [[MWEdge alloc] init];
    edge0067.identifier = @"edge0067";
    edge0067.developmentName = @"Ребро: Government Center - Haymarket";
    [self.edges addObject:edge0067];
    
    // Добавляем линию
    edge0067.line = line0010;
    
    // Добавляем вершину
    edge0067.startVertex = vertex0017;

    // Добавляем станцию Gov’t. Ctr
    [edge0067.elements addObject:station0150];
    
    // Добавляем перегон
    MWHaul *haul0145 = [[MWHaul alloc] init];
    haul0145.identifier = @"haul0145";
    haul0145.length = 450;
    [edge0067.elements addObject:haul0145];

    // Добавляем станцию Haymarket
    MWStation *station0151 = [[MWStation alloc] init];
    station0151.identifier = @"station0151";
    [edge0067.elements addObject:station0151];
    
    station0151.nameOriginal = @"Haymarket";
    station0151.geoLocation = CGPointMake(42.3633, -71.0582);
    station0151.mapLocation = CGPointMake(2270, 1071);
    station0151.platformIndex = 1;
    
    // Добавляем вершину
    edge0067.finishVertex = vertex0013;

    // Создаем участок линии Haymarket - North Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0068 = [[MWEdge alloc] init];
    edge0068.identifier = @"edge0068";
    edge0068.developmentName = @"Ребро: Haymarket - North Station";
    [self.edges addObject:edge0068];
    
    // Добавляем линию
    edge0068.line = line0010;
    
    // Добавляем вершину
    edge0068.startVertex = vertex0013;

    // Добавляем станцию Haymarket
    [edge0068.elements addObject:station0151];
    
    // Добавляем перегон
    MWHaul *haul0146 = [[MWHaul alloc] init];
    haul0146.identifier = @"haul0146";
    haul0146.length = 370;
    [edge0068.elements addObject:haul0146];

    // Добавляем станцию North Station
    MWStation *station0152 = [[MWStation alloc] init];
    station0152.identifier = @"station0152";
    [edge0068.elements addObject:station0152];
    
    station0152.nameOriginal = @"North Station";
    station0152.geoLocation = CGPointMake(42.3657, -71.061);
    station0152.mapLocation = CGPointMake(2269.5, 906.5);
    station0152.platformIndex = 1;
    
    // Добавляем вершину
    edge0068.finishVertex = vertex0014;

    ////////////////////////////////////////////////////////////////
    // 11. Green Line D
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Riverside - Kenmore
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0069 = [[MWEdge alloc] init];
    edge0069.identifier = @"edge0069";
    edge0069.developmentName = @"Ребро: Riverside - Kenmore";
    [self.edges addObject:edge0069];
    
    // Добавляем линию
    edge0069.line = line0011;
    
    // Добавляем вершину
    edge0069.startVertex = vertex0043;
    
    // Добавляем станцию Riverside
    MWStation *station0153 = [[MWStation alloc] init];
    station0153.identifier = @"station0153";
    [edge0069.elements addObject:station0153];
    
    station0153.nameOriginal = @"Riverside";
    station0153.geoLocation = CGPointMake(42.3372, -71.2521);
    station0153.mapLocation = CGPointMake(602.5, 2076);

    // Добавляем перегон
    MWHaul *haul0147 = [[MWHaul alloc] init];
    haul0147.identifier = @"haul0147";
    haul0147.length = 838;
    [edge0069.elements addObject:haul0147];

    // Добавляем станцию Woodland
    MWStation *station0154 = [[MWStation alloc] init];
    station0154.identifier = @"station0154";
    [edge0069.elements addObject:station0154];
    
    station0154.nameOriginal = @"Woodland";
    station0154.geoLocation = CGPointMake(42.333056, -71.243611);
    station0154.mapLocation = CGPointMake(682, 2033.5);

    // Добавляем перегон
    MWHaul *haul0148 = [[MWHaul alloc] init];
    haul0148.identifier = @"haul0148";
    haul0148.length = 1344;
    [edge0069.elements addObject:haul0148];

    // Добавляем станцию Waban
    MWStation *station0155 = [[MWStation alloc] init];
    station0155.identifier = @"station0155";
    [edge0069.elements addObject:station0155];
    
    station0155.nameOriginal = @"Waban";
    station0155.geoLocation = CGPointMake(42.325833, -71.230556);
    station0155.mapLocation = CGPointMake(732, 1983.5);

    // Добавляем перегон
    MWHaul *haul0149 = [[MWHaul alloc] init];
    haul0149.identifier = @"haul0149";
    haul0149.length = 1402;
    [edge0069.elements addObject:haul0149];

    // Добавляем станцию Eliot
    MWStation *station0156 = [[MWStation alloc] init];
    station0156.identifier = @"station0156";
    [edge0069.elements addObject:station0156];
    
    station0156.nameOriginal = @"Eliot";
    station0156.geoLocation = CGPointMake(42.318889, -71.216389);
    station0156.mapLocation = CGPointMake(782, 1934);
    
    // Добавляем перегон
    MWHaul *haul0150 = [[MWHaul alloc] init];
    haul0150.identifier = @"haul0150";
    haul0150.length = 1171;
    [edge0069.elements addObject:haul0150];

    // Добавляем станцию Newton Highlands
    MWStation *station0157 = [[MWStation alloc] init];
    station0157.identifier = @"station0157";
    [edge0069.elements addObject:station0157];
    
    station0157.nameOriginal = @"Newton Highlands";
    station0157.geoLocation = CGPointMake(42.3225, -71.205556);
    station0157.mapLocation = CGPointMake(831.5, 1884);

    // Добавляем перегон
    MWHaul *haul0151 = [[MWHaul alloc] init];
    haul0151.identifier = @"haul0151";
    haul0151.length = 1328;
    [edge0069.elements addObject:haul0151];

    // Добавляем станцию Newton Centre
    MWStation *station0158 = [[MWStation alloc] init];
    station0158.identifier = @"station0158";
    [edge0069.elements addObject:station0158];
    
    station0158.nameOriginal = @"Newton Centre";
    station0158.geoLocation = CGPointMake(42.329444, -71.1925);
    station0158.mapLocation = CGPointMake(883, 1833);

    // Добавляем перегон
    MWHaul *haul0152 = [[MWHaul alloc] init];
    haul0152.identifier = @"haul0152";
    haul0152.length = 2381;
    [edge0069.elements addObject:haul0152];

    // Добавляем станцию Chestnut Hill
    MWStation *station0159 = [[MWStation alloc] init];
    station0159.identifier = @"station0159";
    [edge0069.elements addObject:station0159];
    
    station0159.nameOriginal = @"Chestnut Hill";
    station0159.geoLocation = CGPointMake(42.326944, -71.164722);
    station0159.mapLocation = CGPointMake(933, 1783.5);

    // Добавляем перегон
    MWHaul *haul0153 = [[MWHaul alloc] init];
    haul0153.identifier = @"haul0153";
    haul0153.length = 1668;
    [edge0069.elements addObject:haul0153];

    // Добавляем станцию Reservoir
    MWStation *station0160 = [[MWStation alloc] init];
    station0160.identifier = @"station0160";
    [edge0069.elements addObject:station0160];
    
    station0160.nameOriginal = @"Reservoir";
    station0160.geoLocation = CGPointMake(42.335278, -71.148056);
    station0160.mapLocation = CGPointMake(982.5, 1734);

    // Добавляем перегон
    MWHaul *haul0154 = [[MWHaul alloc] init];
    haul0154.identifier = @"haul0154";
    haul0154.length = 624;
    [edge0069.elements addObject:haul0154];

    // Добавляем станцию Beaconsfield
    MWStation *station0161 = [[MWStation alloc] init];
    station0161.identifier = @"station0161";
    [edge0069.elements addObject:station0161];
    
    station0161.nameOriginal = @"Beaconsfield";
    station0161.geoLocation = CGPointMake(42.335833, -71.140556);
    station0161.mapLocation = CGPointMake(1032, 1684.5);

    // Добавляем перегон
    MWHaul *haul0155 = [[MWHaul alloc] init];
    haul0155.identifier = @"haul0155";
    haul0155.length = 1282;
    [edge0069.elements addObject:haul0155];

    // Добавляем станцию Brookline Hills
    MWStation *station0162 = [[MWStation alloc] init];
    station0162.identifier = @"station0162";
    [edge0069.elements addObject:station0162];
    
    station0162.nameOriginal = @"Brookline Hills";
    station0162.geoLocation = CGPointMake(42.331389, -71.126667);
    station0162.mapLocation = CGPointMake(1082, 1635);

    // Добавляем перегон
    MWHaul *haul0156 = [[MWHaul alloc] init];
    haul0156.identifier = @"haul0156";
    haul0156.length = 830;
    [edge0069.elements addObject:haul0156];

    // Добавляем станцию Brookline Village
    MWStation *station0163 = [[MWStation alloc] init];
    station0163.identifier = @"station0163";
    [edge0069.elements addObject:station0163];
    
    station0163.nameOriginal = @"Brookline Village";
    station0163.geoLocation = CGPointMake(42.3325, -71.116944);

    // Добавляем перегон
    MWHaul *haul0157 = [[MWHaul alloc] init];
    haul0157.identifier = @"haul0157";
    haul0157.length = 1200;
    [edge0069.elements addObject:haul0157];

    // Добавляем станцию Longwood
    MWStation *station0164 = [[MWStation alloc] init];
    station0164.identifier = @"station0164";
    [edge0069.elements addObject:station0164];
    
    station0164.nameOriginal = @"Longwood";
    station0164.geoLocation = CGPointMake(42.341667, -71.11);

    // Добавляем перегон
    MWHaul *haul0158 = [[MWHaul alloc] init];
    haul0158.identifier = @"haul0158";
    haul0158.length = 572;
    [edge0069.elements addObject:haul0158];

    // Добавляем станцию Fenway
    MWStation *station0165 = [[MWStation alloc] init];
    station0165.identifier = @"station0165";
    [edge0069.elements addObject:station0165];
    
    station0165.nameOriginal = @"Fenway";
    station0165.geoLocation = CGPointMake(42.345042, -71.104825);

    // Добавляем перегон
    MWHaul *haul0159 = [[MWHaul alloc] init];
    haul0159.identifier = @"haul0159";
    haul0159.length = 879;
    [edge0069.elements addObject:haul0159];

    // Добавляем станцию Kenmore
    MWStation *station0166 = [[MWStation alloc] init];
    station0166.identifier = @"station0166";
    [edge0069.elements addObject:station0166];
    
    station0166.nameOriginal = @"Kenmore";
    station0166.geoLocation = CGPointMake(42.348925, -71.095608);
    station0166.platformIndex = 1;

    // Добавляем вершину
    edge0069.finishVertex = vertex0040;

    // Создаем участок линии Kenmore - Hynes Convention Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0070 = [[MWEdge alloc] init];
    edge0070.identifier = @"edge0070";
    edge0070.developmentName = @"Ребро: Kenmore - Hynes Convention Ctr";
    [self.edges addObject:edge0070];
    
    // Добавляем линию
    edge0070.line = line0011;
    
    // Добавляем вершину
    edge0070.startVertex = vertex0040;

    // Добавляем станцию Kenmore
    [edge0070.elements addObject:station0166];
    
    // Добавляем перегон
    MWHaul *haul0160 = [[MWHaul alloc] init];
    haul0160.identifier = @"haul0160";
    haul0160.length = 709;
    [edge0070.elements addObject:haul0160];

    // Добавляем станцию Hynes Convention Ctr
    MWStation *station0167 = [[MWStation alloc] init];
    station0167.identifier = @"station0167";
    [edge0070.elements addObject:station0167];
    
    station0167.nameOriginal = @"Hynes Convention Center";
    station0167.geoLocation = CGPointMake(42.347806, -71.087828);
    station0167.platformIndex = 1;

    // Добавляем вершину
    edge0070.finishVertex = vertex0039;

    // Создаем участок линии Hynes Convention Ctr - Copley
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0071 = [[MWEdge alloc] init];
    edge0071.identifier = @"edge0071";
    edge0071.developmentName = @"Ребро: Hynes Convention Ctr - Copley";
    [self.edges addObject:edge0071];
    
    // Добавляем линию
    edge0071.line = line0011;
    
    // Добавляем вершину
    edge0071.startVertex = vertex0039;

    // Добавляем станцию Hynes Convention Ctr
    [edge0071.elements addObject:station0167];

    // Добавляем перегон
    MWHaul *haul0161 = [[MWHaul alloc] init];
    haul0161.identifier = @"haul0161";
    haul0161.length = 930;
    [edge0071.elements addObject:haul0161];

    // Добавляем станцию Copley
    MWStation *station0168 = [[MWStation alloc] init];
    station0168.identifier = @"station0168";
    [edge0071.elements addObject:station0168];
    
    station0168.nameOriginal = @"Copley";
    station0168.geoLocation = CGPointMake(42.350278, -71.0775);
    station0168.platformIndex = 1;
    
    // Добавляем вершину
    edge0071.finishVertex = vertex0037;

    // Создаем участок линии Copley - Arlington
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0072 = [[MWEdge alloc] init];
    edge0072.identifier = @"edge0072";
    edge0072.developmentName = @"Ребро: Copley - Arlington";
    [self.edges addObject:edge0072];
    
    // Добавляем линию
    edge0072.line = line0011;
    
    // Добавляем вершину
    edge0072.startVertex = vertex0037;

    // Добавляем станцию Copley
    [edge0072.elements addObject:station0168];
    
    // Добавляем перегон
    MWHaul *haul0162 = [[MWHaul alloc] init];
    haul0162.identifier = @"haul0162";
    haul0162.length = 590;
    [edge0072.elements addObject:haul0162];

    // Добавляем станцию Arlington
    MWStation *station0169 = [[MWStation alloc] init];
    station0169.identifier = @"station0169";
    [edge0072.elements addObject:station0169];
    
    station0169.nameOriginal = @"Arlington";
    station0169.geoLocation = CGPointMake(42.35186, -71.070728);
    station0169.platformIndex = 1;
    
    // Добавляем вершину
    edge0072.finishVertex = vertex0036;

    // Создаем участок линии Arlington - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0073 = [[MWEdge alloc] init];
    edge0073.identifier = @"edge0073";
    edge0073.developmentName = @"Ребро: Arlington - Boylston";
    [self.edges addObject:edge0073];
    
    // Добавляем линию
    edge0073.line = line0011;
    
    // Добавляем вершину
    edge0073.startVertex = vertex0036;

    // Добавляем станцию Arlington
    [edge0073.elements addObject:station0169];
    
    // Добавляем перегон
    MWHaul *haul0163 = [[MWHaul alloc] init];
    haul0163.identifier = @"haul0163";
    haul0163.length = 502;
    [edge0073.elements addObject:haul0163];

    // Добавляем станцию Boylston
    MWStation *station0170 = [[MWStation alloc] init];
    station0170.identifier = @"station0170";
    [edge0073.elements addObject:station0170];
    
    station0170.nameOriginal = @"Boylston";
    station0170.geoLocation = CGPointMake(42.3525, -71.064722);
    station0170.platformIndex = 1;
    
    // Добавляем вершину
    edge0073.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0074 = [[MWEdge alloc] init];
    edge0074.identifier = @"edge0074";
    edge0074.developmentName = @"Ребро: Boylston - Park St";
    [self.edges addObject:edge0074];
    
    // Добавляем линию
    edge0074.line = line0011;
    
    // Добавляем вершину
    edge0074.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0074.elements addObject:station0170];
    
    // Добавляем перегон
    MWHaul *haul0164 = [[MWHaul alloc] init];
    haul0164.identifier = @"haul0164";
    haul0164.length = 487;
    [edge0074.elements addObject:haul0164];

    // Добавляем станцию Park St
    MWStation *station0171 = [[MWStation alloc] init];
    station0171.identifier = @"station0171";
    [edge0074.elements addObject:station0171];
    
    station0171.nameOriginal = @"Park Street";
    station0171.geoLocation = CGPointMake(42.356389, -71.0625);
    station0171.platformIndex = 1;
    
    // Добавляем вершину
    edge0074.finishVertex = vertex0002;

    ////////////////////////////////////////////////////////////////
    // 12. Green Line E
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Heath - Copley
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0075 = [[MWEdge alloc] init];
    edge0075.identifier = @"edge0075";
    edge0075.developmentName = @"Ребро: Heath - Copley";
    [self.edges addObject:edge0075];
    
    // Добавляем линию
    edge0075.line = line0012;
    
    // Добавляем вершину
    edge0075.startVertex = vertex0038;

    // Добавляем станцию Heath
    MWStation *station0172 = [[MWStation alloc] init];
    station0172.identifier = @"station0172";
    [edge0075.elements addObject:station0172];
    
    station0172.nameOriginal = @"Heath Street";
    station0172.geoLocation = CGPointMake(42.32868, -71.11068);

    // Добавляем перегон
    MWHaul *haul0165 = [[MWHaul alloc] init];
    haul0165.identifier = @"haul0165";
    haul0165.length = 188;
    [edge0075.elements addObject:haul0165];

    // Добавляем станцию Back of the Hill
    MWStation *station0173 = [[MWStation alloc] init];
    station0173.identifier = @"station0173";
    [edge0075.elements addObject:station0173];
    
    station0173.nameOriginal = @"Back of the Hill";
    station0173.geoLocation = CGPointMake(42.330278, -71.111389);

    // Добавляем перегон
    MWHaul *haul0166 = [[MWHaul alloc] init];
    haul0166.identifier = @"haul0166";
    haul0166.length = 166;
    [edge0075.elements addObject:haul0166];

    // Добавляем станцию Riverway
    MWStation *station0174 = [[MWStation alloc] init];
    station0174.identifier = @"station0174";
    [edge0075.elements addObject:station0174];
    
    station0174.nameOriginal = @"Riverway";
    station0174.geoLocation = CGPointMake(42.331694, -71.112);

    // Добавляем перегон
    MWHaul *haul0167 = [[MWHaul alloc] init];
    haul0167.identifier = @"haul0167";
    haul0167.length = 269;
    [edge0075.elements addObject:haul0167];

    // Добавляем станцию Mission Park
    MWStation *station0175 = [[MWStation alloc] init];
    station0175.identifier = @"station0175";
    [edge0075.elements addObject:station0175];
    
    station0175.nameOriginal = @"Mission Park";
    station0175.geoLocation = CGPointMake(42.333172, -71.109746);
    
    // Добавляем перегон
    MWHaul *haul0168 = [[MWHaul alloc] init];
    haul0168.identifier = @"haul0168";
    haul0168.length = 348;
    [edge0075.elements addObject:haul0168];

    // Добавляем станцию Fenwood Rd
    MWStation *station0176 = [[MWStation alloc] init];
    station0176.identifier = @"station0176";
    [edge0075.elements addObject:station0176];
    
    station0176.nameOriginal = @"Fenwood Road";
    station0176.geoLocation = CGPointMake(42.33368, -71.1057);

    // Добавляем перегон
    MWHaul *haul0169 = [[MWHaul alloc] init];
    haul0169.identifier = @"haul0169";
    haul0169.length = 106;
    [edge0075.elements addObject:haul0169];

    // Добавляем станцию Brigham Circle
    MWStation *station0177 = [[MWStation alloc] init];
    station0177.identifier = @"station0177";
    [edge0075.elements addObject:station0177];
    
    station0177.nameOriginal = @"Brigham Circle";
    station0177.geoLocation = CGPointMake(42.334169, -71.104567);

    // Добавляем перегон
    MWHaul *haul0170 = [[MWHaul alloc] init];
    haul0170.identifier = @"haul0170";
    haul0170.length = 428;
    [edge0075.elements addObject:haul0170];

    // Добавляем станцию Longwood Medical Area
    MWStation *station0178 = [[MWStation alloc] init];
    station0178.identifier = @"station0178";
    [edge0075.elements addObject:station0178];
    
    station0178.nameOriginal = @"Longwood Medical Area";
    station0178.geoLocation = CGPointMake(42.33595, -71.10002);

    // Добавляем перегон
    MWHaul *haul0171 = [[MWHaul alloc] init];
    haul0171.identifier = @"haul0171";
    haul0171.length = 415;
    [edge0075.elements addObject:haul0171];

    // Добавляем станцию Museum of Fine Arts
    MWStation *station0179 = [[MWStation alloc] init];
    station0179.identifier = @"station0179";
    [edge0075.elements addObject:station0179];
    
    station0179.nameOriginal = @"Museum of Fine Arts";
    station0179.geoLocation = CGPointMake(42.337674, -71.095533);

    // Добавляем перегон
    MWHaul *haul0172 = [[MWHaul alloc] init];
    haul0172.identifier = @"haul0172";
    haul0172.length = 489;
    [edge0075.elements addObject:haul0172];

    // Добавляем станцию Northeastern
    MWStation *station0180 = [[MWStation alloc] init];
    station0180.identifier = @"station0180";
    [edge0075.elements addObject:station0180];
    
    station0180.nameOriginal = @"Northeastern University";
    station0180.geoLocation = CGPointMake(42.33976, -71.09033);

    // Добавляем перегон
    MWHaul *haul0173 = [[MWHaul alloc] init];
    haul0173.identifier = @"haul0173";
    haul0173.length = 561;
    [edge0075.elements addObject:haul0173];

    // Добавляем станцию Symphony
    MWStation *station0181 = [[MWStation alloc] init];
    station0181.identifier = @"station0181";
    [edge0075.elements addObject:station0181];
    
    station0181.nameOriginal = @"Symphony";
    station0181.geoLocation = CGPointMake(42.342778, -71.085);
    
    // Добавляем перегон
    MWHaul *haul0174 = [[MWHaul alloc] init];
    haul0174.identifier = @"haul0174";
    haul0174.length = 412;
    [edge0075.elements addObject:haul0174];

    // Добавляем станцию Prudential
    MWStation *station0182 = [[MWStation alloc] init];
    station0182.identifier = @"station0182";
    [edge0075.elements addObject:station0182];
    
    station0182.nameOriginal = @"Prudential";
    station0182.geoLocation = CGPointMake(42.345556, -71.081667);

    // Добавляем перегон
    MWHaul *haul0175 = [[MWHaul alloc] init];
    haul0175.identifier = @"haul0175";
    haul0175.length = 628;
    [edge0075.elements addObject:haul0175];

    // Добавляем станцию Copley
    MWStation *station0183 = [[MWStation alloc] init];
    station0183.identifier = @"station0183";
    [edge0075.elements addObject:station0183];
    
    station0183.nameOriginal = @"Copley";
    station0183.geoLocation = CGPointMake(42.350278, -71.0775);
    station0183.platformIndex = 1;

    // Добавляем вершину
    edge0075.finishVertex = vertex0037;

    // Создаем участок линии Copley - Arlington
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0076 = [[MWEdge alloc] init];
    edge0076.identifier = @"edge0076";
    edge0076.developmentName = @"Ребро: Copley - Arlington";
    [self.edges addObject:edge0076];
    
    // Добавляем линию
    edge0076.line = line0012;
    
    // Добавляем вершину
    edge0076.startVertex = vertex0037;

    // Добавляем станцию Copley
    [edge0076.elements addObject:station0183];

    // Добавляем перегон
    MWHaul *haul0176 = [[MWHaul alloc] init];
    haul0176.identifier = @"haul0176";
    haul0176.length = 590;
    [edge0076.elements addObject:haul0176];

    // Добавляем станцию Arlington
    MWStation *station0184 = [[MWStation alloc] init];
    station0184.identifier = @"station0184";
    [edge0076.elements addObject:station0184];
    
    station0184.nameOriginal = @"Arlington";
    station0184.geoLocation = CGPointMake(42.35186, -71.070728);
    station0184.platformIndex = 1;

    // Добавляем вершину
    edge0076.finishVertex = vertex0036;

    // Создаем участок линии Arlington - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0077 = [[MWEdge alloc] init];
    edge0077.identifier = @"edge0077";
    edge0077.developmentName = @"Ребро: Arlington - Boylston";
    [self.edges addObject:edge0077];
    
    // Добавляем линию
    edge0077.line = line0012;
    
    // Добавляем вершину
    edge0077.startVertex = vertex0036;

    // Добавляем станцию Arlington
    [edge0077.elements addObject:station0184];

    // Добавляем перегон
    MWHaul *haul0177 = [[MWHaul alloc] init];
    haul0177.identifier = @"haul0177";
    haul0177.length = 502;
    [edge0077.elements addObject:haul0177];
    
    // Добавляем станцию Boylston
    MWStation *station0185 = [[MWStation alloc] init];
    station0185.identifier = @"station0185";
    [edge0077.elements addObject:station0185];
    
    station0185.nameOriginal = @"Boylston";
    station0185.geoLocation = CGPointMake(42.3525, -71.064722);
    station0185.platformIndex = 1;
    
    // Добавляем вершину
    edge0077.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0078 = [[MWEdge alloc] init];
    edge0078.identifier = @"edge0078";
    edge0078.developmentName = @"Ребро: Boylston - Park St";
    [self.edges addObject:edge0078];
    
    // Добавляем линию
    edge0078.line = line0012;
    
    // Добавляем вершину
    edge0078.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0078.elements addObject:station0185];

    // Добавляем перегон
    MWHaul *haul0178 = [[MWHaul alloc] init];
    haul0178.identifier = @"haul0178";
    haul0178.length = 487;
    [edge0078.elements addObject:haul0178];
    
    // Добавляем станцию Park St
    MWStation *station0186 = [[MWStation alloc] init];
    station0186.identifier = @"station0186";
    [edge0078.elements addObject:station0186];
    
    station0186.nameOriginal = @"Park Street";
    station0186.geoLocation = CGPointMake(42.356389, -71.0625);
    station0186.platformIndex = 1;
    
    // Добавляем вершину
    edge0078.finishVertex = vertex0002;

    // Создаем участок линии Park St - Gov’t. Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0079 = [[MWEdge alloc] init];
    edge0079.identifier = @"edge0079";
    edge0079.developmentName = @"Ребро: Park St - Gov’t. Ctr";
    [self.edges addObject:edge0079];
    
    // Добавляем линию
    edge0079.line = line0012;
    
    // Добавляем вершину
    edge0079.startVertex = vertex0002;

    // Добавляем станцию Park St
    [edge0079.elements addObject:station0186];

    // Добавляем перегон
    MWHaul *haul0179 = [[MWHaul alloc] init];
    haul0179.identifier = @"haul0179";
    haul0179.length = 432;
    [edge0079.elements addObject:haul0179];
    
    // Добавляем станцию Gov’t. Ctr
    MWStation *station0187 = [[MWStation alloc] init];
    station0187.identifier = @"station0187";
    [edge0079.elements addObject:station0187];
    
    station0187.nameOriginal = @"Government Center";
    station0187.geoLocation = CGPointMake(42.359444, -71.059444);
    station0187.platformIndex = 1;
    
    // Добавляем вершину
    edge0079.finishVertex = vertex0017;

    // Создаем участок линии Gov’t. Ctr - Haymarket
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0080 = [[MWEdge alloc] init];
    edge0080.identifier = @"edge0080";
    edge0080.developmentName = @"Ребро: Gov’t. Ctr - Haymarket";
    [self.edges addObject:edge0080];
    
    // Добавляем линию
    edge0080.line = line0012;
    
    // Добавляем вершину
    edge0080.startVertex = vertex0017;

    // Добавляем станцию Gov’t. Ctr
    [edge0080.elements addObject:station0187];

    // Добавляем перегон
    MWHaul *haul0180 = [[MWHaul alloc] init];
    haul0180.identifier = @"haul0180";
    haul0180.length = 450;
    [edge0080.elements addObject:haul0180];
    
    // Добавляем станцию Haymarket
    MWStation *station0188 = [[MWStation alloc] init];
    station0188.identifier = @"station0188";
    [edge0080.elements addObject:station0188];
    
    station0188.nameOriginal = @"Haymarket";
    station0188.geoLocation = CGPointMake(42.3633, -71.0582);
    station0188.platformIndex = 1;
    
    // Добавляем вершину
    edge0080.finishVertex = vertex0013;

    // Создаем участок линии Haymarket - North Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0081 = [[MWEdge alloc] init];
    edge0081.identifier = @"edge0081";
    edge0081.developmentName = @"Ребро: Haymarket - North Station";
    [self.edges addObject:edge0081];
    
    // Добавляем линию
    edge0081.line = line0012;
    
    // Добавляем вершину
    edge0081.startVertex = vertex0013;

    // Добавляем станцию Haymarket
    [edge0081.elements addObject:station0188];

    // Добавляем перегон
    MWHaul *haul0181 = [[MWHaul alloc] init];
    haul0181.identifier = @"haul0181";
    haul0181.length = 370;
    [edge0081.elements addObject:haul0181];
    
    // Добавляем станцию North Station
    MWStation *station0189 = [[MWStation alloc] init];
    station0189.identifier = @"station0189";
    [edge0081.elements addObject:station0189];
    
    station0189.nameOriginal = @"North Station";
    station0189.geoLocation = CGPointMake(42.3657, -71.061);
    station0189.platformIndex = 1;

    // Добавляем вершину
    edge0081.finishVertex = vertex0014;

    // Создаем участок линии North Station - Lechmere
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0082 = [[MWEdge alloc] init];
    edge0082.identifier = @"edge0082";
    edge0082.developmentName = @"Ребро: North Station - Lechmere";
    [self.edges addObject:edge0082];
    
    // Добавляем линию
    edge0082.line = line0012;
    
    // Добавляем вершину
    edge0082.startVertex = vertex0014;

    // Добавляем станцию North Station
    [edge0082.elements addObject:station0189];

    // Добавляем перегон
    MWHaul *haul0182 = [[MWHaul alloc] init];
    haul0182.identifier = @"haul0182";
    haul0182.length = 2100;
    [edge0082.elements addObject:haul0182];
    
    // Добавляем станцию Science Park/West End
    MWStation *station0190 = [[MWStation alloc] init];
    station0190.identifier = @"station0190";
    [edge0082.elements addObject:station0190];
    
    station0190.nameOriginal = @"Science Park/West End";
    station0190.geoLocation = CGPointMake(42.366667, -71.067639);

    // Добавляем перегон
    MWHaul *haul0183 = [[MWHaul alloc] init];
    haul0183.identifier = @"haul0183";
    haul0183.length = 904;
    [edge0082.elements addObject:haul0183];
    
    // Добавляем станцию Lechmere
    MWStation *station0191 = [[MWStation alloc] init];
    station0191.identifier = @"station0191";
    [edge0082.elements addObject:station0191];
    
    station0191.nameOriginal = @"Lechmere";
    station0191.geoLocation = CGPointMake(42.370917, -71.0775);

    // Добавляем вершину
    edge0082.finishVertex = vertex0035;

    return self;
}

@end

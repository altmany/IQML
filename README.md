IQML
====

A toolbox for connecting MATLAB to DTN IQFeed, to retrieve financial market data and news.

![IQML](https://undocumentedmatlab.com/images/IQML.png)

### Table of contents
 * [Overview](#overview)
 * [Main functionalities](#main-functionalities)
 * [Additional program features](#additional-program-features)
 * [Requirements](#requirements)
 * [Compatibility](#compatibility)
 * [Installation](#installation)
 * [Usage examples](#usage-examples)
 * [Disclaimer](#disclaimer)
 * [Contact us](#contact-us)

### Overview
IQML is a Matlab connector to IQFeed, enabling users to leverage Matlab’s superior analysis and visualization capabilities, with IQFeed’s reliable data-feed of live and historic market data for stocks, ETFs, mutual funds, bonds, options, futures, commodities and Forex. IQML can be used for both automated algo-trading and selective manual trading, as well as continuous market data feed. IQML provides a reliable, easy-to-use Matlab interface to IQFeed that works right out of the box, and was optimized for excellent performance, reliability, stability and compatibility. 

IQML includes a very detailed [User Guide](https://undocumentedmatlab.com/files/IQML/IQML_User_Guide.pdf), complete with working usage examples and implementation tips.

This downloaded version is fully-functional and can run for 30 days for free. If you wish to use IQML beyond this time, you can purchase a license on [IQML's webpage](https://undocumentedmatlab.com/IQML#Pricing).

### Main functionalities
Simple Matlab commands fetch market data from IQFeed, in either blocking (snapshot) or non-blocking (streaming) modes:
 * Live top-of-book market data (quotes and trades)
 * Live Level2 market-depth data
 * Historic, intra-day and live market data (individual ticks or interval bars)
 * Fundamental info on assets
 * Market scanner based on fundamental and trading criteria
 * Options and futures chains lookup (with market data, Greeks)
 * Symbols and market codes lookup
 * News headlines, story-counts and complete news stories, with user-specified filters
 * Connection stats and programmatic connect/disconnect
 * Ability to attach user-defined Matlab callback functions to IQFeed messages and market events
 * User-defined custom alerts on streaming market events (news/quotes/interval-bar/regional triggers)
 * Combine all of the above for a full-fledged end-to-end automated trading system using plain Matlab
 
### Additional program features
 * **Full solution** – IQML provides easy-to-use access to IQFeed’s entire data-set within Matlab. Only the core Matlab and IQFeed’s client app are required – no additional toolbox or component is required.
 * **Stability** – IQML has been extensively tested. It is rock solid.
 * **Easy to use** – Users can access IQFeed’s data by simple Matlab commands, without need for any Matlab programming. IQML simplifies the IQFeed API in a very easy-to-use yet powerful interface that can be used by any Matlab user, novice or advanced.
 * **Novice and advanced users** – Users can use easy-to-use Matlab commands, to access IQFeed’s data. Minimal or no programming is required to access this data.
 * **Blocking and non-blocking (streaming) modes** – Users can receive IQFeed data both synchronously (waiting for data to arrive with optional timeout), and asynchronously (streaming data in the background).
 * **Settable market alerts** – Users can define custom alerts on streaming news/quotes/interval-bars/regional-updates, which can be reported in various ways (popup window, console message, email, text (SMS) message, or Matlab callback function).
 * **User callbacks** – Users can attach Matlab code (callbacks) to IQFeed messages. For example, this enables adding an entry in an Excel file, or sending an email, whenever a stock reaches a certain price or trade volume (also note the related alerts functionality).
 * **Security** – IQML does not transmit any information externally except to IQFeed, so your trading information are as safe as your own computer.
 * **Performance** – IQML is optimized for performance, providing fast and responsive connectivity. While Matlab as a platform is not well-suited for HFT, IQML enables receiving hundreds of streaming quotes or other IQFeed messages per second, with message latencies as low as 1ms and parallelization supported.
 * **Development** – IQML was developed by an acknowledged Matlab expert, who wrote the reference textbooks on Matlab-Java connectivity and Matlab performance, as well as the acclaimed IB-Matlab connector (Matlab connector to Interactive Brokers). IQML is continuously improved and maintained.
 * **Support** – Custom development and ongoing support is available directly from the developer, with extremely fast response times.
 * **Documentation** – Extensive and comprehensive documentation, with numerous code examples and usage tips (see below).
 * **Backtesting** – IQML does not include backtesting functionality. IQML’s author (Yair Altman) has extensive experience in developing complete backtesting and real-time trading applications. Yair will be happy to either develop a new application based on your specifications, or to integrate IQML into an existing application, under a consulting contract.

### Requirements
IQML is a Matlab connector to IQFeed, so it naturally needs the user to have both
 * a locally-installed Matlab
 * a locally-installed IQFeed client (IQConnect)
 * an active IQFeed data account

### Compatibility
 * Platforms: IQML works on all platforms on which IQFeed runs: Windows, Mac OS, Linux.
 * IQFeed: IQML works with all recent IQFeed installations, including the latest IQFeed API (6.1).
 * Matlab: IQML works on all Matlab releases since 2008, including the latest release (R2019b).

### Installation
 1. Download or clone IQML into a local folder on your computer (preferably a separate IQML folder)
 2. Add the local folder to your Matlab path using the path tool (in the Matlab Desktop’s toolstrip, click HOME / ENVIRONMENT / Set path… and save). The folder needs to be in your Matlab path whenever you run IQML.
 3. Ensure that your local IQFeed client is working and can be used to log-in to IQFeed. This client would be _IQConnect.exe_ on Windows, _IQFeed application_ on MacOS, or ran as a Windows app on Mac/Linux using Parallels/Wine.
 4. You can now run IQML within Matlab. To verify that IQML is properly installed, retrieve the latest IQFeed server time, as follows (see section 9.2 in the User Guide):
```Matlab
>> t = IQML('time');
```
Additional usage examples are provided below.
 
### Usage examples
This is a short sampling of IQML’s functionality. The product contains many more features and query types. Review the full [IQML User Guide](https://undocumentedmatlab.com/files/IQML/IQML_User_Guide.pdf) for a detailed description of the available functionality.

 1. [Get market data (snapshot) for a security](#1-get-market-data-snapshot-for-a-security)
 2. [Get fundamental data for a security](#2-get-fundamental-data-for-a-security)
 3. [Get the latest interval bars for a security](#3-get-the-latest-interval-bars-for-a-security)
 4. [Calculate option Greeks, fair value and implied volatility](#4-calculate-option-greeks-fair-value-and-implied-volatility)
 5. [Get historic/intra-day data](#5-get-historicintra-day-data)
 6. [Get streaming quotes data](#6-get-streaming-quotes-data)
 7. [Get news data](#7-get-news-data)
 8. [Get options/futures chains](#8-get-optionsfutures-chains)
 9. [Connect/disconnect from IQFeed](#9-connectdisconnect-from-iqfeed)
 10. [Get connection information/stats](#10-get-connection-informationstats)
 11. [Specify message event callbacks](#11-specify-message-event-callbacks)

#### 1) Get market data (snapshot) for a security
```Matlab
>> data = IQML('quotes', 'symbol','GOOG')
data = 
                            Symbol: 'GOOG'
                 Most_Recent_Trade: 1092.14
            Most_Recent_Trade_Size: 1
            Most_Recent_Trade_Time: '09:46:31.960276'
   Most_Recent_Trade_Market_Center: 25
                      Total_Volume: 113677
                               Bid: 1092.13
                          Bid_Size: 100
                               Ask: 1092.99
                          Ask_Size: 100
                              Open: 1099.22
                              High: 1099.22
                               Low: 1092.38
                             Close: 1090.93
                  Message_Contents: 'Cbaohlcv'
               Message_Description: 'Last qualified trade; A bid update occurred, An ask update occurred; An open 
                                     declaration occurred; A high declaration occurred; A low declaration occurred;
                                     A close declaration occurred; A volume update occurred'
      Most_Recent_Trade_Conditions: '3D87'
      Trade_Conditions_Description: 'Intramaket Sweep; Odd lot trade'
           Most_Recent_Market_Name: 'Direct Edge A (EDGA)'
```
Available parameters that affect the query: Symbols, Timeout, NumOfEvents, MsgParsingLevel, Fields, UseParallel.

#### 2) Get fundamental data for a security
```Matlab
>> data = IQML('fundamental', 'symbol','IBM')
data = 
                     Exchange_ID: 7
                              PE: 25.7
                  Average_Volume: 4588000
                   x52_Week_High: 180.95
                    x52_Week_Low: 139.13
              Calendar_Year_High: 171.13
               Calendar_Year_Low: 144.395
                  Dividend_Yield: 3.79
                 Dividend_Amount: 1.5
                   Dividend_Rate: 6
                        Pay_Date: '03/10/2018'
                Ex_dividend_Date: '02/08/2018'
                  Short_Interest: 17484332
                Current_Year_EPS: 6.17
                   Next_Year_EPS: []
     Five_year_Growth_Percentage: -0.16
                 Fiscal_Year_End: 12
                    Company_Name: 'INTERNATIONAL BUSINESS MACHINE'
              Root_Option_Symbol: 'IBM'
    Percent_Held_By_Institutions: 59.9
                            Beta: 1.05
                           Leaps: []
                  Current_Assets: 49735
             Current_Liabilities: 37363
              Balance_Sheet_Date: '12/31/2017'
                  Long_term_Debt: 39837
       Common_Shares_Outstanding: 921168
                  Split_Factor_1: '0.50 05/27/1999'
                  Split_Factor_2: '0.50 05/28/1997'
                   Market_Center: []
                     Format_Code: 14
                       Precision: 4
                             SIC: 7373
           Historical_Volatility: 25.79
                   Security_Type: 1
                   Listed_Market: 7
              x52_Week_High_Date: '03/08/2017'
               x52_Week_Low_Date: '08/21/2017'
         Calendar_Year_High_Date: '01/18/2018'
          Calendar_Year_Low_Date: '02/09/2018'
                  Year_End_Close: 153.42
                   Maturity_Date: []
                     Coupon_Rate: []
                 Expiration_Date: []
                    Strike_Price: []
                           NAICS: 541512
                   Exchange_Root: []
       Option_Premium_Multiplier: []
     Option_Multiple_Deliverable: []
        Price_Format_Description: 'Four decimal places'
            Exchange_Description: 'New York Stock Exchange (NYSE)'
       Security_Type_Description: 'Equity'
                 SIC_Description: 'COMPUTER INTEGRATED SYSTEMS DESIGN'
               NAICS_Description: 'Computer Systems Design Services'
                 SIC_Sector_Name: 'Services'
               NAICS_Sector_Name: 'Professional, Scientific, Technical services'
```
Available parameters that affect the query: Symbols, Timeout, MsgParsingLevel.

#### 3) Get the latest interval bars for a security
```Matlab
>> data = IQML('intervalbars', 'Symbol','@VX#', 'NumOfEvents',4)
data =
  4×1 struct array with fields:
    Symbol
    BarType
    Timestamp
    Open
    High
    Low
    Close
    CummlativeVolume
    IntervalVolume
    NumberOfTrades
 
>> data(1)
ans =
    Symbol: '@VX#'
    BarType: 'Complete interval bar from history'
    Timestamp: '2018-09-05 12:36:00'
    Open: 14.45
    High: 14.5
    Low: 14.45
    Close: 14.45
    CummlativeVolume: 57077
    IntervalVolume: 17
    NumberOfTrades: 0
```
Available parameters that affect the query: Symbols, Timeout, NumOfEvents, MaxItems, MaxDays, IntervalType, IntervalSize, BeginFilterTime, EndFilterTime, BeginDateTime, MsgParsingLevel.

#### 4) Calculate option Greeks, fair value and implied volatility
```Matlab
>> data = IQML('greeks','symbol','IBM1814L116')
data = 
                            Symbol: 'IBM1814L116'
                        Asset_Name: 'IBM DEC 2018 C 116.00'
                      Strike_Price: 116
                   Expiration_Date: '12/14/2018'
                Days_To_Expiration: 30
               Inferred_Asset_Side: 'Call'
                 Underlying_Symbol: 'IBM'
                   Underlying_Spot: 121.3
			 Underlying_Asset_Name: 'INTERNATIONAL BUSINESS MACHINE'
    Underlying_Historic_Volatility: 37.1
            Assumed_Risk_Free_Rate: 0
            Assumed_Dividend_Yield: 0
                  Asset_Fair_Value: 8.1193
                Asset_Latest_Price: 7.05
                  Asset_Price_Diff: 1.0693
                Implied_Volatility: 0.28242
                             Delta: 0.68197
                              Vega: 0.12404
                             Theta: -0.076697
                               Rho: 6.1318
                              CRho: 6.7992
                             Omega: 10.189
                            Lambda: 10.189
                             Gamma: 0.027646
                             Vanna: -0.3527
                             Charm: 0.0021809
                             Vomma: 5.8043
                              Veta: 2.4262
                             Speed: -0.0012419
                             Zomma: -0.061581
                             Color: -0.00038078
                            Ultima: -45.238
				Annual_Factor_Used: 365
           This_Asset_Latest_Quote: [1×1 struct]
           Underlying_Latest_Quote: [1×1 struct]
           This_Asset_Fundamentals: [1×1 struct]
           Underlying_Fundamentals: [1×1 struct]
```
Available parameters that affect the query: Symbols, Timeout, UseParallel, UnderlyingSymbol, HistoricVolatility, RiskFreeRate, DividendsYield, Side, DaysToExpiration, DaysPerYear.

#### 5) Get historic/intra-day data
```Matlab
% Get historic daily data:
>> data = IQML('history', 'symbol','IBM', 'dataType','day')  % dataType is optional (default: 'day')
data = 
  100×1 struct array with fields:
    Symbol
    Datestamp
    Datenum
    High
    Low
    Open
    Close
    PeriodVolume
    OpenInterest
 
>> data(1)
ans = 
          Symbol: 'IBM'
       Datestamp: '2017-10-10'
         Datenum: 736978
            High: 148.95
             Low: 147.65
            Open: 147.71
           Close: 148.5
    PeriodVolume: 4032601
    OpenInterest: 0
 
>> highs = [data.High];  % array of High values
 
% Get historic ticks data for the VIX continuous future (@VX#):
>> data = IQML('history', 'symbol','@VX#', 'dataType','ticks');
>> data(1)
ans = 
               Symbol: '@VX#'
            Timestamp: '2018-03-09 06:47:57.899000'
              Datenum: 737128.283309016
                 Last: 17.12
             LastSize: 1
          TotalVolume: 3605
                  Bid: 17.1
                  Ask: 17.15
               TickID: 4377589
         BasisForLast: 'C'
    TradeMarketCenter: 32
      TradeConditions: '4D'
   TradeAggressorCode: 0
           DayOfMonth: 9
     BasisDescription: 'Last qualified trade'
      TradeMarketName: 'CBOE Futures Exchange (CFE)'
     TradeDescription: 'Implied'
 AggressorDescription: 'Unknown/unsupported'
```
Available parameters that affect the query: Symbols, DataType (day/week/month/interval/ticks), DataDirection, MaxItems, Days, BeginDate, EndDate, BeginDateTime, EndDateTime, BeginFilterTime, EndFilterTime, IntervalType, IntervalSize, Timeout, UseParallel, MsgParsingLevel.

#### 6) Get streaming quotes data
The initial request to send streaming quotes for the VIX continuous future (@VX#):
```Matlab
IQML('quotes', 'Symbol','@VX#', 'NumOfEvents',100, 'MaxItems',10);
```
Multiple symbols can be specified, as a cell-array or colon-delimited string:
```Matlab
IQML('quotes', 'NumOfEvents',100, 'Symbols','@VX#:GOOG:AAPL');        % alternative #1
IQML('quotes', 'NumOfEvents',100, 'Symbols',{'@VX#','GOOG','AAPL'});  % alternative #2
```
Subsequent requests to retrieve the latest accumulated data for a symbol, return a data struct that looks like this:
```Matlab
>> data = IQML('quotes', 'Symbol','@VX#', 'NumOfEvents',-1)
data = 
                 Command: 'w@VX#'
                isActive: 1
         EventsToProcess: 100
         EventsProcessed: 43
      LatestEventDatenum: 737128.637260451
    LatestEventTimestamp: '20180309 15:17:39.303'
                DataType: 'quotes and trades'
             ProcessType: 'stream'
              BufferSize: 10
                  Buffer: [10×1 struct]
              LatestData: [1×1 struct]
 
>> data.LatestData
ans =
                             Symbol: '@VX#'
                  Most_Recent_Trade: 17.08
             Most_Recent_Trade_Size: []
             Most_Recent_Trade_Time: '08:06:20.716000'
    Most_Recent_Trade_Market_Center: 32
                       Total_Volume: 4507
                                Bid: 17.05
                           Bid_Size: 63
                                Ask: 17.1
                           Ask_Size: 244
                               Open: 17.2
                               High: 17.35
                                Low: 17
                              Close: 17.23
                   Message_Contents: 'Cbasohlcv'
                Message_Description: 'Last qualified trade; A bid update occurred; An ask update occurred; A settlement 
                                      occurred; An open declaration occurred; A high declaration occurred; A low
                                      declaration occurred; A close declaration occurred; A volume update occurred'
       Most_Recent_Trade_Conditions: '4D'
       Trade_Conditions_Description: 'Implied'
            Most_Recent_Market_Name: 'CBOE Futures Exchange (CFE)'
```
Available parameters that affect the query: Symbols, DataType (quotes/trades), NumOfEvents, MaxItems, Timeout, Fields.

Similarly, streaming interval bars, regional updates and Level-2 market depth updates can be requested using IQML('intervalbars',...), IQML('regional',...) and IQML('marketdepth',...) commands.

#### 7) Get news data
News configuration:
```Matlab
>> data = IQML('news', 'DataType','config')
data = 
    Category: 'All News'
      Majors: [1×7 struct]
 
>> {data.Majors.Description}
ans =
  1×7 cell array
    {'DTN News'}  {'PR Newswire'}  {'Business Wire'}  {'Real-Time Trader'}  {'GlobeNewswire Inc'}  {'Marketwire'}  {'Benzinga Pro'}
 
% This shows that we are connected to 7 major news sources. We can drill-down for details about these news sources:
>> data.Majors(1)  % first of 7 Major news sources
ans = 
                Source: 'DTN'
           Description: 'DTN News'
    AuthenticationCode: '1D'
                IconID: 10
                Minors: [1×4 struct]
 
>> data.Majors(1).Minors(1)  % 1st of 4 Minor DTN sources
ans = 
                Source: 'DT5'
           Description: 'Treasuries, Most Actives, Gainers, Losers'
    AuthenticationCode: '1D'
 
>> data.Majors(1).Minors(2)  % 2nd of 4 Minor DTN sources
ans = 
                Source: 'RTL'
           Description: 'Derivatives - Selected Futures and Options'
    AuthenticationCode: '2Ab'
                IconID: 10
```

News story headlines:
```Matlab
>> data = IQML('news', 'DataType','headlines')
data = 
  1000×1 struct array with fields:
    Source
    ID
    Symbols
    Timestamp
    Text
 
>> data(1)
ans = 
       Source: 'BEN'
           ID: 21991162633
      Symbols: {'BZRatings'  'MNTX'}
    Timestamp: 20180305064533
         Text: 'Manitex International Sees Q4 Sales $64.40M vs $64.45M Est...'
 
% Limiting the headlines to specific symbols, events and/or news-sources:
>> data = IQML('news', 'DataType','headlines', 'Symbols',{'IBM','GOOG','BZRatings'}, 'Sources',{'DTN','CPR','BEN'});
>> data = IQML('news', 'DataType','headlines', 'Symbols','IBM:GOOG:BZRatings', 'Sources','DTN:CPR:BEN');  % equivalent alternative
data = 
  687×1 struct array with fields:
    Source
    ID
    ...
```

News story full text:
```Matlab
>> data = IQML('news', 'DataType','story', 'ID',21991162633)
data = 
         ID: 21991162633
    Symbols: {'BZRatings'  'MNTX'}
       Text: 'Manitex International Sees Q4 Sales $64.40M vs $64.45M Est. 
              Manitex International (NASDAQ: MNTX) sees Q4 sales of $64.40M vs $64.45M estimate.'
News story count:

>> data = IQML('news', 'DataType','number', 'Symbols','BSX:AAPL:GOOG')
data = 
    AAPL: 7
     BSX: 14
    GOOG: 2
 
% The query can be limited by symbol(s), news-source(s), and date(s):
>> data = IQML('news', 'DataType','number', 'Symbols','BSX:GOOG:AAPL', 'BeginDate',20180301, 'EndDate',20180303)
data = 
    AAPL: 37
     BSX: 3
    GOOG: 13
```
Available parameters that affect the query: Symbols, Sources, DataType, Date, BeginDate, EndDate, MaxItems, GetStory, NumOfEvents, Timeout, UseParallel.

#### 8) Get options/futures chains
```Matlab
% Report GOOG options having strike price between $1000-$1010 in next 4 months
>> symbols = IQML('chain', 'symbol','goog', 'NearMonths',4, 'MinStrike',1000, 'MaxStrike',1010)'
symbols =
  1×58 cell array
  Columns 1 through 4
    'GOOG1803H1000' 'GOOG1803H1010' 'GOOG1810H1000' 'GOOG1810H1005'
  Columns 5 through 8
    'GOOG1810H1010' 'GOOG1813G1000' 'GOOG1813G1002.5' 'GOOG1813G1005'
  Columns 9 through 12
    'GOOG1813G1007.5' 'GOOG1813G1010' 'GOOG1817H1000' 'GOOG1817H1005'
  ...
 
% Fetch the options chain for a symbol along with the latest quotes for all options
>> data = IQML('chain', 'symbol','GOOG', 'NearMonths',4, 'MinStrike',1000, 'MaxStrike',1010, 'WhatToShow','quotes')
data =
  58×1 struct array with fields:
    Symbol
    Most_Recent_Trade
    Most_Recent_Trade_Size
    Most_Recent_Trade_Time
    Most_Recent_Trade_Market_Center
    Total_Volume
    Bid
    Bid_Size
    Ask
    Ask_Size
    Open
    High
    Low
    Close
    ...
>> data(1)
ans =
    Symbol: 'GOOG1803H1000'
    Most_Recent_Trade: 120
    Most_Recent_Trade_Size: 1
    Most_Recent_Trade_Time: '15:57:12.930497'
    Most_Recent_Trade_Market_Center: 156
    Total_Volume: 0
    Bid: 140.5
    Bid_Size: 3
    Ask: 150.1
    Ask_Size: 1
    Open: []
    High: []
    Low: []
    Close: 120
    Message_Contents: 'Cbacv'
    Message_Description: 'Last qualified trade; A bid update occurred;
    An ask update occurred; A close declaration occurred; A volume update occurred'
    Most_Recent_Trade_Conditions: 1
    Trade_Conditions_Description: 'Normal Trade'
    Most_Recent_Market_Name: 'MIAX PEARL Options exchange'
 
% Fetch the options chain for a symbol along with the fundamental data for all options
>> data = IQML('chain', 'symbol','GOOG', 'NearMonths',4, 'MinStrike',1000, 'MaxStrike',1010, 'WhatToShow','fundamental')
data =
  58×1 struct array with fields:
    Symbol
    Exchange_ID
    PE
    Average_Volume
    x52_Week_High
    x52_Week_Low
    Calendar_Year_High
    Calendar_Year_Low
    ...
```
Available parameters that affect the query: Symbols, DataType (options/futures/spread/foptions), Side, WhatToShow, Months, NearMonths, Years, IncludeBinary, MinStrike, MaxStrike, NumInMoney, NumOutOfMoney, UseParallel.

#### 9) Connect/disconnect from IQFeed
```Matlab
IQML('disconnect');  % disconnect from IQFeed (IQConnect)
 
IQML('reconnect');  % disconnect and then automatically re-connect (optional parameters: Username, Password)
```

#### 10) Get connection information/stats
```Matlab
>> data = IQML('stats')
data =
                       ServerIP: '66.112.148.226'
                     ServerPort: 60002
                     MaxSymbols: 1300
          NumOfStreamingSymbols: 0
          NumOfClientsConnected: 3
         SecondsSinceLastUpdate: 1
             NumOfReconnections: 0
    NumOfAttemptedReconnections: 0
                      StartTime: 'Mar 07 11:03AM'
                     MarketTime: 'Mar 07 04:34AM'
               ConnectionStatus: 'Connected'
                  IQFeedVersion: '5.2.7.0'
                        LoginID: '123456-1'
                   TotalKBsRecv: 42.98
              KBsRecvLastSecond: 0.02
               AvgKBsPerSecRecv: 0.02
                   TotalKBsSent: 361.62
              KBsSentLastSecond: 0.22
               AvgKBsPerSecSent: 0.19
                      Exchanges: {1×16 cell}
                  ServerVersion: '6.0.0.5'
                    ServiceType: 'real_time'
```
Additional port-specific stats can be requested using the optional AddPortStats parameter:
```Matlab
>> data = IQML('stats', 'AddPortStats',1)
data =
                       ServerIP: '66.112.148.224'
                     ServerPort: 60005
                            ...
                         Level2: [1×1 struct]
           Level2SymbolsWatched: 2
                         Lookup: [1×1 struct]
         RegionalSymbolsWatched: 2
                          Admin: [1×1 struct]
                         Level1: [1×1 struct]
           Level1SymbolsWatched: 0
```

#### 11) Specify message event callbacks
We can attach a user callback function to all IQFeed messages:
```Matlab
IQML('ProcessFunc',@IQML_Callback);  % set a single callback function for all message types
```
We can also specify specific callbacks for various message types, and a default callback for all other message types:
```Matlab
% Alternative #1: using the struct() function:
callbacks = struct('System',      [], ...   % ignore System messages
                   'Quote_update',@IQML_Quote_Update_Callback, ...  % Level-1 quote updates
                   'Market_depth',@IQML_Market_Depth_Callback, ...  % Level-2 market-depth updates
                   'Default',     @IQML_Default_Callback);  % default callback for all other messages
 
% Alternative #2: using direct field assignments:
callbacks.System       = [];  % ignore System messages
callbacks.Quote_update = @IQML_Quote_Update_Callback;
callbacks.Market_depth = @IQML_Market_Depth_Callback;
callbacks.Default      = @IQML_Default_Callback);
 
% Now update IQML with these callbacks:
IQML('time', 'processFunc',callbacks);
```
where the callback functions are defined similarly to the following (for example, in a file called IQML_Callback.m):
```Matlab
function IQML_Callback(iqObject, eventData, varargin)
    % Extract the basic event data components
    event_timestamp  = eventData.Timestamp;     % local time in Matlab's datenum format
    event_msg_port   = eventData.MessagePort;   % e.g. 'Level2' for a Market_depth event
    event_msg_type   = eventData.MessageType;   % e.g. 'Market_depth'
    event_msg_header = eventData.MessageHeader; % e.g. 'Z' for a Market_depth event
    event_msg_string = eventData.MessageString; % the complete message string from IQFeed
    event_msg_parts  = eventData.MessageParts;  % the parsed message, split into a cell-array
 
    % Now do something useful with all this information...
    ...
end  % IQML_Callback
```

### Disclaimer
THIS SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, LOSS OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(A detailed disclaimer is available in [IQML’s User Guide](https://undocumentedmatlab.com/files/IQML/IQML_User_Guide.pdf), as well as in the separate [DISCLAIMER](https://github.com/altmany/IQML/blob/master/DISCLAIMER) file)

### Contact us
For additional information about IQML, please visit the product's webpage (http://IQML.net or https://undocumentedmatlab.com/IQML).

If you have any question or feedback, or need professional assistance in integrating IQML into your trading system, please email us (info@IQML.net) and we will be happy to help.

![](https://undocumentedmatlab.com/images/choose_any_5_animated.gif)

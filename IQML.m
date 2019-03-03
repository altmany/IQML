function [data, errMsg] = IQML(action, parameters, varargin)
%IQML - Get historic or real-time market data from DTN IQFeed
%
% Syntax:  [data, errMsg] = IQML(action, paramName1,paramValue1, paramName2,paramValue2, ...)
%
% Inputs:
%
%   action (String) - one of: license,version,version,license,update,revert,doc,quotes,intervalbars,fundamental,greeks,news,history,lookup,alert,chain,disconnect,reconnect,time,stats,command
%
%   parameters - Matlab struct or XLS filename or parameter name/value pairs with the following optional parameters:
%
%     Connection:
%        Username        (String)  the login ID for connecting to IQFeed via the client
%        Password        (String)  the password for connecting to IQFeed via the client
%
%     Message processing:
%        Timeout         (Number)  default=5; max # of seconds to wait for a response to a blocking query (0=infinite)
%        Debug           (Logical) default=0 or false; if true or 1, extra data will be displayed in Matlab console
%        AddPortStats    (Logical) default=0 or false; if true or 1, extra port stats are streamed and returned when Action=stats
%        MsgParsingLevel (Integer) default=2; amount of parsing for incoming IQFeed messages (0=minimal, 1=partial, 2=maximal)
%        ProcessFunc     (function handle or struct) default=[]; if non-empty, this function is invoked upon every IQFeed message
%        RaiseErrorMsgs  (Logical) default=1 or true; if true or 1, IQFeed error messages raise a Matlab error in blocking query
%        UseParallel     (Logical) default=0 or false; if true or 1, a blocking query will be parallelized (Pro license only)
%
%     Quotes/ticks:
%        DataType        (String)  default='quotes'; either 'quotes' or 'trades'
%        Symbols         (String :-delimited or cell-array) default=''; e.g., '@VX#' or 'IBM:GOOG' or {'IBM','GOOG'}
%        NumOfEvents     (Integer) default=inf; max # of IQFeed messages to process in streaming (non-blocking) data mode
%        MaxItems        (Integer) default=1; size of the reported buffer accumulating the latest streaming quotes/ticks
%        Fields          (String or cell-array) list of data fields to be reported by IQFeed (default: 16 fields)
%
%     Interval bars:
%        Symbols         (String :-delimited or cell-array) default=''; e.g., '@VX#' or 'IBM:GOOG' or {'IBM','GOOG'}
%        NumOfEvents     (Integer) default=inf; max # of IQFeed messages to process in streaming (non-blocking) data mode
%        MaxItems        (Integer) default=100; size of the reported buffer accumulating the latest streaming interval bars
%        IntervalSize    (Integer) default=60; size of interval bars in specified or default units (seconds)
%        IntervalType    (String)  default='secs'; one of 'secs','volume','trades'
%        MaxDays         (String)  default=1; max number of days to be retrieved
%        BeginFilterTime (String)  default='00:00:00'; earliest bar time
%        EndFilterTime   (String)  default='23:59:59'; latest   bar time
%        BeginDateTime   (Integer or String) default=''; earliest bar date
%
%     History:
%        DataType        (String)  default='day'; one of 'day','week','month','interval','ticks'
%        Symbol          (String)  default=''; e.g., '@VX#'
%        DataDirection   (Integer) default=1; either 1 (oldest-to-newest, default) or -1 (newest-to-oldest)
%        MaxItems        (Integer) default=100; returns up to the specified # of bars
%        BeginDate       (Integer or String) default=[]; earliest bar date (only relevant if DataType=day)
%        EndDate         (Integer or String) default=[]; latest   bar date (only relevant if DataType=day)
%        IntervalSize    (Integer) default=60; size of interval bars in seconds (only relevant if DataType=interval)
%        IntervalType    (String)  default='secs'; one of secs,volume,ticks (only relevant if DataType=interval)
%        Days            (Integer) default=1; # of calendar days to return, -1=all (only relevant if DataType=interval or ticks)
%        BeginDateTime   (Integer or String) default=''; earliest bar date (only relevant if DataType=interval or ticks)
%        EndDateTime     (Integer or String) default=''; latest   bar date (only relevant if DataType=interval or ticks)
%        BeginFilterTime (String)  default='00:00:00'; earliest bar time (only relevant if DataType=interval or ticks)
%        EndFilterTime   (String)  default='23:59:59'; latest   bar time (only relevant if DataType=interval or ticks)
%
%     Greeks:
%        Symbol             (String) default='';  e.g., 'IBM1814L116'
%        UnderlyingSymbol   (String) default='';  e.g., 'IBM'
%        HistoricVolatility (Number) default=-1;  underlying asset's volatility (%)
%        RiskFreeRate       (Number) default=0;   domestic risk-free rate (%)
%        DividendsYield     (Number) default=0;   underlying asset's dividends yield (%)
%        Side               (String) default='';  either 'Call' or 'Put'
%        DaysToExpiration   (Number) default=-1;  days until the contract expires
%        AnnualFactor       (Number) default=365; used to de-annualize Theta,Charm,Veta,Color
%
%     News:
%        DataType        (String)  default='config'; one of 'config','headlines','story'
%        Symbols         (String :-delimited or cell-array) default=''; e.g., 'FB' or 'IBM:GOOG' or {'IBM','GOOG'}
%        Sources         (String :-delimited or cell-array) default=''; from the subscribed news sources names
%        Date            (Integer or String) default=[]; Date at which the news headline was published (or all dates, if empty)
%        NumOfEvents     (Integer) default=inf; max # of headlines to process in streaming (non-blocking) data mode
%        MaxItems        (Integer) default=inf; max # of headlines to be reported by IQFeed
%        ID              (Integer) default=[]; news story ID
%        BeginDate       (Integer or String) default=[]; earliest date at which the news items were published
%        EndDate         (Integer or String) default=[]; latest date at which the news items were published
%        GetStory        (Logical) default=false; if true or 1, automatically fetch the full story text for each headline
%
%     Lookup:
%        DataType        (String)  default='symbols'; one of 'symbols','markets','sectypes','sic','naics','conditions'
%        Name            (String)  default=''; Limits results to those containing this string in their name (case insensitive)
%        Description     (String)  default=''; Limits results to those containing this string in their description (case insensitive)
%        SIC             (Integer) default=[]; Limits results to those whose SIC   sector/industry code begins with this number
%        NAICS           (Integer) default=[]; Limits results to those whose NAICS sector/industry code begins with this number
%        Markets         (Integers or Strings) default=[]; Limits results to those in the specified market (exchange) name(s) or code(s)
%        SecTypes        (Integers or Strings) default=[]; Limits results to those with the specified security type(s)
%
%     Alert:
%        Symbols         (String :-delimited or cell-array) default=''; e.g., 'FB' or 'IBM:GOOG' or {'IBM','GOOG'}
%        Trigger         (String)  alert trigger condition; composed of data type, parameter, operator, value (e.g. 'quote bid > 7') (case insensitive)
%        AlertAction     (String or function handle) default='display'; one of 'display','popup','email',function handle
%        NumOfEvents     (Integer) default=1; max # of times to trigger the alert
%        AlertID         (Numeric) the unique ID number assigned to each alert created, used for querying/editing/deleting existing alert
%        GetStory        (Logical) default=true; if true or 1, automatically fetch the full story (not just headline) of news alerts when AlertAction='email'/callback
%        StartStream     (Logical) default=false; if true or 1, automatically start data streaming
%        EmailRecipients (String :/,-delimited or cell-array of Strings); only relevant when AlertAction='email'
%        SmtpEmail       (String)  default='IQML.alerts@gmail.com'; sender address of email alerts. Only relevant if AlertAction='email'
%        SmtpServer      (String)  default='smtp.gmail.com'; sender SMTP server. Only relevant if AlertAction='email', SmtpEmail~=default
%        SmtpPassword    (String)  sender email password. Only relevant if AlertAction='email' and SmtpEmail~=default
%
%     Chain:
%        Symbol          (String)  default=''; e.g., 'GOOG'
%        DataType        (String)  default='options'; one of 'options','futures','foptions','spreads'
%        Side            (String)  default='cp'; one of 'cp','c','p'. Only relevant when DataType='options'/'foptions'
%        WhatToShow      (String)  default='symbols'; one of 'symbols','quotes','fundamental'
%        Months          (various) default=[]; numeric month values, or month name(s) or financial month codes
%        NearMonths      (Integer) default=[]; # of nearby contracts to report (0-99). Cannot be specified together with Months.
%        Years           (Numeric) default=current year; one or more years (e.g. 2013:2019)
%        IncludeBinary	 (Logical) default=true; whether to report binary options; only relevant when DataType='options'.
%        MinStrike       (Number)  default=[]; only report options having higher strike price; only relevant when DataType='options'.
%        MaxStrike       (Number)  default=[]; only report options having lower  strike price; only relevant when DataType='options'.
%        NumInMoney      (Integer) default=[]; only report this number of options in the money; only relevant if DataType='options'.
%        NumOutOfMoney   (Integer) default=[]; only report this number of options out of money; only relevant if DataType='options'.
%
%     Custom IQFeed command:
%        String          (String)  default=''; command to be sent to IQFeed
%        PortName        (String)  default='Level1'; one of 'Level1','Level2','Admin'
%
% Refer to the User Guide for detailed documentation and usage examples.
%
% THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
% TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT
% OR OTHERWISE, ARISING FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
% Copyright (c) Yair Altman, Octahedron Ltd. (info @ IQML.net)
%
% IQML webpage: http://IQML.net
% DTN IQFeed webpage: http://iqfeed.net

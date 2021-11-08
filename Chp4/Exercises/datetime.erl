-module(datetime).
-export([time_function/1, date_string/0]).

time_function(Function) ->
    {StartMacroSecs, StartSecs, StartMicroSecs} = erlang:timestamp(),
    Function(),
    {FinalMacroSecs, FinalSecs, FinalMicroSecs} = erlang:timestamp(),
    {ElapsedMacroSecs, ElapsedSecs, ElapsedMicroSecs} = 
        {
            FinalMacroSecs - StartMacroSecs,
            FinalSecs - StartSecs,
            FinalMicroSecs - StartMicroSecs
        },
    "MegaSec:" ++ integer_to_list(ElapsedMacroSecs) ++ 
    " | Sec:" ++ integer_to_list(ElapsedSecs) ++ 
    " | MicroSec:" ++ integer_to_list(ElapsedMicroSecs).
    
date_string() -> 
    {Year, Day, Month} = erlang:date(),
    {Hour, Minute, Seconds} = erlang:time(),
    Day = element(2, erlang:date()),
    integer_to_list(Day) ++ "/" 
    ++ integer_to_list(Month) ++ "/" 
    ++ integer_to_list(Year) ++ " - " 
    ++ integer_to_list(Hour) ++ ":" 
    ++ integer_to_list(Minute) ++ ":" 
    ++ integer_to_list(Seconds).
 
%%
%%
%%

-module(filter_end_of_day).
-export([
    end_of_day/2
]).

end_of_day(undefined, _Context) ->
    undefined;
end_of_day(DateTime, Context) ->
    {Date, _Time} = z_datetime:to_local(DateTime, Context),
    LocalEndOfDay = {Date, {23,59,59}},
    z_datetime:to_utc(LocalEndOfDay, Context).
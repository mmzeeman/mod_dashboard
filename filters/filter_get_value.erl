%%
%%
%%

-module(filter_get_value).

-export([
    get_value/5
]).

-include_lib("zotonic.hrl").


get_value(Values, Tick, XProp, YProp, _Context) ->
    ?DEBUG({Tick, Values, XProp, YProp}),
    case find(Values, {XProp, Tick}) of
        undefined -> 0;
        PropList -> proplists:get_value(YProp, PropList, 0)
    end.

find([], _) -> undefined;
find([PropList|Rest], Value) ->
    case lists:member(Value, PropList) of
        true -> PropList;
        false -> find(Rest, Value)
    end.
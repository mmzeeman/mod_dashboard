%%
%%
%%

-module(filter_get_value).

-export([
    get_value/5,
    get_value/6
]).

-include_lib("zotonic.hrl").

get_value(Values, Tick, XProp, YProp, Context) ->
    get_value(Values, Tick, XProp, YProp, 0, Context).

get_value(Values, Tick, XProp, YProp, Default, _Context) ->
    case find(Values, {XProp, Tick}) of
        undefined -> Default;
        PropList -> proplists:get_value(YProp, PropList, Default)
    end.

find([], _) -> undefined;
find([PropList|Rest], Value) ->
    case lists:member(Value, PropList) of
        true -> PropList;
        false -> find(Rest, Value)
    end.
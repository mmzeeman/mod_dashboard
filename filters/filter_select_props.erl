%%
%%
%%

-module(filter_select_props).

-include_lib("zotonic.hrl").

-export([
    select_props/3
]).

select_props(PropLists, Prop, Context) ->
    select_props1(PropLists, Prop, []).


select_props1([], _Prop, Acc) -> lists:reverse(Acc);
select_props1([PropList|Rest], Prop, Acc) ->
    case proplists:lookup(Prop, PropList) of
        none -> select_props1(Rest, Prop, Acc);
        {Prop, Value} -> select_props1(Rest, Prop, [Value|Acc])
    end.

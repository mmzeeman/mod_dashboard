%%
%%
%%

-module(filter_list_max).

-export([ 
    list_max/2,
    list_max/3
]).

-include_lib("zotonic.hrl").

%%
list_max(List, _Context) when is_list(List) ->
    lists:max(List).

list_max(List1, List2, _Context) when is_list(List2) ->
    lists:max(List1 ++ List2);
list_max(List, N, _Context) when is_list(List) andalso is_number(N) ->
    lists:max([N | List]);
list_max(List, Atom, Context) when is_list(List) andalso is_atom(Atom) ->
    L = filter_select_props:select_props(List, Atom, Context),
    lists:max(L).

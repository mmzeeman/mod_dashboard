%%
%%
%%

-module(filter_list_max).

-export([ 
    list_max/2,
    list_max/3
]).

%%
list_max(List, _Context) when is_list(List) ->
    lists:max(List).

list_max(List1, List2, _Context) when is_list(List2) -> lists:max(List1 ++ List2);
list_max(List, N, _Context) -> lists:max([N |List]).



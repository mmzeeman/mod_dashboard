%%
%%
%%

-module(filter_max).

-export([ 
    max/2,
    max/3
]).

%%
max(List, _Context) when is_list(List) ->
    lists:max(List).

max(List1, List2, _Context) when is_list(List2) -> lists:max(List1 ++ List2);
max(List, N, _Context) -> lists:max([N |List]).



%%
%%
%%

-module(filter_max).

-export([ 
    max/2
]).

%%
max(List, _Context) ->
    lists:max(List).




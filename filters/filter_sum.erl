%%
%%
%%

-module(filter_sum).

-export([ 
    sum/2
]).

%%
sum(List,  _Context) ->
    lists:sum(List).



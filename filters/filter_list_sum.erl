%%
%%
%%

-module(filter_list_sum).

-export([ 
    list_sum/2
]).

%%
list_sum(List,  _Context) ->
    lists:sum(List).



%%
%%
%%

-module(filter_tick_step).

-export([
    tick_step/3
]).

-define(E10, 7.0710678118654755). % sqrt(50)
-define(E5, 3.1622776601683795). % sqrt(10)
-define(E2, 1.4142135623730951). %  sqrt(2)

-define(LN10, 2.302585092994046).


tick_step([Start, Stop], Count, _Context) ->
    Step0 = abs(Stop - Start) / lists:max([0, Count]),
    Step1 = math:pow( 10, floor(math:log(Step0) / ?LN10)),
    Error = Step0 / Step1,

    S = case Error of
        E when E >= ?E10 -> Step1 * 10;
        E when E >= ?E5 -> Step1 * 5;
        E when E >= ?E2 -> Step1 * 2
   end,

   case Stop < Start of
       true -> -S;
       false -> S
    end.


%%
%% Helpers
%%

floor(X) ->
     T = trunc(X),
     if X < T -> T - 1
      ; true  -> T
     end.
    

    

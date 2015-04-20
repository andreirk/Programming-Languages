(* Dan Grossman, CSE341 Spring 2013, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option(s, sl) =
  case sl of
      [] => NONE
    | x::[] => if same_string(s,x) then SOME [] else all_except_option(s, [])
    | x::xs'::xs'' => if same_string(s,x)
		      then SOME (xs' :: xs'')
		      else if same_string(s,xs')
		      then SOME (x :: xs'')
		      else all_except_option(s, xs'')

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
	      
fun officiate(c,m,i) = i;
use "johnson_hw2_test.sml";

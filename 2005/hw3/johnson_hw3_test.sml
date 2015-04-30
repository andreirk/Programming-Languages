use "johnson_hw3.sml";
val name_hw = "2005 - Assignment Three"

val f1 = lineop_func
val f2 = lineprog_func
val f3 = pushn_right_safe

fun compare lop1 lop2 =
  case (lop1,lop2) of
      (PushRight,PushRight) => true
    | (PushLeft,PushLeft) => true
    | (SwapFirst,SwapFirst) => true
    | (ApplyRight _, ApplyRight _) => true
    | (ApplyLeft _, ApplyLeft _) => true
    | _ => false
fun comparelists(l1, l2) = List.foldl(fn((x,y),acc) => compare x y) true (ListPair.zip(l1,l2))
				   
(*Unit tests are of format string*bool where bool is represented by evaluation of a function to an expected value*)
val tests = [
    ("1.00", f1 PushRight ([],[]) <> ([],[]) handle Empty => true),
    ("1.01", f1 PushLeft ([],[]) <> ([],[]) handle Empty => true),
    ("1.02", f1 PushRight ([],[(1,2)]) <> ([],[]) handle Empty => true),
    ("1.03", f1 PushLeft ([(1,2)],[]) <> ([],[]) handle Empty => true),
    ("1.04", f1 SwapFirst ([],[]) <> ([],[]) handle Empty => true),
    ("1.05", f1 SwapFirst ([(1,2)],[]) <> ([],[]) handle Empty => true),
    ("1.06", f1 SwapFirst ([],[(1,2)]) <> ([],[]) handle Empty => true),
    ("1.07", f1 (ApplyRight(fn(x) => x)) ([],[]) <> ([],[]) handle Empty => true),
    ("1.08", f1 (ApplyLeft (fn(x) => x)) ([],[]) <> ([],[]) handle Empty => true),
    ("1.09", f1 (ApplyRight(fn(x) => x)) ([(1,2)],[]) <> ([],[]) handle Empty => true),
    ("1.10", f1 (ApplyLeft (fn(x) => x)) ([],[(1,2)]) <> ([],[]) handle Empty => true),

    ("1.20", f1 PushRight ([(1,2)],[]) = ([],[(1,2)])),
    ("1.21", f1 PushRight ([(1,2),(2,4)],[]) = ([(2,4)],[(1,2)])),
    ("1.22", f1 PushLeft ([],[(1,2)]) = ([(1,2)],[])),
    ("1.23", f1 PushLeft ([],[(1,2),(2,4)]) = ([(1,2)],[(2,4)])),
    ("1.24", f1 PushRight ([(1,2)],[]) = ([],[(1,2)])),

    ("1.30", f1 SwapFirst ([(1,2)],[(3,4)]) = ([(3,4)],[(1,2)])),
    ("1.31", f1 SwapFirst ([(1,2),(6,7)],[(3,4),(8,9)]) = ([(3,4),(6,7)],[(1,2),(8,9)])),
    
    ("1.40", f1 (ApplyRight(fn(x) => x)) ([],[(1,1)]) = ([],[(1,1)])),
    ("1.41", f1 (ApplyLeft(fn(x) => x)) ([(1,1)],[]) = ([(1,1)],[])),
    ("1.42", f1 (ApplyRight(fn(x) => x)) ([(2,2)],[(1,1)]) = ([(2,2)],[(1,1)])),
    ("1.43", f1 (ApplyLeft(fn(x) => x)) ([(2,2)],[(1,1)]) = ([(2,2)],[(1,1)])),
    ("1.44", f1 (ApplyRight(fn(x) => x)) ([(2,2)],[(1,1),(3,4)]) = ([(2,2)],[(1,1),(3,4)])),
    ("1.45", f1 (ApplyLeft(fn(x) => x)) ([(2,2),(4,5)],[(1,1)]) = ([(2,2),(4,5)],[(1,1)])),
    ("1.46", f1 (ApplyRight(fn(x,y) => (y,x))) ([(2,2)],[(1,2),(3,4)]) = ([(2,2)],[(2,1),(3,4)])),
    ("1.47", f1 (ApplyLeft(fn(x,y) => (y,x))) ([(2,3),(4,5)],[(1,1)]) = ([(3,2),(4,5)],[(1,1)])),
    ("1.48", f1 (ApplyRight(fn(x,y) => (y,x*4))) ([(2,2)],[(1,2),(3,4)]) = ([(2,2)],[(2,4),(3,4)])),
    ("1.49", f1 (ApplyLeft(fn(x,y) => (y,x*4))) ([(2,3),(4,5)],[(1,1)]) = ([(3,8),(4,5)],[(1,1)])),
    ("2.00", f2 [PushRight] ([(1,1)],[]) = ([],[(1,1)])),
    ("2.01", f2 [PushRight,PushLeft,PushRight] ([(1,1)],[]) = ([],[(1,1)])),
    ("2.02", f2 [SwapFirst,PushRight] ([(1,1)],[(2,2)]) = ([],[(2,2),(1,1)])),
    ("2.03", f2 [PushRight,PushRight,SwapFirst, ApplyRight(fn(x,y)=>(y,x)), ApplyLeft(fn(x,y)=>(2*y,3*x))] ([(1,2),(6,7),(3,4),(8,9)],[(3,4),(6,7),(1,2),(8,9)]) = ([(14,18),(8,9)],[(4,3),(1,2),(3,4),(6,7),(1,2),(8,9)])),

    ("3.00", comparelists(f3 0, [])),
    ("3.01", comparelists(f3 ~1, [])),
    ("3.02", comparelists(f3 1, [PushRight, ApplyRight(fn(x,y)=>(y,x))])),
    ("3.03", comparelists(f3 5, [PushRight, ApplyRight(fn(x,y)=>(y,x)),PushRight, ApplyRight(fn(x,y)=>(y,x)),PushRight, ApplyRight(fn(x,y)=>(y,x)),PushRight, ApplyRight(fn(x,y)=>(y,x)),PushRight, ApplyRight(fn(x,y)=>(y,x))]))
	
];

print ("\n----------------------"^name_hw^"--------------------------\n"); (*Name display to assert correct test file is running*)
fun all_tests(tests) =
	let fun helper(tests: (string*bool) list, all_passed) = 
		case tests of
			[] => all_passed
	  	  | (st, true)::rest =>  helper(rest, all_passed) (*I am only interested in the output if the test fails.*)
	  	  | (st, false)::rest => (print ("***" ^ st ^" !!!FAILED!!!\n"); helper(rest, false))
	in
		helper(tests, true)
	end;

case all_tests(tests) of
    true => print ((Int.toString (List.length(tests))) ^ "--TESTS RUN------------EVERY TESTS PASSED-------------\n")
		  
  | false => print "--------------SOMETHING IS WRONG-------------------------\n";


[1mFrom:[0m /home/fuad/the_odin_project/mastermind/mastermind.rb:110 CompBreaker.check:

     [1;34m94[0m: 	[32mdef[0m [1;36mself[0m.[1;34mcheck[0m
     [1;34m95[0m:     binding.pry
     [1;34m96[0m: 		[32mif[0m [36m@@random_comp_attempts[0m == [36m@@chosen_colors[0m
     [1;34m97[0m: 			[31m[1;31m"[0m[31mComputer wins![1;31m"[0m[31m[0m
     [1;34m98[0m: 		[32melse[0m
     [1;34m99[0m: 			[36m@@random_comp_attempts[0m.each_with_index [32mdo[0m |n, indx|
    [1;34m100[0m:         [32munless[0m [36m@@chosen_colors[0m.include?(n)
    [1;34m101[0m:           [36m@@random_comp_attempts[0m = []
    [1;34m102[0m:           [36m@@chosen_colors[0m.select{|num| num == n}.length.times [32mdo[0m
    [1;34m103[0m:             [36m@@random_comp_attempts[0m.push(n)
    [1;34m104[0m:           [32mend[0m
    [1;34m105[0m:         [32mend[0m
    [1;34m106[0m:       [32mend[0m
    [1;34m107[0m:       [32mif[0m [36m@@random_comp_attempts[0m.length < [1;34m4[0m
    [1;34m108[0m:         [1;36mself[0m.random_comp_color_chose 
    [1;34m109[0m:       [32melse[0m
 => [1;34m110[0m:         [36m@@random_comp_attempts[0m.shuffle!
    [1;34m111[0m:         [1;36mself[0m.check
    [1;34m112[0m:       [32mend[0m
    [1;34m113[0m:     [32mend[0m
    [1;34m114[0m:     [1;36mtrue[0m
    [1;34m115[0m:   [32mend[0m


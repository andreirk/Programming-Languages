val d1 = (1981,7,5)
val d2 = (1982,1,1)
val d3 = (1981,6,15)
val d4 = (1981,8,1)
val d5 = (1981,7,1)
val d6 = (1981,7,15)
val d7 = (1981,~7,5)
val d8 = (~1982,7,5);

is_older(d1,d2) = true;
is_older(d1,d3) = false;
is_older(d1,d4) = true;				   
is_older(d1,d5) = false;
is_older(d1,d6) = true;
is_older(d1,d7) = false;
is_older(d1,d8) = false;
is_older(d1,d1) = false;

val ld = [d1, d2, d3, d4, d5, d6, d7, d8];
number_in_month(ld, 1) = 1;
number_in_month(ld, 2) = 0;
number_in_month(ld, 7) = 4;
number_in_month(ld, 6) = 1;
number_in_month(ld, 8) = 1;
number_in_month(ld, ~7) = 1;
number_in_month([], 7) = 0;

val lm1 = [0, 1, 2, 3, ~4];
val lm2 = [1, 7, ~7, 8, 6];
val lm3 = [1000, 1981, 1982, ~1982];
val lm4 = [5, ~1, 15];
val lm5 = [1, ~7, 8, 6];
val lm6 = [7];
number_in_months(ld, lm1) = 1;
number_in_months(ld, lm2) = 8;
number_in_months(ld, lm3) = 0;
number_in_months(ld, lm4) = 0;
number_in_months(ld, lm5) = 4;
number_in_months(ld, lm6) = 4;
number_in_months([], lm2) = 0;

dates_in_month(ld, 1) = [d2];
dates_in_month(ld, 2) = [];
dates_in_month(ld, 7) = [d1, d5, d6, d8];
dates_in_month(ld, 6) = [d3];
dates_in_month(ld, 8) = [d4];
dates_in_month(ld, ~7) = [d7];
dates_in_month([], 7) = [];

dates_in_months(ld, lm1) = [d2];
dates_in_months(ld, lm2) = [d2,d1,d5,d6,d8,d7,d4,d3];
dates_in_months(ld, lm3) = [];
dates_in_months(ld, lm4) = [];
dates_in_months(ld, lm5) = [d2,d7,d4,d3];
dates_in_months(ld, lm6) = [d1,d5,d6,d8];
dates_in_months([], lm2) = [];

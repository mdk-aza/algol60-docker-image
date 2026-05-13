begin
    integer array DATA[1:10];
    integer array INDEX[1:5];
    integer k;

    comment データの初期化;
    for k := 1 step 1 until 10 do DATA[k] := k * 10;
    for k := 1 step 1 until 5 do INDEX[k] := k + 1;

    comment
       DATA[ INDEX[ INDEX[1] ] ] のような再帰的な参照。
       1. INDEX[1] = 2
       2. INDEX[2] = 3
       3. DATA[3] = 30
    ;
    outstring(1, "Recursive Access Result: ");
    outinteger(1, DATA[ INDEX[ INDEX[1] ] ]);
    outstring(1, "\n")
end
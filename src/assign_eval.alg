begin
    integer i;
    integer array A[1:10];

    comment 副作用を伴う関数。呼ばれるたびに i を増やしてその値を返す;
    integer procedure STEP;
    begin
        i := i + 1;
        outstring(1, "STEP called. Current I = ");
        outinteger(1, i);
        outstring(1, "\n");
        STEP := i
    end;

    i := 0;
    A[1] := 100;
    A[2] := 200;

    outstring(1, "--- Start Assignment: A[STEP] := STEP ---\n");

    comment
       3.1.4.2 および 4.2.3 の定義に基づき：
       1. 左辺の A[STEP] の添字 STEP が先に評価される (i=1 になり、対象が A[1] に固定) [cite: 17, 44]
       2. 右辺の STEP が評価される (i=2 になり、代入する値が 2 になる) [cite: 44, 45]
       3. A[1] に 2 が代入される [cite: 45]
    ;
    A[STEP] := STEP;

    outstring(1, "--- Results ---\n");
    outstring(1, "A[1] = "); outinteger(1, A[1]);
    outstring(1, "\nA[2] = "); outinteger(1, A[2]);
    outstring(1, "\nFinal I = "); outinteger(1, i);
    outstring(1, "\n")
end
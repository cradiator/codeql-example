void foo(int *p, int n) {
    if (n) {
        if (p == 0)
            return;
        *p;
    }
    *p;
}

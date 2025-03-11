void foo(int *p, int n) {
    if (n) {
        if (p == 0)
            return;
        *p;
    }
    if (p == 0)
        return;
    *p;
}

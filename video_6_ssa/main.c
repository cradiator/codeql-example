int global;

void foo(int *p) {
    if (p == 0)
        return;
    *p;

    if(global) {
        p = 0;
        *p;
    }

    *p;
}

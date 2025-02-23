void foo(int* ptr) {
    *ptr = 0;
    if (ptr == 0) {
        return;
    }
    *ptr = 0;
 }
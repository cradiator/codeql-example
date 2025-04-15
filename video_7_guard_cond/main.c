int global;

void func1(int* p) {
    if (p) {
        *p;
    } else {
        *p;
    }
}

void func2(int* p) {
    if (!p) {
        *p;
    } else {
        *p;
    }
}

void func3(int* p) {
    if (p != 0) {
        *p;
    } else {
        *p;
    }
}

void func4(int* p) {
    if (p == 0) {
        *p;
    } else {
        *p;
    }
}

int foo(int* x, int* y, int* p) {
    if (x && y && p) {
        *p;
    } else {
        *p;
    }
}

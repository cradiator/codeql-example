#include <stdlib.h>
struct S {
    int a;
    int b;
    int c;
    int d;
};

void init_s(struct S* s) {}

struct S* bad_new_S() {
    struct S* result;
    result = malloc(sizeof(result));
    init_s(result);
    return result;
}

struct S* good_new_S() {
    struct S* result;
    result = malloc(sizeof(*result));
    init_s(result);
    return result;
}
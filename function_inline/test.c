#include <stdio.h>

int square(int x) {
    return x * x;
}

int main() {
    int n;
    scanf("%d", &n);

    int result = square(n);

    printf("%d", result);
    return 0;
}
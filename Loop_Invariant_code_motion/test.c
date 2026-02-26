#include <stdio.h>

int main() {
    int a = 5, b;
    scanf("%d", &b);
    int sum = 0;

    for(int i = 0; i < 5; i++) {
        sum += a * b;
    }

    printf("%d", sum);
    return 0;
}
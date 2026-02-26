#include <stdio.h>

int main() {
    int sum = 0;
    int arr[100];

    for(int i = 0; i < 100; i++) {
        arr[i] = i;
    }

    for(int i = 0; i < 100; i++) {
        sum += arr[i];
    }

    printf("%d", sum);
    return 0;
}
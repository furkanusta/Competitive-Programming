/*
 * Given an array [NxN] where each item is 4byte(??) rotate the array 90 degrees
 * Can you do this in-place?
 *
 * In the question it is not specified whether the rotation is to the left of to the right
 *    I will assume it is to the right
 */
#include <iostream>

int** rotate(int **, int N);
void rotate_inplace(int **, int N);

int main() {
    int N = 7;
    int **arr = new int*[N];
    for (int i = 0; i < N; i++) {
        arr[i] = new int[N];
        for (int j = 0; j < N; j++)
            arr[i][j] = i * N + j + 1;
    }
        
    int **ret = rotate(arr, N);
    for (int i = 0; i < N; i++, std::cout << std::endl)
        for (int j = 0; j < N; j++)
            std::cout << ret[i][j] << " ";

    std::cout << std::endl;
    rotate_inplace(arr, N);
    for (int i = 0; i < N; i++, std::cout << std::endl)
        for (int j = 0; j < N; j++)
            std::cout << arr[i][j] << " ";

    // Memory-Leak
    for (int i = 0; i < N; i++) {
        delete[] arr[i];
        delete[] ret[i];
    }
    delete[] arr;
    delete[] ret;
}

// O(N^2) time, O(N^2) space
int** rotate(int **arr, int N) {
    int **temp = new int*[N];
    for(int i = 0; i < N; i++)
        temp[i] = new int[N];

    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            temp[j][N - i - 1] = arr[i][j];
    return temp;
}

// Rotates in-place
// Ever movement only affects other 3 movement
// at every iteration, moves 4 item in place
// O(N^2) time, O(1) space, in-place
void rotate_inplace(int **arr, int N) {

    int temp;
    for (int i = 0; i < (N / 2); i++) {
        for (int j = i; j < N - i - 1; j++) {
            temp = arr[N - j - 1][i];
            arr[N - j - 1][i] = arr[N - i - 1][N - j - 1];
            arr[N - i - 1][N - j - 1] = arr[j][N - i - 1];
            arr[j][N - i - 1] = arr[i][j];
            arr[i][j] = temp;
        }
    }
}

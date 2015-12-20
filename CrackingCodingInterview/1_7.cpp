/*
 * write a method that given NxM matrix, if an item is 0 then sets entire column and row to 0
 */
#include <iostream>

void set(int**, int, int);

int main() {

    int N = 3, M = 3;
    int **arr = new int*[N];
    arr[0] = new int[3]{1,2,3};
    arr[1] = new int[3]{4,0,6};
    arr[2] = new int[3]{7,8,9};
    set(arr, N, M);
    for(int i = 0; i < N; i++, std::cout << std::endl)
        for (int j = 0; j < M; j++)
            std::cout << arr[i][j] << " ";
    
    int **arr2 = new int*[N];
    arr2[0] = new int[3]{0,2,0};
    arr2[1] = new int[3]{4,5,6};
    arr2[2] = new int[3]{0,8,0};
    
    std::cout << std::endl;
    set(arr2, N, M);
    for(int i = 0; i < N; i++, std::cout << std::endl)
        for (int j = 0; j < M; j++)
            std::cout << arr2[i][j] << " ";
    
    for(int i = 0; i < N; i++) {
        delete[] arr[i];
        delete[] arr2[i];
    }
    delete[] arr;
    delete[] arr2;
}

// O(NM) time, O(NM) space, in-place
void set(int **arr, int N, int M) {
    bool **mark = new bool*[N];
    for (int i = 0; i < N; i++) {
        mark[i] = new bool[M];
        for (int j = 0; j < M; j++)
            mark[i][j] = (arr[i][j] == 0);
    }
    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; j++)
            if (mark[i][j]) {
                for (int x = 0; x < N; x++)
                    arr[x][j] = 0;
                for (int x = 0; x < M; x++)
                    arr[i][x] = 0;
            }
    
    for (int i = 0; i < N; i++)
        delete[] mark[i];
    delete[] mark;
}
    

/*
 * Replaces all the spaces in a char array with %20
 * Array has sufficient space at the end of the string
 * Perform the operation in-place
 */
#include <iostream>

void replace(char *arr, int n);

int main() {

    char arr[7] = "asdfgh";
    replace(arr, 6);
    std::cout << arr << std::endl;

    char arr2[23] = " space  space ";
    replace(arr2,22);
    std::cout << arr2 << std::endl;
}

// O(N) time, in-place
void replace(char *arr, int n) {

    int pos = n - 1;
    int index = n - 1;
    
    for (int i = n - 1; i >=0; i--)
        if (arr[i]) {
            pos = i;
            break;
        }

    for (int i = pos; i >=0; i--) {
        if (arr[i] != ' ') {
            arr[index] = arr[i];
            index--;
        }
        else {
            arr[index] = '0';
            arr[index - 1] = '2';
            arr[index - 2] = '%';
            index -= 3;
        }
    }
}

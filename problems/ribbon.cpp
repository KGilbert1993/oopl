#include <stdlib.h>
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

#define DEBUG
int main(int argc, char** argv) {
    vector<int> lengths;
    int total_len = atoi(argv[1]);
    for(int i = 0; i < (argc-2); ++i)
        lengths.push_back(atoi(argv[2+i]));

    sort(lengths.begin(), lengths.end());
    int pieces = 0;
    
    while(total_len > 0) {
        vector<int>::const_iterator search = find(lengths.begin(), lengths.end(), total_len);
        if(search != lengths.end()) {
            total_len -= *search;
        } else
            total_len -= lengths.front();
        ++pieces;
    }
    cout << pieces << endl;
    return 0;
}

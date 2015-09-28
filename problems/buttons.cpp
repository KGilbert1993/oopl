#include <iostream>
#include <vector>

using namespace std;

void generate_ladder(vector<int>& ladder, int goal) {
    while(goal != 1) {
        if(goal & 0x0001)   // last bit set, odd
            goal += 1;
        else
            goal >>= 1;
        ladder.push_back(goal);
    }
}

int main(int argc, char **argv) {
    int start = atoi(argv[1]);
    int goal  = atoi(argv[2]);
    int steps = 0;
    
    vector<int> ladder;
    generate_ladder(ladder, goal);
    
    #ifdef DEBUG
    for(auto i : ladder) 
        cout << i << " ";
    cout << endl;
    #endif
}

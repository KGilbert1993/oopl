#include <iostream>
#include <algorithm>
#include <vector>
#include <iterator>

using namespace std;

void generate_ladder(vector<int>& ladder, int goal) {
    ladder.push_back(goal);
    while(goal != 1) {
        if(goal & 0x0001)   // last bit set, odd
            goal += 1;
        else
            goal >>= 1;
        ladder.push_back(goal);
    }
}


//#define DEBUG
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

    int ladder_start = 0;
    for(auto i : ladder) {
        #ifdef DEBUG
        cout << i << endl;
        #endif
        if(i <= start) {
            ladder_start = i;
            break;
        }
    }
    
    steps = start - ladder_start;
    while(start != ladder_start)
        --start;
   
    vector<int>::iterator lstart_iter = find(ladder.begin(), ladder.end(), ladder_start);
    #ifdef DEBUG
    cout << "Steps: " << steps << endl;
    cout << "Ladder Iterator: " << *lstart_iter << endl;
    cout << "Ladder start: " << distance(ladder.begin(), lstart_iter) << endl;     
    #endif
    cout << steps + distance(ladder.begin(), lstart_iter) << endl;
    return 0;
}

#include <iostream>
#include <vector>
using namespace std;
 
int main(){
    int h,w;
    cin >> h >> w;
    int min=100;
    vector<vector<int>> a(h ,vector<int>(w));
    for(int i=0; i<h; i++){
      for(int j=0; j<w; j++){
        cin >> a[i][j];
        if(min > a[i][j]) min=a[i][j];
      }
    }
 
    int total=0;
    for(int i=0; i<h; i++){
      for(int j=0; j<w; j++){
        total+=a[i][j]-min;
      }
    }
 
   cout << total << endl;
      
    return 0;
}
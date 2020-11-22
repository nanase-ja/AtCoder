#include <iostream>
using namespace std;

int main(){
    int n,x;
  string s;
  cin >> n >> x >> s;
  for(int i=0; i<n; i++){
    if(s.substr(i, 1) == "o"){
      x+=1;
    }else{
     if(x > 0){
       x-=1;
      }
    }
  }
  cout << x << endl;
  return 0;
}

#include <iostream>
using namespace std;

int main(){
  int a,b,c,d;
  cin >> a >> b >> c >> d;
  int ans = a;
  ans = min(ans,b);
  ans = min(ans,c);
  ans = min(ans,d);
  cout << ans << endl;
  return 0;
}
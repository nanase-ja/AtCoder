#include <iostream>
using namespace std;

int main(){
    int n;
    cin >> n;
    const int INF = 10000;
    int l = 0, r = INF;
    for(int i=0; i<n; i++){
        int a;
        cin >> a;
        l = max(l, a);
    }
    for(int i=0; i<n; i++){
        int b;
        cin >> b;
        r = min(r, b);
    }
    int ans = r-l+1;
    ans = max(ans, 0);
    cout << ans << endl;
    return 0;
}
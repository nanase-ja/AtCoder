#include <iostream>
using namespace std;

int main(){
    double sx, sy, gx, gy;
    cin >> sx >> sy >> gx >> gy;
    double ans = (gx-sx)*sy/(sy+gy)+sx;
    printf("%.10f\n", ans);
    return 0;
}
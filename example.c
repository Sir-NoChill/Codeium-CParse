#include "example.h"
#include <stdarg.h>

int target1(char a);
char target2(int b);
double target3(double b);
long thingy(long r);
void thingy2(long r);
short thingy3(long r);

unsigned short thingy4(long r);
unsigned long thingy5(long r);
unsigned long long thingy6(long r);

long double thingy7(long r);
double thingy8(long r);

float thingy9(long r, int (*)(), float (*)());

struct beans {
    int a;
    int b;
    double r;
    char* c;
};

/*this is struct docstring*/
struct spock {
    int a;
    struct beans b;
};

// this is also docstring
int func() {
    return 0;
}

// random example I pulled off stackexchange
typedef struct client_t client_t, *pno;
struct client_t
{
    pid_t pid;
    char password[TAM_MAX]; // -> 50 chars
    pno next;

    pno (*AddClient)(client_t *);
};

pno client_t_AddClient(client_t *self) { /* code */ }

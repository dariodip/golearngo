package couple

import (
	"fmt"
	"math"
	"math/rand"
	"time"
)

type Math interface {
	BothPrimes() bool
	Average() float64
	Reset()
	String() string
}

type IntCouple struct {
	a, b int
}

func NewIntCouple(min, max int) IntCouple {
	return IntCouple{
		a: randMinMax(max, min),
		b: randMinMax(max, min),
	}
}

func randMinMax(max int, min int) int {
	rand.Seed(time.Now().UTC().UnixNano())
	return rand.Intn(max-min) + min
}

// questa funzione è pubblica
func (i IntCouple) BothPrimes() bool {
	isPrime := func(x int) bool {
		for i := 2; i <= int(math.Floor(math.Sqrt(float64(x)))); i++ {
			if x%i == 0 {
				return false
			}
		}
		return x > 1
	}
	return isPrime(i.a) && isPrime(i.b)
}

func (i IntCouple) Average() float64 {
	return (float64(i.a) + float64(i.b)) / 2.0
}

func (i *IntCouple) Reset() {
	i.a = 0
	i.b = 0
}

func (i IntCouple) String() string {
	return fmt.Sprintf("{a:%d,b:%d}", i.a, i.b)
}


type SetOfCouplesOfPrimes []Math

func (s SetOfCouplesOfPrimes) String() string {
	st := "["
	for c := range s {
		st += fmt.Sprintf("%s,", c)
	}
	st = st[0 : len(st)-1]
	return st + "]"
}

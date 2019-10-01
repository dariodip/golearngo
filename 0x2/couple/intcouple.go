package couple

type Math interface {
}

type IntCouple struct {
}

func NewIntCouple(min, max int) IntCouple {
	panic("non implementato")
}

func randMinMax(max int, min int) int {
	panic("non implementato")
}

// questa funzione è pubblica
func (i IntCouple) BothPrimes() bool {
	panic("non implementato")
}

func (i IntCouple) Average() float64 {
	panic("non implementato")
}

func (i *IntCouple) Reset() {
	panic("non implementato")
}

func (i IntCouple) String() string {
	panic("non implementato")
}

type SetOfCouplesOfPrimes []Math

func (s SetOfCouplesOfPrimes) String() string {
	panic("non implementato")
}

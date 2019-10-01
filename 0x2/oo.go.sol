package main

import (
	"fmt"
	"golearngo/0x2/couple"
	"math/rand"
)

const (
	MAX = 1000000
	MIN = 1
)

// Vogliamo una lista di almeno 3 coppie di numeri primi e ne stampiamo la media. Se il numero di tentativi supera 10.000
// mandiamo il programma in panic
func main() {
	l := make([]couple.Math, 3, 3)
	attempts := 100
	for i := 0; i < 3; i++ {
		myCouple := CoupleOfPrimes2(&attempts)
		if myCouple == nil {
			panic("troppi tentativi")
		}
		l[i] = myCouple
	}
	fmt.Printf("Ho trovato 3 coppie di numeri primi: %s in %d tentativi", l, 100-attempts)
}

func CoupleOfPrimes2(attempts *int) couple.Math {
	myCouple := couple.NewIntCouple(MIN, MAX)
	for !myCouple.BothPrimes() {
		if *attempts <= 0 {
			return nil
		}
		*attempts--
		myCouple = couple.NewIntCouple(MIN, MAX)
	}
	return &myCouple
}


func main3() {
	l := new([]couple.Math)
	attempts := 1000
	for len(*l) < 3 {
		if attempts <= 0 {
			panic("troppi tentativi")
		}
		myCouple, att := CoupleOfPrimes1()
		newList := append(*l, myCouple)
		l = &newList
		attempts -= att
	}
	fmt.Printf("Ho trovato 3 coppie di numeri primi: %s in %d tentativi", *l, 100-attempts)
}

func CoupleOfPrimes1() (couple.Math, int) {

	myCouple := couple.NewIntCouple(MIN, MAX)
	attempts := 0
	for !myCouple.BothPrimes() {
		attempts++
		myCouple = couple.NewIntCouple(MIN, MAX)
	}
	return &myCouple, attempts
}

// Vogliamo una funzione che ci generi un oggetto di tipo Math che abbia all'interno due numeri primi e vogliamo stamparne la media
func main2() {
	cop := CoupleOfPrimes()
	fmt.Printf("Abbiamo trovato la coppia: %s\n", cop)
	fmt.Printf("La media dei due numeri è %.2f\n", cop.Average())
	fmt.Println("Ora li resettiamo e controlliamo la media")
	cop.Reset()
	fmt.Printf("Ora i numeri sono %s\n", cop)
	fmt.Println("La nuova media è ", cop.Average())
}

func CoupleOfPrimes() couple.Math {
	myCouple := couple.NewIntCouple(1, 1000000)
	for !myCouple.BothPrimes() {
		myCouple = couple.NewIntCouple(1, 100000)
	}
	return &myCouple
}

// Vogliamo calcolare due numeri causali da 1 a 10.000 che siano entrambi primi. Nel caso in cui lo fossero, vogliamo
// stamparli a schermo insieme alla loro media.
// Voglio anche sapere quanti tentativi ho effettuato
func main1() {
	myCouple := couple.NewIntCouple(1, 1000000)
	attempts := 0
	fmt.Println(myCouple)
	for !myCouple.BothPrimes() {
		myCouple = couple.NewIntCouple(1, 100000)
		attempts++
	}
	fmt.Printf("Ho trovato due numeri primi in %d passi\n", attempts)
	//fmt.Printf("I numeri %d e %d sono primi e la loro media è %.2f\n", myCouple.a, myCouple.b, myCouple.Average())
}

func main0() {
	fmt.Println("Here is a (pseudo)random number: ", rand.Intn(10))
}

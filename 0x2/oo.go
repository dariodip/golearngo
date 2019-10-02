package main

import (
	"fmt"
	"golearngo/0x2/mine"
)

// Abbiamo una miniera d'oro (un file contenente o una roccia o un pezzo d'oro grezzo).
// Abbiamo tre categorie diverse di lavoratori:
// * il finder: è in grado di entrare nella miniera e trovare i pezzi di oro grezzo
// * il miner: ricevute le posizioni in cui si trova l'oro grezzo, può minarli ottenendo pepite d'oro
// * il fonditore: riceve le pepite d'oro e le fonde in un unico lingotto
func main() {
	minePath := "./0x2/res/mine"
	m := mine.GiveMyMine(minePath)
	finder := new(mine.IndolentFinder)
	miner := new(mine.IndolentMiner)
	smelter := new(mine.IndustriousSmelter)
	ingot := m.WorkSequential(finder, miner, smelter)
	fmt.Println(ingot)
}

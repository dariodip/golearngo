package mine

type Mine []string     // la miniera
type Ores []int        // lista di posizioni in cui c'è l'oro
type MinedOres []uint8 // lista di pesi dell'oro estratto
type Ingot uint64      // lingotto totale

// Il finder trova le posizioni in cui si trova l'oro nella miniera
type Finder interface {
}

// Il miner trova l'oro partendo dalla miniera e conoscendo le posizioni in cui si trova l'oro
type Miner interface {
}

// Lo smelter fonde tutto l'oro in un unico grande lingotto
type Smelter interface {
}

// Restituisce la miniera partendo dal path del file
func GiveMyMine(path string) Mine {
	panic("non implementato")
}

// Lavora sequenzialmente nella miniera e restituisce il lingotto trovato
func (m Mine) WorkSequential(f Finder, mr Miner, s Smelter) Ingot {
	panic("non implementato")
}

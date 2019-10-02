package mine

import (
	"io/ioutil"
	"strconv"
	"strings"
	"time"
)

const ROCK = "rock"

type Mine []string	// la miniera
type Ores []int		// lista di posizioni in cui c'è l'oro
type MinedOres []uint8	// lista di pesi dell'oro estratto
type Ingot uint64		// lingotto totale

// Il finder trova le posizioni in cui si trova l'oro nella miniera
type Finder interface {
	Find(mine Mine) Ores
}

// Il miner trova l'oro partendo dalla miniera e conoscendo le posizioni in cui si trova l'oro
type Miner interface {
	Mine(os Ores, m Mine) MinedOres
}

// Lo smelter fonde tutto l'oro in un unico grande lingotto
type Smelter interface {
	Smelt(ms MinedOres) Ingot
}

// Restituisce la miniera partendo dal path del file
func GiveMyMine(path string) Mine {
	bufMine, err := ioutil.ReadFile(path)
	if err != nil {
		panic(err)
	}
	s := string(bufMine)
	s = strings.ReplaceAll(s, "\n", "")
	mine := strings.Split(s, " ")
	return mine
}

// Estrae l'oro in posizione i nella miniera, se non è oro ma una roccia, restituisce un errore
func (m Mine) ExtractGold(i int) (uint8, error) {
	minedOre, err := strconv.Atoi(m[i])
	return uint8(minedOre), err
}

// Restituisce vero se trova in posizione i nella miniera l'oro, falso altrimenti
func (m Mine) IsItOre(i int) bool {
	return m[i] != ROCK
}

// Lavora sequenzialmente nella miniera e restituisce il lingotto trovato
func (m Mine) WorkSequential(f Finder, mr Miner, s Smelter) Ingot {
	oreL := f.Find(m)
	minedL := mr.Mine(oreL, m)
	ingot := s.Smelt(minedL)
	return ingot
}

// Un worker sa quanti giorni e quanto tempo ha lavorato
type Worker struct {
	workedDays		int
	totalWorkedTime	time.Duration
}

// Un finder che adora riposare
type IndolentFinder struct {
	totalFound		int
	Worker
}

func (f *IndolentFinder) Find(m Mine) Ores {
	f.workedDays++
	t0 := time.Now()
	oreL := make(Ores, 0)
	for pos := range m {
		time.Sleep(time.Millisecond)
		if m.IsItOre(pos) {
			oreL = append(oreL, pos)
			f.totalFound++
		}
	}
	elapsed := time.Now().Sub(t0)
	f.totalWorkedTime = elapsed + f.totalWorkedTime
	return oreL
}

// Un miner che adora riposare
type IndolentMiner struct {
	Worker
}

func (i *IndolentMiner) Mine(os Ores, m Mine) MinedOres {
	i.workedDays++	// segna la giornata lavorativa
	t0 := time.Now()
	minedOres := make(MinedOres, len(os), len(os))
	for i, minedOreI := range os {
		time.Sleep(time.Millisecond)
		gold, err := m.ExtractGold(minedOreI)
		if err != nil {
			panic(err)
		}
		minedOres[i] = gold	// aggiung
	}
	i.totalWorkedTime += time.Now().Sub(t0)
	return minedOres
}

// Uno smelter che adora lavorare
type IndustriousSmelter struct {
	Worker
}

func (is IndustriousSmelter) Smelt(ms MinedOres) Ingot {
	is.workedDays++
	t0 := time.Now()
	var totalIngot Ingot
	for minedOreI := range ms {
		totalIngot += Ingot(ms[minedOreI])
	}
	is.totalWorkedTime += time.Now().Sub(t0)
	return totalIngot
}





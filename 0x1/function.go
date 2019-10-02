package main

import (
	"fmt"
	"reflect"
	"strings"
)

const GREET = "Hello"

func main() {
	s := hello1("Dario")
	fmt.Println(s)
	fmt.Println(reflect.TypeOf(s))
}

func hello0(who string) string {
	return "Hello, " + who
}

func hello1(who string) string {
	return fmt.Sprintf("Hello, %s", who)
}

func hello2(who string) string {
	if strings.HasPrefix(who, "Dario") {
		return fmt.Sprintf("Grüezi, %s", who)
	} else {
		return fmt.Sprintf("Hello, %s", who)
	}
}

func hello3(who string) string {
	var greet string
	if strings.HasPrefix(who, "Dario") {
		greet = "Grüezi"
	} else {
		greet = GREET
	}
	return fmt.Sprintf("%s, %s", greet, who)
}

func hello4(who string) string {
	s := ""
	for i := 0; i < 10; i++ {
		s += hello3(who) + "\n"
	}
	return s
}

func hello5(who string) string {
	s := ""
	greeting := hello3(who)
	for pos, ch := range greeting {
		s += fmt.Sprintf("%d:%s\n", pos, string(ch))
	}
	return s
}

func hello6(who string) string {
	for {
		fmt.Println(hello3(who))
	}
}

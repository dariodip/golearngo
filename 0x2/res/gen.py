from random import randrange

# generates mine
if __name__ == '__main__':
    with open("mine", 'w') as f:
        mine = map(lambda x: str(x) if x > 0 else "rock",[randrange(255+128)-128 for _ in range(0,10000)])
        f.write(" ".join(mine))
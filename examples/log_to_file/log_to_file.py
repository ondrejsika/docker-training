import time

i = 0
while i < 10:
    with open("out.log", "a") as f:
        f.write("%i\n" % i)
    time.sleep(1)
    i+=1

#Homework1
#4.

def f(n):
    if n>100:
        return n-10
    else:
        return f(f(n+11))



for i in range (101):
     print i, f(i)-91
print f(1),f(-6),f(200),f(27),f(100),f(99)


#5.
def A(x,y):
    if x==0:
        return y+1
    elif y==0:
        return A(x-1,1)
    else:
        return A(x-1,A(x,y-1))




for i in range(4):
    for j in range(4):
        print i,j,A(i,j)


#6.
def egcd(a,b):  # a > b > 0
    

    if a%b==0: return (0,1,b)
    q=[]
    while a%b != 0:
        q.append(-1*(a//b))
        (a,b)=(b,a%b)
    (a,b,gcd)=(1,q.pop(),b)
    while q:(a,b)=(b,b*q.pop()+a)
    return (a,b,gcd)

print egcd(1600,300),egcd(6,15),egcd(45,3000),egcd(16000,64),

#7
def reverse(l, first=0, last=-1):
    if first >= len(l)/2: return
    l[first], l[last] = l[last], l[first]
    reverse(l, first+1, last-1)

mylist = [101,102,106,114,1555]
print mylist
reverse(mylist)
print mylist

#8
times =0
def anagram(st):
    global times
    times += 1;
    print times;
    if st=='':
        return ['']
    lout=[]
    for i in range(len(st)):
        st2=st[:i]+st[i+1:]
        lout2=anagram(st2)
        for w in lout2:
            lout.append(st[i]+w)
    return lout


ana=anagram('cat')
ana.sort()
print ana, len(ana)

Input_str=input("Please enter a string:")
times=0
def anagramGenerator_B(Input_st):
    global times
    times+=1
    if len(Input_st)<2:
        return Input_st
    else:
        lout=[]
        for i in anagramGenerator_B(Input_st[1:]):
            for n in range(len(Input_st)):
                lout.append(i[:n]+Input_st[0]+i[n:])
        return lout


  
print(anagramGenerator_B(Input_str),times)


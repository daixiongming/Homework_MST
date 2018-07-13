#homework2
#1.
def f(i):
    if i<=1:
        return 1
    else:
        return f(i-1)+i*i


def g(n):
    return n*(n+1)*(2*n+1)/6


for i in range(50):
    print i+1, f(i+1),g(i+1)

#2.
def f(n):
    if n==0:
        return 9
    else:
        return 9*n**2+9*n+9+f(n-1)




def g(n):
    return (n**3+(n+1)**3+(n+2)**3)


def P(n):
    return (f(n)==g(n)) and (0==(g(n) %9))

for n in range(16):
    print "n=%2d f(n)=%4d g(n)=%4d P(n)=%s"%(n,f(n),g(n),P(n))

#3.
def f(n):
    if n==0:
        return 11*11+12
    else:
        return 10*11**(n+1)+(12*12-1)*12**(2*n-1)+f(n-1)




def g(n):
    return (11**(n+2)+12**(2*n+1))


def P(n):
    return (f(n)==g(n)) and (0==(g(n) %133))

for n in range(10):
    print "n=%2d f(n)=%4d g(n)=%4d P(n)=%s"%(n,f(n),g(n),P(n))

#5.
def fibcount(n):
    if n<2:
        return (1,1)
    f1,c1=fibcount(n-1)
    f2,c2=fibcount(n-2)
    return (f1+f2,c1+c2+1)


def Rec(n):
    if n<2:
        return (1)
    else:
        return Rec(n-1)+Rec(n-2)+1

def fibCC(n):
    d1,d2=fibcount(n)
    return d2

def P(n):
   return (Rec(n)==fibCC(n)) 
for n in range(30):
    print "n=%2d Rec(n)=%4d fibCC(n)=%4d P(n)=%s"%(n,Rec(n),fibCC(n),P(n))

#7.
    #!/usr/bin/python

class Node:
    def __init__(self, val):
        self.l = None
        self.r = None
        self.v = val

class Tree:
    def __init__(self):
        self.root = None

    def getRoot(self):
        return self.root

    def add(self, val):
        if(self.root == None):
            self.root = Node(val)
        else:
            self._add(val, self.root)

    def _add(self, val, node):
        if(val < node.v):
            if(node.l != None):
                self._add(val, node.l)
            else:
                node.l = Node(val)
        else:
            if(node.r != None):
                self._add(val, node.r)
            else:
                node.r = Node(val)

    def find(self, val):
        if(self.root != None):
            return self._find(val, self.root)
        else:
            return None

    def _find(self, val, node):
        if(val == node.v):
            return node
        elif(val < node.v and node.l != None):
            self._find(val, node.l)
        elif(val > node.v and node.r != None):
            self._find(val, node.r)

    def deleteTree(self):
        # garbage collector will do this for us. 
        self.root = None

    def printTree(self):
        if(self.root != None):
            self._printTree(self.root)

    def _printTree(self, node):
        if(node != None):
            self._printTree(node.l)
            print str(node.v) + ' '
            self._printTree(node.r)

#     3
# 0     4
#   2      8
tree = Tree()
tree.add(3)
tree.add(4)
tree.add(0)
tree.add(8)
tree.add(2)
tree.printTree()
##print (tree.find(3)).v
##print tree.find(10)
##tree.deleteTree()
##tree.printTree()


def leaves_and_internals(tree):
    """(BTNode) -> ([object], [object])
    Return a pair of lists: (list of all the items stored in the leaves of
    the subtree rooted at this node, list of all the items stored in the
    internal nodes of the subtree rooted at this node).
    """
    leaves = []
    internal = []

    if tree.l is None and tree.r is None:
        leaves.append(tree.v)
    else:
        internal.append(tree.v)
    if tree.l:
        subleaf, subinternal = tree.l.leaves_and_internals()
        leaves.extend(subleaf)
        internal.extend(subinternal)           
    if tree.r:
        subleaf, subinternal = tree.r.leaves_and_internals()
        leaves.extend(subleaf)
        internal.extend(subinternal)

    return (leaves, internal)


aa=leaves_and_internals(tree)
print aa



 
    

import numpy as np
import matplotlib.pyplot as plt

y = [431 ,409 ,429 ,422 ,530 ,505 ,459 ,499,526,563 ,587 ,595,647 ,669 ,746 ,760,778,828,846,836,916,956,1014,1076,1134,1024]
x = range(20,46)
print(x)
p,c = np.polyfit(x,y,1,cov='unscaled')
plt.plot(x, y, 'ro')
x = np.linspace(min(x)*0.85,max(x)*1.1,100)
y = [np.polyval(p, i) for i in x]
plt.plot(x,y)
plt.grid(which='major')
print([[pow(c[i,i],0.5),p[i]] for i in range(len(p))])
plt.ylabel("deaths")
plt.xlabel("age")
print(p)
plt.show()
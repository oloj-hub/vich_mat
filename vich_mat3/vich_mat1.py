import numpy as np
import matplotlib.pyplot as plt

y = [431 ,409 ,429 ,422 ,530 ,505 ,459 ,499,526,563 ,587 ,595,647 ,669 ,746 ,760,778,828,846,836,916,956,1014,1076,1134,1024]
x = range(20,46)
print(x)
p1,c1 = np.polyfit(x[0:9],y[0:9],1,cov='unscaled')
p2,c2 = np.polyfit(x[8:20],y[8:20],1,cov='unscaled')
p3,c3 = np.polyfit(x[19:],y[19:],1,cov='unscaled')
plt.plot(x, y, 'ro')
a = np.linspace(min(x[0:9]),max(x[0:9]),100)
b = [np.polyval(p1, i) for i in a]
plt.plot(a,b)
a = np.linspace(min(x[8:20]),max(x[8:20]),100)
b = [np.polyval(p2, i) for i in a]
plt.plot(a,b)
a = np.linspace(min(x[19:]),max(x[19:]),100)
b = [np.polyval(p3, i) for i in a]
plt.plot(a,b)
plt.grid(which='major')
plt.ylabel("deaths")
plt.xlabel("age")
print(p1,p2,p3)
plt.show()
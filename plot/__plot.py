import math
import matplotlib.pyplot as plt 

plt.plot([0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1],
[0.2171,0.2183,0.2183,0.2187,0.2189,0.219,0.2188,0.2187,0.2181,0.2178,0.2169,0.2165,0.2157,0.2139,0.2122,0.2108,0.2086,0.2058,0.2034,0.2008,0.1978], 'r-x');

plt.suptitle('okapi_ap8889')
plt.xlabel('parameter b')
plt.ylabel('MAP value')
plt.grid(True)
plt.show()

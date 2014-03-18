import math
import matplotlib.pyplot as plt 

plt.plot([0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1],
[0.0096,0.009,0.0088,0.0082,0.0081,0.0079,0.0077,0.0076,0.0075,0.0073,0.0073,0.0072,0.0071,0.007,0.0069,0.0068,0.0068,0.0067,0.0067,0.0066,0.0066], 'r-x');

plt.suptitle('pivoted_normaliztion_doe')
plt.xlabel('parameter s')
plt.ylabel('MAP value')
plt.grid(True)
plt.show()

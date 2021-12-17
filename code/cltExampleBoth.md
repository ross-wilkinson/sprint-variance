::: {.cell .markdown}
How many observations should I make? An application of the central limit theorem to human performance variables
===============================================================================================================

*Author: Ross Wilkinson*
:::

::: {.cell .markdown}
Introduction
------------
:::

::: {.cell .markdown}
### Example

We decide that it is feasible for our subject (Ross) to perform 12
sprints, each seperated by 3 minutes of rest, in one testing session
without introducing any dependent variables like fatigue. On day 1, Ross
performs 12 sprints on a traditional stationary ergometer. On day 2,
Ross performs 12 sprints outside on bike. Once we have our results from
each day of testing, we will visualize the data, check for any linear
trends, fit a distribution, run some simulations to decide on the number
of observations we should take, then compare the level of uncertainty
between the ergometer and the bike.
:::

::: {.cell .code execution_count="3"}
``` {.python3}
# initialize packages
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
```
:::

::: {.cell .markdown}
Our results
-----------
:::

::: {.cell .code execution_count="4"}
``` {.python3}
maxPowerErgo = np.array([1545, 1526, 1526, 1565, 1614, 1544, 1553, 1611, 1519, 1608, 
                         1571, 1566])

maxPowerBike = np.array([1179, 1145, 1203, 1205, 1201, 1201, 1181, 1172, 1221, 1163, 
                         1211, 1171])
```
:::

::: {.cell .markdown}
Visualize data
--------------
:::

::: {.cell .code execution_count="10"}
``` {.python3}
plt.hist(maxPowerErgo,3)
plt.hist(maxPowerBike,3)
plt.xlabel('Maximal power output (W)')
plt.ylabel('Count')
plt.legend(['Ergo','Bike'])
```

::: {.output .execute_result execution_count="10"}
    <matplotlib.legend.Legend at 0x7ffb4bf691c0>
:::
:::

::: {.cell .markdown}
### Scatter plots
:::

::: {.cell .code execution_count="19"}
``` {.python3}
plt.scatter(np.arange(12), maxPowerErgo)
plt.scatter(np.arange(12), maxPowerBike)
```

::: {.output .execute_result execution_count="19"}
    <matplotlib.collections.PathCollection at 0x7ffb4c30b700>
:::
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .markdown}
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

::: {.cell .code}
``` {.python3}
```
:::

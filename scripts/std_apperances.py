import pandas as pd
import seaborn as sn
import matplotlib.pyplot as plt

df = pd.read_csv("/tmp/std_uses.txt", header=None)
df.columns = ["std"]
df["Count"] = 1
df = df.groupby("std").count()
df.reset_index(level=0, inplace=True)
df.sort_values(by="Count", ascending=False, inplace=True)

ax = sn.barplot(x="std", y="Count", data=df)
plt.gcf().subplots_adjust(bottom=0.5)
plt.xticks(rotation="vertical")

for tick in ax.xaxis.get_major_ticks():
                tick.label.set_fontsize(15)
for tick in ax.yaxis.get_major_ticks():
                tick.label.set_fontsize(15)
plt.xlabel("std", fontsize=12)
plt.ylabel("Count", fontsize=12)

plt.show()

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb

pd.set_option('display.max_columns', None)

titanic = pd.read_csv('titanic.csv')
titanic = titanic.assign(Relatives = (titanic.SibSp != 0) | (titanic.Parch != 0))
print(titanic.info)
print(titanic.groupby('Sex')["Survived"].sum())
print(titanic.groupby('Sex')["Survived"].sum())
print(pd.pivot_table(titanic[["Survived", "Sex"]], index="Survived", columns="Sex", aggfunc=len))
titanic["Pclass"] = titanic.Pclass.replace({1 : "Bourgeoisie", 2 : "Middle", 3 : "Proletariat"})

#titanic[titanic.Survived == 1].hist(column="Age")
#titanic[titanic.Survived == 0].hist(column="Age")
sb.histplot(data=titanic, x="Age", hue="Survived", bins=50)
plt.show()
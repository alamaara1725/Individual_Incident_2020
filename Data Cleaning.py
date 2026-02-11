#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#importing necessary libraries
import pandas as pd
import numpy as np

df = pd.read_csv("Individual_Incident_2020.csv")
print(df)


# In[ ]:


# Top Records
df.head()


# In[ ]:


# Bottom Records
df.tail()


# In[ ]:


# Data Type of each column
df.info()


# In[ ]:


# (Rows, column)
df.shape


# In[ ]:


# Summary stats(numerical)
df.describe()


# In[ ]:


# data cleaning
---------------------------------
 # Missing values
df.isnull().sum()               


# In[31]:


#Drop Missing rows
df.dropna(inplace = True)


# In[ ]:


df.fillna(value=0, inplace=True) # Fill missing with 0


# In[ ]:


# Find Duplicates
df.duplicated().sum()


# In[ ]:


#Drop duplicates
df.drop_duplicates(inplace =  True)
df = df.replace(r'^\s*$', np.nan, regex=True).fillna(0)


# Root Cause Analysis (Uber)

---
title: Problem Statement
description: 
duration: 900
card_type: cue_card
---

### Problem Statement:

Uber has received some complaints from their customers facing problems related to ride cancellations by the driver and non-availability of cars for a specific route in the city. 

The uneven supply-demand gap for cabs from City to Airport and vice-versa is causing a bad effect on customer relationships as well as Uber is losing out on its revenue.

The aim of analysis is to identify the root cause of the problem (i.e. cancellation and non-availability of cars) and recommend ways to tackle the situation. 

#### `Instructor Note:`
- Summarize and discuss the problem statement with the learners.
- Talk about how we came to know about the issue.
- Define ride cancellation rate = $\frac{No.~of~confirmed~bookings}{No.~of~ride~requests}$
- Categorise the ride cancellations into two groups -
  1. Intercity
  2. City to Airport (or vice-versa)
- Ask the learners to formulate possible hypotheses that we can test with or without the data given.
- Divide these hypotheses into Internal & External factors and validate them one by one.

---
title: Clarity on Assumptions
description: 
duration: 900
card_type: cue_card
---

First of all, irrespective of the data that we have, there are some questions that we need to ask as a Data/Product Analyst to get some clarity on the issue.

#### *Questions that we can ask :*

    Q. Is this thing happening for specific devices? (Android or iOS)

    Q. Has there been any major change/upgrade in the product?

    Q. Is this increase in cancellation rate gradual or sudden?

    Q. Have we checked for any issues on the driver app?

    Q. Are we receiving any major complaints or bug reports?

    Q. Is the change observed across several regions specifically or is it uniform?

    Q. Are we seeing a high cancellation rate for driver’s belonging to a specific age group?

    Q. Any pattern in ride cancellations in terms of the vehicle category? (Auto, Mini or Sedan)

    Q. Has there been any major holiday in the past week?

    Q. Have we done any recent experiments related to the platform?

    Q. Has there been any recent strike or protest by the drivers?

    Q. Has Uber been involved in any controversy lately?

    Q. Are we currently facing any connectivity related issues throughout the region? 

    Q. Do we have any reports of frequent app crashes or something like that?

    Q. Is there any change detected in the usual user behavior over the last week?

    Q. Is it possible that the drivers might be using some other ride sharing platforms as well?
    
#### *Things that we'll be looking at :* 

    - Frequency of booking requests getting cancelled each hour.

    - Pickup & Destination of the cancelled booking requests.

    - Days of week in which the cancellation rate is maximum.

    - Time of day during which the cancellation rate is at peak.

    - Time of day when the demand is highest and supply is low. 

    - Time of day when the cabs are available but demand is low.

---
title: Exploratory Analysis
description: 
duration: 600
card_type: cue_card
---

### Dataset link: [uber-data.csv](https://drive.google.com/file/d/1ZhqCqM5xtMNsun-xBhfvtrYH2RlM1Ue5/view?usp=share_link)

#### Importing required libraries -

```python=
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

import warnings
warnings.simplefilter('ignore')

sns.set_style('whitegrid')
```

#### Loading the dataset -

```python=
from google.colab import files
uploaded = files.upload()

df = pd.read_csv('uber-data.csv', dayfirst=True, na_values="NA")
df.head()
```

Result:

<img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/070/824/original/ss.png?1712738840" width="700" height="350">

#### Shape of the dataset -

```python=
print("No. of rows: {}".format(df.shape[0]))
print("No. of cols: {}".format(df.shape[1]))
```

Result:
> No. of rows: 6745
> No. of cols: 6

#### Checking the data type -

```python=
df.info()
```

Result:
| Column | Dtype |
| -------- | -------- |
| Request id | int64 | 
| Pickup point | object | 
| Driver id | float64 | 
| Status | object | 
| Request timestamp | object | 
| Drop timestamp | object | 

#### Convert `Request timestamp` column to datetime dtype -

```python=
df['Request timestamp_1'] = pd.to_datetime(df['Request timestamp'], format='%d-%m-%Y %H:%M:%S', errors='coerce')
df['Request timestamp_2']=pd.to_datetime(df['Request timestamp'], format='%d/%m/%Y %H:%M', errors='coerce')
df['Request timestamp']=df['Request timestamp_2'].combine_first(df['Request timestamp_1'])
```

#### Convert `Drop timestamp` column to datetime dtype -

```python=
df['Drop timestamp_1'] = pd.to_datetime(df['Drop timestamp'], format='%d-%m-%Y %H:%M:%S', errors='coerce')
df['Drop timestamp_2']=pd.to_datetime(df['Drop timestamp'], format='%d/%m/%Y %H:%M', errors='coerce')
df['Drop timestamp']=df['Drop timestamp_2'].combine_first(df['Drop timestamp_1'])
```

#### Dropping unnecessary columns -

```python=
df.drop(columns=['Request timestamp_1', 'Request timestamp_2', 
                 'Drop timestamp_1', 'Drop timestamp_2'], 
                  inplace=True)
```
#### Checking for null values -

```python=
df.isnull().sum() / len(df) * 100
```
Result:

| Column | Null Value % |
| -------- | -------- |
| Request id | 0.00 | 
| Pickup point | 0.00 | 
| Driver id | 39.29 | 
| Status | 0.00 | 
| Request timestamp | 0.00 | 
| Drop timestamp |  58.03 | 

#### Checking for duplicate rows -

```python=
print("No. of duplicate rows: ", df.duplicated().sum())
```

Result:
> No. of duplicate rows:  0

---
title: Feature Engineering
description: 
duration: 900
card_type: cue_card
---

### Extracting new features from the existing ones -

#### Extract hour from the Request timestamp

```python=
df["RequestHour"] = df["Request timestamp"].dt.hour
```

#### Separate 5 different timeslots from the Hour - Dawn, Early Morning, Noon, Late Evening, Night

```python=
df["TimeSlot"] = df["RequestHour"].apply(lambda x: "Dawn" if x<=4 else ("Early Morning" 
                                                                        if x<=9 else ("Noon" 
                                                                                      if x<=16 else ("Late Evening" 
                                                                                                     if x<=21 else "Night"))))
```

#### Distinguish the Supply-Demand Gap by a new variable Cab Availability where Supply is when Trip is Completed, all else is Demand

```python=
df["Cab Availability"] = df["Status"].apply(lambda x: "Available" if x=="Trip Completed" else "Not Available")
```

\
Let's look at the updated dataset -

```python=
df.sample(5)
```

| | Request id | Pickup point | Driver id | Status | Request timestamp | Drop timestamp | RequestHour | TimeSlot | Cab Availability
| -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| 2064 | 3363 | City | 218.0 | Trip Completed | 2016-07-13 13:36:11 | 2016-07-13 14:34:22 | 13 | Noon | Available
| 4594 | 1355 | Airport | NaN | No Cars Available | 2016-07-11 23:45:00 | NaT | 23 | Night | Not Available
| 4547 | 1226 | City | NaN | No Cars Available | 2016-07-11 21:39:00 | NaT | 21 | Late Evening | Not Available
| 4448 | 1063 | Airport | NaN | No Cars Available | 2016-07-11 19:51:00 | NaT | 19 | Late Evening | Not Available
| 4382 | 958 | Airport | NaN | No Cars Available | 2016-07-11 18:42:00 | NaT | 18 | Late Evening | Not Available

\
Let's also check the **Cab Availability** -

```python=
df['Cab Availability'].value_counts(normalize=True)*100
```

Result:
| Not Available | Available |
| -------- | -------- |
|  58% | 42% | 

---
title: In-depth Analysis
description: 
duration: 1800
card_type: cue_card
---

### Q. What is the Frequency of Requests that get Canceled or show ‘No Cars Available’ in each hour?

#### Frequency of Requests by Hour -

```python=
df.groupby(['RequestHour','Status']).size().unstack().plot(kind='bar', stacked=True, figsize=(15, 8))
plt.title('Frequency of Requests by Hour')
```

<div style="text-align: center;"><img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/057/147/original/u1.png?1700233145" width="750" height="400" align="center"></div>

#### Types of Requests (city-airport or airport-city) -

```python=
df.groupby(['Pickup point']).size().plot(kind="pie", stacked=True, figsize=(6, 6), table=True)
plt.ylabel("")
```

<div style="text-align: center;"><img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/057/149/original/u2.png?1700233168" width="450" height="450" align="center"></div>

#### Distribution of Time Slots -

```python=
df[(df["Cab Availability"]=="Not Available")].groupby(['TimeSlot']).size().plot(kind="pie", stacked=True, figsize=(6, 6), table=True)
plt.ylabel("")
```

<div style="text-align: center;"><img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/057/150/original/u3.png?1700233187" width="450" height="450" align="center"></div>

\
**Observation:** 
*Late Evenings* and *Early Mornings* are not recommended for Airport-City transport or vice versa.

### Q. Plot the Demand-Supply Gap from Airport to City.

#### Demand-Supply Gap from Airport to City -

```python=
df[(df['Pickup point']=="Airport")].groupby(['RequestHour','Status']).size().unstack().plot(kind='bar', stacked=True, figsize=(15, 8))
plt.title('Demand-Supply Gap from Airport to City')
```

<div style="text-align: center;"><img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/057/151/original/u4.png?1700233211" width="750" height="450" align="center"></div>

\
**Observation:**
- *There is very high demand for cabs from Airport to City between 5:00 PM – 9:00 PM*
- *But the supply is very less due primarily due to ‘No Cabs Available'*

### Q. Plot the Demand-Supply Gap from City to Airport.

#### Demand-Supply Gap from City to Airport -

```python=
df[(df['Pickup point']=="City")].groupby(['RequestHour','Status']).size().unstack().plot(kind='bar', stacked=True, figsize=(15, 8))
plt.title('Demand-Supply Gap from City to Airport')
```

<div style="text-align: center;"><img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/057/152/original/u5.png?1700233238" width="750" height="450" align="center"></div>

\
**Observation:**
- *There is very high demand for cabs from City to Airport between 5:00 AM – 9:00 AM*
- *But the supply is very less primarily due to Ride Cancellations*

### Q. What are the Time Slots where the highest gap exists?

#### Time slots where highest gap exists -

```python=
df.groupby(['TimeSlot','Cab Availability']).size().unstack().plot(kind='bar', stacked=True,figsize=(15, 8))
plt.title('Time slots where highest gap exists')
```

<div style="text-align: center;"><img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/057/153/original/u6.png?1700233263" width="750" height="450" align="center"></div>

\
**Observation:**
- *Among the assumed time slots, we can see that the Late
Evening and Early Morning time slots has got the
highest gap.*
- *This means that during evening & morning hours the probability of
getting a cab is very less.*

### Types of Requests (city-airport or airport-city) for which the gap is the most severe in the identified time slots -

```python=
df[df["TimeSlot"]=="Late Evening"].groupby(['Pickup point']).size().plot(kind="pie",stacked=True,figsize=(6, 6), table=True)
plt.ylabel("")
```

<div style="text-align: center;"><img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/057/154/original/u7.png?1700233282" width="450" height="450" align="center"></div>

### Types of Requests (city-airport or airport-city) for which the gap is the most severe in the identified time slots -

```python=
df[df["TimeSlot"]=="Early Morning"].groupby(['Pickup point']).size().plot(kind="pie",stacked=True,figsize=(6, 6), table=True)
plt.ylabel("")
```

<div style="text-align: center;"><img src="https://d2beiqkhq929f0.cloudfront.net/public_assets/assets/000/057/155/original/u8.png?1700233314" width="450" height="450" align="center"></div>

---
title: Reason for Supply-Demand gap
description: 
duration: 600
card_type: cue_card
---

* In the Supply-Demand graph from Airport to City, between 5:00 PM to 9:00 PM there is very high demand for cabs because the supply is very low due to ‘No Cars Available’.

* The ‘No Cars Available’ is due to the fact that in the previous hours fewer people travelled from City – Airport and so fewer cars are available in near Airport. 

* Likewise, in Supply-Demand graph from City – Airport, between 5:00 AM to 9:00 AM, there is very high demand for cabs because the supply is very low due to Ride Cancellations.

* This is because there were fewer trips to Airport that completed in the previous hours, so now the cabs have to come from a long distance (City) to pickup the passenger and then they have to wait for the passenger’s arrival, so the drivers cancel the trip.

---
title: Recommendations
description: 
duration: 600
card_type: cue_card
---

* Awarding incentive for waiting time will encourage the drivers to wait at Airport.

* Drivers could be compensated for taking the night shifts hence covering the 00:00 – 5:00 time slot.

* Seeing this analysis trends, few cabs could be placed in Airports proactively.

* Drivers to be rewarded for the Airport rides making up for the loss in time.

* The cab discovery range to be increased for Airport location, so that the search for cabs would be on a wider range.

---
title: Break & Doubt Resolution
description:
duration: 600
card_type: cue_card
---

### Break & Doubt Resolution

`Instructor Note:`
* Kindly take this time (up to 5-10 mins) to give a short break to the learners.
* Meanwhile, you ask them to share their doubts (if any) regarding the topics covered so far.

---
title: Direct causes vs Root causes
description: 
duration: 1200
card_type: cue_card
---

We have already learned about Root causes. Let us understand how are they any different from Direct causes:

| Direct Causes | Root Causes | 
| -------- | -------- | 
| Immediate factors that directly contribute to a problem or an event. | Underlying factors that give rise to the direct causes. | 
| Evident and observable. | Often hidden or not immediately apparent. | 
| Addressing direct causes can resolve the immediate problem. | Addressing root causes prevents the problem from recurring. | 
| Focuses on symptoms and visible effects. | Focuses on the fundamental reasons behind the symptoms. | 
| Usually associated with short-term impact. | Often associated with long-term impact. | 

\
**Examples of Direct causes:** 
* <span style="color: red;">Incorrect Assembly:</span> The product was assembled incorrectly on the production line, leading to functional issues.  
* <span style="color: red;">Faulty Component:</span> A specific component used in the product was found to be defective, contributing to the overall malfunction. 

\
**Examples of Root causes:** 
* <span style="color: red;">Inadequate Training:</span> Workers on the production line lacked proper training, resulting in incorrect assembly. 
* <span style="color: red;">Supplier Quality Control:</span>  The supplier providing the faulty component did not have adequate quality control measures in place. 
* <span style="color: red;">Lack of Process Monitoring:</span>  The manufacturing process lacked effective monitoring to detect and correct the assembly errors. 

---
title: Competitor Analysis 
description: 
duration: 1200
card_type: cue_card
---

#### <span style="color: red;">Instructor Note:</span> 
* The **Amazon vs Flipkart** case is mandatory to cover
* The **Uber vs Ola** can covered if time permits
    * Otherwise, we can give it as **Homework**
    
### Amazon vs Flipkart

| Aspect | Amazon   | Flipkart |
| -------- | -------- | -------- |
| 1. Market Presence | Amazon is a global e-commerce giant, with a strong presence in multiple countries. | Flipkart is a prominent e-commerce platform primarily operating in India. |
| 2. Product Range | Offers a vast range of products, including electronics, clothing, books, and more. | Provides a wide selection of products, with a focus on the Indian market. |
| 3. Pricing and Offers | Known for competitive pricing and frequent promotional offers like Prime Day. | Offers discounts, deals, and its annual Big Billion Days sale. | 
| 4. Customer Base | Has a global customer base and a strong presence in the United States. | Primarily serves the Indian market and has a substantial user base. |
| 5. User Experience | Offers a user-friendly interface, one-click purchasing, and personalized recommendations. | Provides a seamless shopping experience, with features like Wishlist and user reviews. |
| 6. Delivery and Logistics | Known for its efficient delivery network, including Amazon Prime for fast shipping. | Offers various delivery options, including Flipkart Plus for expedited delivery. |
| 7. Customer Reviews | Collects customer reviews for products, helping users make informed decisions. | Features user reviews and ratings, similar to Amazon. |
| 8. Mobile Apps | Has a well-developed mobile app for convenient shopping on smartphones. | Offers a user-friendly mobile app for both Android and iOS. |
| 9. Loyalty Programs | Offers Amazon Prime, a subscription service with benefits like free shipping and streaming. | Provides Flipkart Plus, a loyalty program with rewards. |
| 10. Marketing and Advertising | Utilizes advertising across various channels, including TV, online, and social media. | Engages in marketing through online and offline channels to reach Indian audiences. |

### Uber vs Ola

| Aspect | Uber | Ola |
| -------- | -------- | -------- |
| 1. Market Presence | Uber is a global ride-sharing giant, operating in numerous countries across the world. | Ola is a leading ride-hailing platform primarily operating in India, with a presence in some international markets. |
| 2. Service Range | Uber offers a diverse range of services, including UberX, UberPool, UberBlack, and UberEats for food delivery. | Ola provides services such as Ola Micro, Ola Mini, Ola Prime, and Ola Share for ride-sharing. |
| 3. Pricing and Offers | Uber employs dynamic pricing based on demand, surge pricing during peak hours. | Ola uses a similar dynamic pricing model and occasionally offers promotional discounts and cashback. |
| 4. Customer Base | Uber has a global customer base and is one of the most recognized ride-sharing platforms internationally. | Ola primarily serves the Indian market but has expanded its services to a few international locations. |
| 5. User Experience | Uber provides a user-friendly app interface with features like upfront pricing, real-time tracking, and cashless transactions. | Ola offers a similar user experience with features like in-app payments, ride tracking, and driver ratings. |
| 6. Ride Options and Vehicle Types | Uber offers a variety of ride options, including economy, premium, and shared rides, with options for larger groups. | Ola provides a range of ride categories, including Micro, Mini, Prime, and Ola Auto, catering to different user preferences. |
| 7. Safety Measures | Both Uber and Ola have safety features such as real-time tracking, SOS buttons, and driver background checks. | Uber and Ola both emphasize safety through in-app features and partnerships with local authorities. |
| 8. Driver Incentives | Uber and Ola both offer driver incentives, bonuses, and rewards programs to attract and retain drivers. | Both platforms provide driver ratings and feedback mechanisms to maintain service quality. |
| 9. Loyalty Programs | Uber offers loyalty programs like Uber Rewards, providing benefits for frequent users. | Ola has Ola Select, a subscription-based loyalty program with perks such as priority booking and discounts. |
| 10. Marketing and Advertising | Uber engages in extensive marketing and advertising through various channels, including digital media, partnerships, and sponsorships. | Ola utilizes online and offline advertising, as well as strategic partnerships to enhance brand visibility, especially in the Indian market. |

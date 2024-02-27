![image](https://github.com/terencetaothucb/TBSI-Sunwoda-Battery-Dataset/assets/161430150/60fc8536-fcdb-48c6-aeb3-5d814c4a14d3)# TBSI Sunwoda Battery Dataset
## Preamble
Sunwoda Electronic Co., Ltd, generates the TBSI Sunwoda Battery Dataset to verify the performance of novel battery material composition designs. The collaboration team at Tsinghua Berkeley Shenzhen Institute (TBSI) performs the main research work by providing an efficient and reliable early battery prototype verification methodology. We open-source this dataset to inspire more diversified data-driven, physics-informed battery management research and real-world applications, including, but not limited to, state of charge (SOC) estimation, state of health (SOH) estimation, remaining useful life (RUL) prediction, degradation trajectory prediction, consistency management, and thermal management. 
## Description
This is a multi-step fast charging dataset, i.e., 20 minutes for 75% SOC, with ternary lithium-ion batteries of a LiNi0.8Co0.1Mn0.1O2 (NCM811) cathode material. The anode material is graphite containing 13 wt% of silicon oxide for better energy density purposes with a nominal capacity of 1.1 Ah. The batteries were cycled under 9-step fast charging (0.33C to 3C, where 1C is 1.1A) and 1C constant discharging conditions. After setting a fixed SOC interval for each step, the battery was charged by applying constant currents with different C rates, aiming to achieve fast charging while reducing lithium plating.
The dataset includes a total of 32 batteries at 4 different temperatures, i.e., 25, 35, 45, and 55 Celsius degrees, respectively. 9 batteries are for both 25 and 35 Celsius degrees, respectively. 7 batteries are for both 45 and 55 Celsius degrees, respectively. The dataset covers a lifetime from 480 to 1025 cycles when the end-of-life is defined by the cycle index when real capacity hits 80% of the nominal capacity. The average lifetime of all batteries is 775 cycles with a standard deviation of 175 cycles. 
## Highlights
1. We quantify the initial manufacturing variabilities (IMVs) as the step-wise charge acceptance before actual cycling, useful for early battery prototype verification of long-term performance even before noticeable degradation onset.
2. We adopt an actual electric vehicle charging in wide temperature regions for better translation from the verification result from the verification stage to practical use, bridging the gap between novel battery composition designs and manufacturing realities. 
3. We decouple internal battery loss (i.e., thermodynamics and kinetics) and polarization types (i.e., concentration polarization and others) only using accessible electric signals, otherwise requiring costly and lengthy characterizations, thanks to multi-step charging dynamics and transition processes.
## Animals
ID | Taxonomy | Description | Physical meaning ｜
|---|---|---|---|
|1|2|3|4|

## Access
Acce the dataset [here](https://zenodo.org/uploads/10715209). 


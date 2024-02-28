## Preamble
Due to the complexity and uncertainty of the manufacturing process, there persistently exists a considerable mismatch in performance between a manufactured battery and its counterpart in material laboratory, leading to compromised product quality, R&D efficiency, investment cost and lifetime sustainability. Sunwoda Electronic Co., Ltd, generates the TBSI Sunwoda Battery Dataset to verify the performance of novel battery material composition designs. The collaboration team at Tsinghua Berkeley Shenzhen Institute (TBSI) performs the main research work by providing an efficient and reliable early battery prototype verification methodology. We open-source this dataset to inspire more diversified data-driven, physics-informed battery management research and real-world applications, including, but not limited to, state of charge (SOC) estimation, state of health (SOH) estimation, remaining useful life (RUL) prediction, degradation trajectory prediction, consistency management, and thermal management. 
## Description
This is a multi-step fast charging dataset, i.e., 20 minutes for 75% SOC, with ternary lithium-ion batteries of a LiNi0.8Co0.1Mn0.1O2 (NCM811) cathode material. The anode material is graphite containing 13 wt% of silicon oxide for better energy density purposes with a nominal capacity of 1.1 Ah. The batteries were cycled under 9-step fast charging (0.33C to 3C, where 1C is 1.1A) and 1C constant discharging conditions. After setting a fixed SOC interval for each step, the battery was charged by applying constant currents with different C rates, aiming to achieve fast charging while reducing lithium plating. The detailed SOC allocation is listed in the following table (dash line means rest, thus zero C-rate and SOC increase). Positive (+) and negative (-) C-rate stand for charging and discharging, respectively. Steps 2 to 14 are repeated 3 times, then the mean values of the (U1-U9) from each repeated experiment are taken as cut-off voltages for subsequent cycling.
#### SOC allocation
Step | C-rate | Time(min) | SOC(%) |
|---|---|---|---|
|1|-|30.00|-|
|2|+0.33|-|0.0|
|3|-|30.00|-|
|4|+0.33|14.54|+8.0|
|5|+3.00|2.40|+12.0|
|6|+2.90|2.07|+10.0|
|7|+2.80|2.14|+10.0|
|8|+2.40|2.50|+10.0|
|9|+2.00|3.00|+11.1|
|10|+1.80|3.33|+10.0|
|11|+1.40|4.29|+10.0|
|12|+0.33|28.93|+15.9|
|13|-|120.00|Summation: 97.0|
|14|-1.00|56.40|-94.0|
|15|-|60.00|-|
#### Charging visualization
The Video is for easy visualization and comparison of the internal lithium-ion concentration under multi-step fast charging and constant charging, respectively. We highlight that multi-step fast charging can provide rich degradation-informed information by exciting the thermodynamics (small current region) and kinetics (large current region), respectively, thus being favorable for _operando_ degradation characterization.

https://github.com/terencetaothucb/TBSI-Sunwoda-Battery-Dataset/assets/161430150/b49d7d71-4f59-4fb6-bf09-7d61a8c0bc2b

The dataset includes a total of 32 batteries at 4 different temperatures, i.e., 25, 35, 45, and 55 Celsius degrees, respectively. 9 batteries are for both 25 and 35 Celsius degrees, respectively. 7 batteries are for both 45 and 55 Celsius degrees, respectively. The dataset covers a lifetime from 480 to 1025 cycles when the end-of-life is defined by the cycle index when real capacity hits 80% of the nominal capacity. The average lifetime of all batteries is 775 cycles with a standard deviation of 175 cycles. 
## Highlights
1. We quantify the initial manufacturing variabilities (IMVs) as the step-wise charge acceptance before actual cycling, useful for early battery prototype verification of long-term performance even before noticeable degradation onset.
2. We adopt an actual electric vehicle charging in wide temperature regions for better translation from the verification result from the verification stage to practical use, bridging the gap between novel battery composition designs and manufacturing realities.
3. We decouple internal battery loss (i.e., thermodynamics and kinetics) and polarization types (i.e., concentration polarization and others) only using accessible and _operando_ electric signals, otherwise requiring costly and lengthy characterizations, thanks to multi-step charging dynamics and transition processes.
## Featurization
The featurization taxonomy is designed to link statistical features derived from accessible electric signals to the physical meaning of chemical processes. Prior- and in-cycle features are extracted to characterize （IMVs） before cycling and chemical process evolution during cycling. The in-cycle features are split into inter- and intra-step step features thanks to the rich dynamic information provided by multi-step charging schemes. The features are briefly listed below.
1. Operation temperature (T).
2. Cut-off voltage value when assigned SOC is hit at each charging step (U1-U9). The physical meaning is the charge acceptance at each charging step (SOC region).
3. Voltage change from the end of step 8 to the start of step 9 (VC89). The physical meaning is the ohmic and electrochemical polarization, linked to SEI growth (pseudo relaxation).
4. Voltage drop from the start of step 9 to the minimum of step 9 (VD9). The physical meaning is the concentration polarization (pseudo relaxation). Time needed for VD9 is tVD9.
5. Voltage change from the end of step 9 to the start of the rest (ReVC). The physical meaning is the ohmic and electrochemical polarization, linked to SEI growth (relaxation).
6. Voltage drop from the start of the rest to the minimum of the rest (ReVD). The physical meaning is the concentration polarization (relaxation). Time needed for ReVD is tReVD.
7. Mean value of voltage gradient at each charging step (Vg1-Vg9). The physical meaning is the polarization speed at each charging step (SOC region). Rvg is defined as the ratio of Vg2 and Vg1.
8. Charging capacity value when assigned SOC is hit at each charging step (Q1-Q9). The physical meaning is the charge acceptance at each charging step (SOC region).
9. Ratio of voltage and charging current at each charging step (RL1-RL9). The physical meaning is the merged representation, i.e., lumped resistance, of ohmic, electrochemical, and concentration resistance at each charging step (SOC region).
10. Ratio of voltage change and current change at switching points between steps (RO1-RO9). The physical meaning is the ohmic resistance fron relaxation behaviours.




## Access
Access the dataset [here](https://zenodo.org/uploads/10715209). The dataset is under the MIT licence [here](https://github.com/terencetaothucb/TBSI-Sunwoda-Battery-Dataset/blob/main/LICENSE).


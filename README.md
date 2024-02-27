# TBSI Sunwoda Battery Dataset
## Preamble
Sunwoda Electronic Co., Ltd, generates the TBSI Sunwoda Battery Dataset to verify the performance of novel battery material composition designs. The collaboration team at Tsinghua Berkeley Shenzhen Institute (TBSI) performs the main research work by providing an efficient and reliable early battery prototype verification methodology. We open-source this dataset to inspire more diversified data-driven, physics-informed battery management research and real-world applications, including, but not limited to, state of charge (SOC) estimation, state of health (SOH) estimation, remaining useful life (RUL) prediction, degradation trajectory prediction, consistency management, and thermal management. 
## Description
This is a multi-step fast charging dataset, i.e., 20 minutes for 75% SOC, with ternary lithium-ion batteries of a LiNi0.8Co0.1Mn0.1O2 (NCM811) cathode material. The anode material is graphite containing 13 wt% of silicon oxide for better energy density purposes with a nominal capacity of 1.1 Ah. The batteries were cycled under 9-step fast charging (0.33C to 3C, where 1C is 1.1A) and 1C constant discharging conditions. After setting a fixed SOC interval for each step, the battery was charged by applying constant currents with different C rates, aiming to achieve fast charging while reducing lithium plating.
The dataset includes a total of 32 batteries at 4 different temperatures, i.e., 25, 35, 45, and 55 Celsius degrees, respectively. 9 batteries are for both 25 and 35 Celsius degrees, respectively. 7 batteries are for both 45 and 55 Celsius degrees, respectively. The dataset covers a lifetime from 480 to 1025 cycles when the end-of-life is defined by the cycle index when real capacity hits 80% of the nominal capacity. The average lifetime of all batteries is 775 cycles with a standard deviation of 175 cycles. 
## Highlights
1. We quantify the initial manufacturing variabilities (IMVs) as the step-wise charge acceptance before actual cycling, useful for early battery prototype verification of long-term performance even before noticeable degradation onset.
2. We adopt an actual electric vehicle charging in wide temperature regions for better translation from the verification result from the verification stage to practical use, bridging the gap between novel battery composition designs and manufacturing realities. 
3. Internal battery loss (i.e., thermodynamics and kinetics) and polarization types (i.e., concentration polarization and others), can be decoupled only using accessible electric signals, otherwise requiring costly and lengthy characterizations, thanks to multi-step charging dynamics and transition processes.

Charging details	Time duration (min)	State of Charge (SOC)
Step1: Rest	30.00	
Step2: 0.33CRPT CC to 2.5V	-	
Step3: Rest 	30.00	
Step4: 0.33CRPT CC to U1	14.54	+8.0%
Step5: 3.00CRPT CC to U2	2.40	+12.0%
Step6: 2.90CRPT CC to U3	2.07	+10.0%
Step7: 2.80CRPT CC to U4	2.14	+10.0%
Step8: 2.40CRPT CC to U5	2.50	+10.0%
Step9: 2.00CRPT CC to U6	3.00	+11.1%
Step10: 1.80CRPT CC to U7	3.33	+10.0%
Step11: 1.40CRPT CC to U8	4.29	+10.0%
Step12: 0.33CRPT CC to U9	28.93	+15.9%
Step13: Rest	120.00	Summation: 97%
Step14: 1CRPT CC to (U10)	56.40	-94%
Step15: Rest	60.00	
Step16: Repeat	Steps 2 to 14 are repeated 3 times. The mean values of the 
(U1-U9) are taken as cut-off voltages for subsequent cycling.
![image](https://github.com/terencetaothucb/TBSI-Sunwoda-Battery-Dataset/assets/161430150/59e750d2-b456-4018-bf26-4096981386f0)



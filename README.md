# Optimal-Photographing-Settings-OPS-

## 📌 Overview
This app is a MATLAB-based application designed to optimize photographing settings according to the study of Leem et al. (2025).  
It provides 
- a simple user interface to set camera settings, UAV flight method, and constraints (illuminance, time, GSD (optional))
- optimized photographing settings.
- expected error map according to D-v 

## 🛠️ How to Run

### 1️⃣ If you have MATLAB installed:
- Download the 'Cal_Error_kernel.m', 'Cal_RMSE_2D.m', 'Optimal_photographing_settings.mlappinstall' files from this repository.
- Open the 'Optimal_photographing_settings.mlappinstall' file and install it.
- Click 'Optimal_photographing_settings' in the 'APPS' tab in MATLAB. 

### 2️⃣ If you do **NOT** have MATLAB:
- Download the `MyAppInstaller_web.exe` file from this repository.
- Open the file and install it.
- Run the `Optimal_Photographing_Settings.exe` file after installing MATLAB Runtime.

## 🔧 Manual for the app
1. Set the camera settings (N, t, s ,p) of your own.
2. Set the region of interest for distance D and UAV speed v. The final optimal UAV flight methods are provided in units of the intervals. D and v intervals are recommended to divide the max D -min D and max v -min v respectively, otherwise black region may appear on the graph. If the intervals are too small, the analysis time will take longer. 
3. Set the illuminance and time constraints. You can also add GSD constraints if needed by checking the Enable GSD box.
4. Set the camera specification (field-of-view, focal length, sensor size). 
5. Set the calibration parameters. If they are unknown, just leave the default settings. Still, optimal photographing settings won't be affected in most of the cases.
6. Interpolation ratio is for visualization. It is okay to leave as it is.
7. Press the Run button after everything is ready.
8. The Stop button will stop the analysis. However, it takes a little bit of time to stop the whole process, so some patience is required.
9. Optimal photographing settings can be recalculated with the same E but a different A without doing the whole process. Enter a different A and click the Recalculate button next to the A constraint.
10. The graph will illustrate the D-v plot for E. The dashed line represents D,v pairs that satisfy A and the red dot represents the optimal D,v pair among them. 
11. Blanck region may appear on the graph when the GSD constraint is enabled. They represent the D-v region which does not have any camera settings that can satisfy GSD constraint.

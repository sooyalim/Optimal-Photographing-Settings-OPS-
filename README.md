# Optimal-Photographing-Settings-OPS-

# MATLAB App: MyApp

## 📌 Overview
MyApp is a MATLAB-based application designed to [briefly describe what your app does].  
It provides [key features or functionalities] to help users with [specific use case].

## 🛠️ How to Run
### 1️⃣ If you have MATLAB installed:
- Download the `MyApp.mlapp` file from this repository.
- Open MATLAB and load the `.mlapp` file in **App Designer**.
- Click "Run" to launch the app.

### 2️⃣ If you do **NOT** have MATLAB:
- Download the **Standalone EXE version** from [Google Drive / Dropbox / GitHub Releases](https://your-download-link).
- Install **MATLAB Runtime** (Required for execution).
  - [Download MATLAB Runtime](https://www.mathworks.com/products/compiler/matlab-runtime.html)
- Run the `.exe` file after installing MATLAB Runtime.

### 3️⃣ Run in a Web Browser (Optional)
- If the app is hosted on a Web App Server, access it via:
  - [Web App Link](http://your-webapp-server-link)

## 🔧 Manual for the app
1. Set the camera settings (N, t, s ,p) of your own.
2. Set the region of interest for distance D and UAV speed v. The final optimal UAV flight methods are provided in units of the intervals. D and v intervals are recommended to divide the max D -min D and max v -min v respectively, otherwise black region may appear on the graph. If the intervals are too small, the analysis time will take long. 
3. Set the illuminance and time constraints. You can also add GSD constraints if needed by checking the Enable GSD box.
4. Set the camera specification (field-of-view, focal length, sensor size). 
5. Set the calibration parameters. If they are unknown, just leave the default settings. Still, optimal photographing settings won't be affected in most of the cases.
6. Interpolation ratio is for visualization. It is okay to leave as it is.
7. Press Run button after everything is ready.
8. Stop button will stop the anaylsis. However, it takes a little bit of time to stop the whole process, so some patience is required.
9. Optimal photographing settings can be recalculated with same E but different A without doing the whole process. Enter different A and click the Recalculate button next to A constraint.
10. The graph will illustrate D-v plot for E. The dashed line represent D,v pairs that satisfy A and the red dot represents the optimal D,v pair among them. 
11. Blanck region may appear on the graph when GSD constraint is enabled. They represent D-v region which does not have any camera settings that can satisfy GSD constraint.

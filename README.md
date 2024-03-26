# MAV_Flight_Controls
My personal projects on the various concepts related to flight dynamics and control of UAVs.

# Reference Frames
This is a simple MATLAB Script which allows user to visualise a simple geometrical view of an aircraft. The user can assign Euler angles for rotation as well as assign values to translate the aircraft model which can be visualised in a graphical interface.  
The image below shows the description of aircraft dimensions

![img](https://github.com/Shriyans-Navalgund/MAV_Flight_Controls/assets/90153186/10b43f5c-a7f2-4cc7-915b-47f7ab902611)

# Kinematics Dynamics
This files describes a simulink model which employs aircraft equations of motion.

Inputs:
1) Forces (Fx, Fy, Fz)
2) Moments (L, M, N)
3) Moment of Inertia (Jx, Jy, Jz, Jxz, Jxy, Jyz)
Outputs:
1) Aircraft velocity in body frame (U, V, W)
2) Aircraft position in NED Frame (Pn, Pe, Pd)
3) Aircraft position in body Frame (X, Y, Z)
4) Aircraft Euler angles (Phi, Theta, Psi)
5) Aircraft rotation rates (P, Q, R)

Note: Rotation Matrices are emplyed as Matlab interpreted functions for ease of application over using signals and multiply blocks.

# Matlab-Segway-model
Matlab model of a segway for a faculty project at Faculty of Technical Sciences, Novi Sad, Serbia
Second year subject is *Automatic Control Systems* for Major *Computing and Control Engineering*  in 2024

![logo](https://github.com/Pappt04/Matlab-Segway-model/assets/69700151/b44d1b65-5576-4277-be95-bd65f6bb5cb1)

This is a model of a segway that balances itself during moving with two **PD** regulators in parallel
It is implemented in Matlab2024a and Simulink


![segway_scatch](https://github.com/Pappt04/Matlab-Segway-model/assets/69700151/3e9b5411-6f4f-4320-a8db-d962ee5b072e)

The model has 2 parts
- Noninear Model
- Linearized model

The *Linearized* model and its matrices are calculated by hand on paper but the parameters for the PD regulators are calculated by *acker* function in Matlab

Here is a proof of stability with the poles in [-1, -1, -1, -1]: 
![nyqwist](https://github.com/Pappt04/Matlab-Segway-model/assets/69700151/75ea44bc-d04b-428a-8a5a-44a56d3f1825)

For more information read the pdf attached to the project

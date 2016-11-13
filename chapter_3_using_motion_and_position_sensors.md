### Chapter 3 

#Using Motion and Position Sensors

This chapter is about how to interact with sensors on an Android device using the Ketai library. Android devices come packed with sensors that allow us to write mobile apps that react to how we position and move the Android device to make them more engaging, useful, and interactive. Android sensors provide us with information about device motion, position, and environment. We'll focus on motion sensors in this chapter and take a look at some position sensors.

Motion sensors allow us to measure how the device is oriented in space and how it accelerates when we move it. The typical accelerometer sensor found on Android devices triggers screen rotations and is used for a wide range of apps to detect shakes, fist bumps, hand gestures, bumpy roads, and other features. Using Ketai, we'll list all the available sensors built into the Android and work with multiple sensors combined in an app that displays values for the magnetic field, light, proximity, and accelerometer sensors.

We'll work with the orientation of an Android device to create an interactive color mixer app. Step by step, we'll start by learning to display raw data from the accelerometer sensor, and then we'll use those values to generate the entire spectrum of color that the Android can generate. Next we'll learn how to store data in an array and how to use the array to display a palette of eight colors that we've created. Finally, we'll use the accelerometer to clear the color palette by shaking the device, and we'll detect that motion in our program. In the process, we'll acquire a sense for the accelerometer sensor, its value range, and its accuracy, and we'll learn to integrate it into the app's user interface. By the end of the chapter, you will know this sensor well enough to transpose this knowledge to other applications.

###Introducing the Device Hardware and Software Layers

Writing sensor-based Android apps in Processing involves a series of software layers that build on each other. The list below describes the software stack running on the device hardware, all of which we put to use when we run our sketches—starting with the bottommost hardware layer.

**Hardware**
Besides the central (CPU) and graphics (GPU) processing unit, hardware devices built in the Android include: GSM/3G/4G antennas, digital cameras, an accelerometer sensor, a light sensor, a gyroscope, a geomagnetic field sensor, a capacitive touch screen panel, an audio interface, a speaker, a vibration motor, a battery, a Flash memory interface, and perhaps a hardware keyboard and a temperature sensor.

**Linux kernel**
The bottommost software layer running on the hardware is the [Linux kernel,][1] a Unix-like operating system initially developed by Linus Torvalds in 1991. We access all the hardware resources of the device through this layer, which contains drivers for the display, cameras, Bluetooth, Flash memory, Binder (PC), USB, keypad, Wi-Fi, audio, and power.

**Android and Java Core Libraries**
Above the Linux kernel sit the Android native libraries written in C/C++, including  Surface Manager, Media Framework,  SQLite ,  OpenGL/ES , FreeType, WebKit,  SGL,  SSL, and  libc. This layer also includes Android Runtime, which contains the core Java libraries and the [Dalvik virtual machine.][2] The Dalvik virtual machine creates compact executable files that are optimized for memory and processor speed. The virtual machine allows a high level of control over the actions an app is permitted to take within the operating system. Android applications are typically written in Java using the Java core libraries and compiled to bytecode, which is the format executed by a Java virtual machine. In the Android OS, bytecode is converted into a Dalvik executable (***dex***) before an app is installed on the Android device.

**Processing**
The language itself is the next layer in our software stack that builds on the Java core libraries. The Android mode in Processing works with the Android libraries in the Android layer. Processing's software architecture allows us to use Java and Android classes directly within the Processing code.

**Ketai**
The library builds on the Processing for Android layer, taking advantage of the Processing, Java, and Android libraries. It's the highest layer in the software stack we'll be working with in projects, besides using a few other libraries that sit on the same level in the hierarchy. Ketai focuses specifically on the hardware features built into Android devices, including the multitouch screen panel, sensors, cameras, and networking devices.

Now that we are aware of the different hardware components and the software layers stacked on top of the hardware layer, let's start with the bottommost hardware layer and take a look at the most common sensors built into our Android device.

[1]: http://en.wikipedia.org/wiki/Linux_kernel
[2]: https://en.wikipedia.org/wiki/Dalvik_(software)

###Introducing Common Android Sensors

In this chapter, we will work mostly with the accelerometer sensor and use the ***KetaiSensor*** class to access it. ***KetaiSensor*** is capable of working with all sensors. Some sensors found on the Android device are based on hardware; others are software-based and provided by the Android SDK. For the projects in this chapter, we'll focus on actual electronic hardware sensors built into the Android phone or tablet. Android distinguishes three different sensor-type categories: [motion sensors,][3] [position sensors,][4] [and environment sensors.][5] Most environment sensors have been added to the Android SDK recently (Android 4.0 Ice Cream Sandwich), so they are not typically found in devices yet. Let's take a look at the different sensors Android supports. 

[3]: http://developer.android.com/guide/topics/sensors/sensors_motion.html
[4]: http://developer.android.com/guide/topics/sensors/sensors_position.html
[5]: http://developer.android.com/guide/topics/sensors/sensors_environment.html
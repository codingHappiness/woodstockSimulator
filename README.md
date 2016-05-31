# woodstockSimulator
An attempt to recreate the visions of festival goers.

Projected filtergraph:
input -> Edge Detection
|         v                                   overlay------------------------>output
|         |----->Distortion 1 ---> Hue Red----+          v--->Delay-->Hue----+
|         |----->Distortion 2 ---> Hue Blue---+
|         |----->Distortion 3 ---> Hue Green--+
v                                             +
 ----->Standard-------------------------------+

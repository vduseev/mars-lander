# Mars Lander Simulator Business Rules

| ID                        | Rule description                 | Rule class   | Volatility | Source    |
|---------------------------|----------------------------------|--------------|------------|-----------|
| [REFEREE-1](#REFEREE-1)   | Map Height                       | Fact         | Static     | CodinGame |
| [REFEREE-2](#REFEREE-2)   | Map Width                        | Fact         | Static     | CodinGame |
| [REFEREE-3](#REFEREE-3)   | Unique Landing Area              | Constraint   | Static     | CodinGame |
| [REFEREE-4](#REFEREE-4)   | Landing Area Width               | Constraint   | Static     | CodinGame |
| [REFEREE-5](#REFEREE-5)   | Tilt Angle Direction             | Fact         | Static     | CodinGame |
| [REFEREE-6](#REFEREE-6)   | Tilt Angle Range                 | Constraint   | Static     | CodinGame |
| [REFEREE-7](#REFEREE-7)   | Rotation Speed                   | Fact         | Static     | CodinGame |
| [REFEREE-8](#REFEREE-8)   | Thrust Power Range               | Constraint   | Static     | CodinGame |
| [REFEREE-9](#REFEREE-9)   | Thrust Power Change Speed        | Fact         | Static     | CodinGame |
| [REFEREE-10](#REFEREE-10) | Gravity                          | Fact         | Static     | CodinGame |
| [REFEREE-11](#REFEREE-11) | Speed Calculation                | Computations | Static     | CodinGame |
| [REFEREE-12](#REFEREE-12) | Fuel Consumption                 | Computations | Static     | CodinGame |
| [REFEREE-13](#REFEREE-13) | Data Types of Simulator          | Computations | Static     | CodinGame |
| [REFEREE-14](#REFEREE-14) | Allowed Landing Angle            | Constraint   | Static     | CodinGame |
| [REFEREE-15](#REFEREE-15) | Allowed Landing Vertical Speed   | Constraint   | Static     | CodinGame |
| [REFEREE-16](#REFEREE-16) | Allowed Landing Horizontal Speed | Constraint   | Static     | CodinGame |
| [REFEREE-17](#REFEREE-17) | Surface Touch                    | Computations | Static     | CodinGame |
| [REFEREE-18](#REFEREE-18) | Successful Landing               | Computations | Static     | CodinGame |
| [REFEREE-19](#REFEREE-19) | Map Origin                       | Fact         | Static     | CodinGame |

## Reference Schema
Copied from CodinGame website.

![Game Schema](https://image.ibb.co/gc0HqF/marslander_schema.png)

## Referee Rules

##### *REFEREE-1* Map Width <a name="REFEREE-1"></a>
Mars map is **7000m** wide.

##### *REFEREE-2* Map Height <a name="REFEREE-2"></a>
Mars map is **3000m** high.

##### *REFEREE-3* Unique Landing Area <a name="REFEREE-3"></a>
There is **only one** flat area on the map.
It is called Landing Area.

##### *REFEREE-4* Landing Area Width <a name="REFEREE-4"></a>
Landing area is at least **1000m** wide.

##### *REFEREE-5* Tilt Angle Direction <a name="REFEREE-5"></a>
* Tilt **angle < 0°** results in counter clockwise rotation.
* Tilt **angle > 0°** results in clockwise rotation.
* Tilt **angle = 0°** results in lander being positioned vertically.

##### *REFEREE-6* Tilt Angle Range <a name="REFEREE-6"></a>
Acceptable tilt angle range is **-90° ≤ angle ≤ 90°**. Tilt angle is presented
in degrees.

##### *REFEREE-7* Rotation Speed <a name="REFEREE-7"></a>
Each frame actual rotation of lander is limited to the value of previous frame
**+/-15°**.

##### *REFEREE-8* Thrust Power Range <a name="REFEREE-8"></a>
Thrust power is an integer number.
Acceptable thrust power range is **0 ≤ Thrust ≤ 4**.

##### *REFEREE-9* Thrust Power Change Speed <a name="REFEREE-9"></a>
Each frame actual thrust power of lander is limited to the value of previous
frame **+/-1**.

##### *REFEREE-10* Gravity <a name="REFEREE-10"></a>
The game simulates a free fall without atmosphere.
Gravity on Mars is **3.711 m/s²**.

##### *REFEREE-11* Speed Calculation <a name="REFEREE-11"></a>
Each frame actual speed of lander is calculated as follows:

*let* **converted_rotation** = **rotation** + **90°**;

*let* **thrust_vertical_component** = **thrust_power** * **sin(converted_rotation)**;

*let* **thrust_horizontal_component** = **thrust_power** * **cos(converted_rotation)**;

*let* **g** = **3.711**;

**v_speed_current** = **v_speed_previous** + **thrust_vertical_component** - **g**;

**h_speed_current** = **h_speed_previous** + **thrust_vertical_component** - **g**;

##### *REFEREE-12* Fuel Consumption <a name="REFEREE-12"></a>
Thrust power of N consumes N liters of fuel per frame.

##### *REFEREE-13* Data Types of Simulator <a name="REFEREE-13"></a>
All data types representing physical values like position or speed are float.

##### *REFEREE-14* Allowed Landing Angle <a name="REFEREE-14"></a>
Lander must land in a vertical position (**rotation = 0°**).

##### *REFEREE-15* Allowed Landing Vertical Speed <a name="REFEREE-15"></a>
Lander Vertical Speed must be less than **40m/s**.

**abs(v_speed)** ≤ **40**

##### *REFEREE-16* Allowed Landing Horizontal Speed <a name="REFEREE-16"></a>
Lander Horizontal Speed must be less than **20m/s**.

**abs(h_speed)** ≤ **20**

##### *REFEREE-17* Surface Touch <a name="REFEREE-17"></a>
Lander touches the surface if a line of length 1 drawn from lander's origin
along it's rotation vector intersects with any of surface segments.

##### *REFEREE-18* Successful Landing <a name="REFEREE-18"></a>
If following conditions are met landing is successful:

| Description                            | ID                        |
|----------------------------------------|---------------------------|
| Surface touch happened                 | [REFEREE-17](#REFEREE-17) |
| Intersection happened in allowed area  | [REFEREE-4](#REFEREE-4)   |
| Landed with rotation = 0°              | [REFEREE-14](#REFEREE-14) |
| Vertical speed is under limit          | [REFEREE-15](#REFEREE-15) |
| Horizontal speed is under limit        | [REFEREE-16](#REFEREE-16) |

##### *REFEREE-19* Map Origin <a name="REFEREE-19"></a>
Map origin is considered to be in the bottom left corner.

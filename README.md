# Caravel User Project - Customised to Round Robin Arbiter
References used:

https://github.com/Vishnu1426/pes_ram_design_tapeout

https://www.youtube.com/watch?v=MNuoYz_MM-c

* Go to this repository:

https://github.com/efabless/caravel_user_project

* Click on use this template & create a repo with a custom name
* Now in your ubuntu temrinal enable root acces using : sudo su
* First clone your custom repo (that you have just created using the template)

```
git clone https://github.com/Navya-tayi/pes_rr_arbiter_tapeout

```


![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/3c034bcd-a136-421a-8189-7afbcc9d5bd8)


![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/8731ee66-263a-46b4-92aa-f1a97704564b)

After this do:

``` 
make setup
```

make setup is done:

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/1f7b86d1-7de8-462a-959f-20d86b5bd024)

__To check if it is working or to rectify errors:__

Run the sample project

```
make user_proj_example
```


__Sample project flow complete:__

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/357883ba-d2f8-4b76-824c-5a5e2a7aa975)


Looking at the GDS:

__First install klayout__

```
sudo apt install klayout
```

layout with the fill and decoupling capacitor cells turned off:

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/f1b2ce38-25c9-43b2-8e4e-a712031bd4c3)

zooming into the MACROS:

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/88efda95-b533-46b2-936e-e8bbb5081880)


# Implementing the same for our custom project:

__Some changes need to be made in the user_project_wrapper.v file__

```
cd verilog/rtl
cp /home/navya/asic_project/pes_rr_arbiter.v .
gedit user_project_wrapper.v

```
modified user_project_wrapper file:

* Put the respective output name pin that you have used in your design.
* Change the instantiation module name to your custom name

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/f4f29175-40eb-4e98-a87e-ae63e215b8c5)

The design file also needs to be modified:
Power pins need to be added and io_oeb pins also should be added: 
(oeb stands for output enable bar), make it 0.

After modification of design file:

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/9e574f6b-e2eb-42f4-ae3b-0ca5f8b159fe)


__The pin_order.cfg file also needs to be modified:__

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/3ed28452-4866-4202-95f0-c0ae54bce774)

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/1a4b4959-7c19-4a4d-8173-5125db7fb9d7)


__The clockport name, design name and the verilog design file name also needs to be modified in config.json file:__

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/9e621795-bfe1-4544-870f-58c37d4041a5)

modified file:
If required also change the DIE_AREA

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/178fb538-d66a-4998-a95b-ccfa844f0fad)


__After completing all this editing__

In the same terminal where the dependencies were modified initially

```
time make pes_rr_arbiter

```
![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/a3a2a35d-7e09-4b11-8dee-47299f83deb1)



__Flow complete:__

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/a9e1c909-96e4-4244-bb2d-01d5fd658c37)




__Final GDS layout:__

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/d88cfc51-b232-4623-8bc6-8329b79a08bf)


__Zooming in to the design:__

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/5e6d27ae-8613-47fc-898b-a59fd0538b39)


__Now it is ready for tapeout__









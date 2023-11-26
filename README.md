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


# Run the example project

This will help to check if the flow is working or to rectify errors:

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


Next, we will push everything into the git hub template that we created:

type:
```
git status
```
![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/2d0b9127-ad90-4404-ae5f-84b5ecd2f7e4)

We need to push these untracked files:

```
git add def/pes_rr_arbiter.def gds/pes_rr_arbiter.gds lef/pes_rr_arbiter.lef lib/pes_rr_arbiter.lib mag/pes_rr_arbiter.mag maglef/pes_rr_arbiter.mag openlane/pes_rr_arbiter/ sdc/pes_rr_arbiter.sdc sdf/ signoff/pes_rr_arbiter/ spef/multicorner/pes_rr_arbiter.max.spef spef/multicorner/pes_rr_arbiter.min.spef spef/multicorner/pes_rr_arbiter.nom.spef spef/pes_rr_arbiter.spef spi/lvs/pes_rr_arbiter.spice venv-cocotb/ verilog/gl/pes_rr_arbiter.nl.v verilog/gl/pes_rr_arbiter.v verilog/gl/user_proj_example.nl.v verilog/rtl/pes_rr_arbiter.v
```
```
git commit -m 'hardened pes_rr_arbiter'

```
![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/167e22aa-7fb5-470f-90bd-8fd46ee9b217)

If it throws the above error then type this with your email id (of your github) in the quotes.

```
git config user.email "tayinavya@gmail.com"
```

Now repeat the commit command

After it is completed do

```
git push
```
It may throw this error after you type your password, if you have cloned the repo initially using https inetad of ssh

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/8940aa62-69f8-4faf-adbb-7fe630070636)

Password is no longer being used to authenticate so go to these links:
https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls
https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens

ANd follow the steps to create and use a token instead for authentication.

Now again do git pull, a vim page may open, press exit
Now do git push again

![image](https://github.com/Navya-tayi/pes_rr_arbiter_tapeout/assets/79205242/a0b9542b-3732-4d42-934f-86daf0e31ce1)

## The github template has been updated with your custom files!

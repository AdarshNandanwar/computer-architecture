```console
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt install -y iverilog gtkwave
$ touch demo.v
```
Paste the code in the file
```console
$ iverilog -o demo.vvp demo.v
$ vvp demo.vvp
$ gtkwave f_adder.vcd
```

In gtkwave
1. select all the wires. (ctrl+a)
2. click on insert or drag drop in the time window
3. Select all and set data type to signed integer

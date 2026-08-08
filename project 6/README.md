# 4-Bit Johnson Counter

## 📌 Project Overview

This project implements a **4-bit Johnson Counter** using **Verilog HDL**.

A Johnson Counter, also known as a **twisted-ring counter**, is a shift register in which the inverted output of the last flip-flop is connected back to the input of the first flip-flop.

A 4-bit Johnson Counter produces **8 unique states**, which is twice the number of flip-flops.

---

## 🎯 Objectives

The main objectives of this project are:

* Design a 4-bit Johnson Counter using Verilog HDL.
* Understand the working principle of a Johnson Counter.
* Create a Verilog testbench.
* Simulate the design and verify its output.
* Observe the counter states using a waveform viewer.

---

## ⚙️ Working Principle

The Johnson Counter consists of four flip-flops connected as a shift register.

The inverted output of the last flip-flop is fed back to the input of the first flip-flop.

For the Verilog implementation in this project:

```text
q <= {q[2:0], ~q[3]};
```

This shifts the bits and feeds the inverted MSB back into the LSB.

---

## 🔢 State Sequence

Starting from `0000`, the counter generates:

```text
0000
0001
0011
0111
1111
1110
1100
1000
0000
```

After reaching the eighth state, the sequence repeats.

Therefore:

```text
Number of flip-flops = 4

Number of states = 2 × 4 = 8
```

---

## 🧩 Block Diagram

```text
                 ┌────────┐
        ┌───────►│  FF0   │──────►
        │        └────────┘
        │             │
        │             ▼
        │        ┌────────┐
        │        │  FF1   │──────►
        │        └────────┘
        │             │
        │             ▼
        │        ┌────────┐
        │        │  FF2   │──────►
        │        └────────┘
        │             │
        │             ▼
        │        ┌────────┐
        └────────│  FF3   │
          NOT Q3 └────────┘

             Common Clock
                  │
                  ▼
              ┌───────┐
              │  CLK  │
              └───────┘
```

---

## 💻 RTL Code

The main design file is:

```text
johnson_counter.v
```

The counter uses a positive-edge-triggered clock and an asynchronous reset.

```verilog
module johnson_counter (
    input  wire       clk,
    input  wire       reset,
    output reg [3:0]  q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= {q[2:0], ~q[3]};
    end

endmodule
```

---

## 🧪 Testbench

The testbench:

1. Generates a clock with a 10 ns period.
2. Applies reset.
3. Releases reset.
4. Allows the counter to run.
5. Displays the output states.
6. Ends the simulation.

Testbench file:

```text
johnson_counter_tb.v
```

---

## 📊 Expected Output

| Clock Cycle | Counter Output |
| ----------: | :------------: |
|       Reset |     `0000`     |
|           1 |     `0001`     |
|           2 |     `0011`     |
|           3 |     `0111`     |
|           4 |     `1111`     |
|           5 |     `1110`     |
|           6 |     `1100`     |
|           7 |     `1000`     |
|           8 |     `0000`     |

The counter repeats this sequence continuously.

---

## 📈 Simulation

The simulation waveform should contain:

```text
CLK    _|‾|_|‾|_|‾|_|‾|_|‾|_|‾|_

RESET  ‾‾‾‾‾‾‾|________________

Q      0000 0001 0011 0111 1111
                         1110 1100
                              1000
                                   0000
```

The waveform verifies that the Johnson Counter correctly cycles through its eight states.

---

## 🛠️ Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* GitHub

---

## ▶️ How to Run

### Using Icarus Verilog

Compile the design and testbench:

```bash
iverilog -o johnson_counter_sim johnson_counter.v johnson_counter_tb.v
```

Run the simulation:

```bash
vvp johnson_counter_sim
```

To view the waveform with GTKWave, add waveform dumping to the testbench and run:

```bash
gtkwave johnson_counter.vcd
```

---

## 📁 Project Structure

```text
johnson-counter/
│
├── README.md
├── johnson_counter.v
└── johnson_counter_tb.v
```

---

## 🌐 Applications

Johnson Counters can be used in:

* Sequence generators
* Digital timing circuits
* Frequency division
* Control circuits
* LED chaser circuits
* Digital counters
* State-machine applications

---

## ✅ Conclusion

A 4-bit Johnson Counter was successfully designed and verified using Verilog HDL.

The counter generates **8 unique states** and then repeats the sequence. The testbench verifies the functionality of the RTL design through simulation.

This project demonstrates the practical implementation of a shift-register-based counter and provides an introduction to RTL design and digital circuit simulation.

```
```

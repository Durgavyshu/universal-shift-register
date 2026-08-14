# Universal Shift Register

## Description
A Universal Shift Register is a digital circuit that can perform:
- Hold
- Shift Left
- Shift Right
- Parallel Load

This project is designed using Verilog HDL.

## Operations

| Select | Operation |
|--------|-----------|
| 00 | Hold |
| 01 | Shift Right |
| 10 | Shift Left |
| 11 | Parallel Load |

## Inputs
- clk : Clock signal
- reset : Reset signal
- sel[1:0] : Operation selection
- parallel_in[3:0] : Parallel input data
- serial_left : Serial input for left shift
- serial_right : Serial input for right shift

## Output
- q[3:0] : 4-bit register output

## Tools
- Verilog HDL
- Icarus Verilog
- GTKWave

## Files
- universal_shift_register.v
- universal_shift_register_tb.v
- README.md

## How to Run

Compile:
iverilog -o shift_reg universal_shift_register.v universal_shift_register_tb.v

Run:
vvp shift_reg

View waveform:
gtkwave shift_reg.vcd
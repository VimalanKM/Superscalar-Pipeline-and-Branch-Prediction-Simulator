# Superscalar-Pipeline-and-Branch-Prediction-Simulator

This is a simulation using C++.

This project implements a superscalar pipeline simulator to evaluate CPU performance. It includes features such as data dependency tracking, forwarding, and branch prediction. The pipeline supports N-wide execution (tested for N=1 and N=2) and handles data hazards efficiently using forwarding paths and stalls. Additionally, branch prediction mechanisms like "Always Taken" and GShare are integrated to minimize pipeline stalls caused by control dependencies. The simulator measures key performance metrics like CPI (cycles per instruction) and misprediction rates. The project is implemented in C++ and follows a modular design to simulate realistic CPU behavior for instruction streams using trace-driven input.

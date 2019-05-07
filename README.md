# GPUdemo.jl

Julia GPU demo.

This repository reproduces the example from the
article [An Introduction to GPU Programming in Julia](https://nextjournal.com/sdanisch/julia-gpu-programming)
by Simon Danisch.

# Running on a p2.xlarge

## Requirements

* NVIDIA Driver

* CUDA Toolkit

## Results

```
$ julia -q --project=@.
julia> include("demo.jl")
[ Info: 1 thread...
[ Info: 4 threads...
[ Info: GPU...
                         Relative Speedup
             ┌                                        ┐
    1 thread ┤ 1.0
   4 threads ┤■ 1.9839445105447995
         gpu ┤■■■■■■■■■■■■■■■■■■■■■ 47.15940228466601
             └                                        ┘
             
             

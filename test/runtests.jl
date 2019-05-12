
using GPUdemo, UnicodePlots

if nthreads() == 1
    error("Run `export JULIA_NUM_THREADS=n`, n > 1, before launching Julia.")
end

speedup = GPUdemo.run_benchmarks()

plt = barplot( ["1 thread", "$(nthreads()) threads", "gpu"],
              speedup,
        title="Relative Speedup")

show(plt)

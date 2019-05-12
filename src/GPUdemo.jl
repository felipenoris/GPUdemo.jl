
# based on https://nextjournal.com/sdanisch/julia-gpu-programming
module GPUdemo

using BenchmarkTools
using CuArrays, GPUArrays
using Base.Threads

function threadded_map!(f::Function, A::Array, B::Array)
    Threads.@threads for i in 1:length(A)
        A[i] = f(B[i])
    end

    return A
end

kernel(y) = (y / 33f0) * (732.f0/y)

function run_benchmarks()

    x, y = rand(10^7), rand(10^7)

    @info("1 thread...")
    single_t = @belapsed map!($kernel, $x, $y)

    @info("$(nthreads()) threads...")
    thread_t = @belapsed threadded_map!($kernel, $x, $y)

    @info("GPU...")
    xgpu, ygpu = cu(x), cu(y)
    gpu_t = @belapsed begin
      map!($kernel, $xgpu, $ygpu)
      GPUArrays.synchronize($xgpu)
    end
    times = [single_t, thread_t, gpu_t]
    speedup = maximum(times) ./ times

    return speedup
end

end # module

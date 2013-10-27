function gemvtest(n, iter)
    A = rand(n,n)
    x = rand(n)
    z = similar(x)
    for i = 1:iter
        z = A * x
    end
    z
end

for (testfunc, testname, longtestname) in [(gemvtest, "gemv", "matrix-vector multiplication")]
    for (n, t, size) in [(2, 10^6, "tiny"),
                         (2^4, 10^5, "small"),
                         (2^6, 10^4, "medium"),
                         (2^8, 10^3, "large"),
                         (2^10, 10^2, "huge")]
      @timeit apply(testfunc, n, t) string(testname, "_", size) string(uppercase(size[1]), size[2:end], " ", longtestname, " test")
    end
end


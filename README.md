When building this nix expression I get the following failure:

    $ nix-build
    ...
    running tests
    Running 1 test suites...
    Test suite test-myLib: RUNNING...
    test-myLib: /tmp/nix-build-myLib-0.0.0.drv-0/hs-test-failure-nix/Lenna.png doesn't exist!

The reason is that the test suite can't find the data file `Lenna.png` because
the `Paths_myLib` module specifies the wrong paths. Running the test-suite
manually works if I set the environment variable `myLib_datadir=data`:

    $ nix-shell --command 'cabal configure --enable-tests; cabal build; myLib_datadir=data dist/build/test-myLib/test-myLib'

Also interesting is that it also fails if I use `cabal test` instead of running
the test executable manually:

    $ nix-shell --command 'cabal configure --enable-tests; cabal build; myLib_datadir=data cabal test'
    ...
    Running 1 test suites...
    Test suite test-myLib: RUNNING...
    test-myLib: /home/bas.van.dijk/development/hs-test-failure-nix/Lenna.png doesn't exist!

Any idea how to get the test suite to run when building with `nix-build`?

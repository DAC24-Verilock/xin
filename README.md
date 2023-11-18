# xin

**xin** is a prototype tool for synthesizing random channel-based asynchronous circuits. The synthesized circuits execute random sending and receiving actions using arbitrary control structures among modules. You can use **xin** to synthesize different scale circuits by adjusting the parameters in `VerilockTask.hs`.

## Installation

To run **xin**, follow these steps:

1. Install Haskell toolchains using [GHCup](https://www.haskell.org/ghcup/)
   - Stack 2.9.3
   - cabal 3.6.2.0
   - GHC 9.2.7
2. Clone the repository.

3. Navigate to the directory where the repository was downloaded.

```bash
cd xin
```

4. Run the synthesis program.

```bash
stack run
```

5. Check the synthesized random asynchronous circuits in the directory `gen`.


## Gas optimization exercise

> Your task is to edit and optimise the Gas.sol contract.
You cannot edit the tests
All the tests must pass.
You can change the functionality of the contract as long as the tests pass.
Try to get the gas usage as low as possible.

To run the tests

`$ forge test --match-contract GasTest --gas-report`

In this exercise, I was able to reduce the deployment cost and gas usage of the different functions from this: 

![Gas Before Optimization](/assets/gasBeforeOptimization.png "Gas Before Optmization")


To this: 

![Gas After Optimization](/assets/gasAfterOptimization.png "Gas After Optmization")


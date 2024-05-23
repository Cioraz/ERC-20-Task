# ERC-20 Task

### Legend
- ```0x0ff3726ff76AFdAD513885F49F1601A8E4bB75f7``` : SimpleDEX deployed address
- ```0xB1Ccc1d09721D695233DcD688F59814Bae4b9464``` : TokenB deployed address
- ```0x838F9b8228a5C95a7c431bcDAb58E289f5D2A4DC``` : TokenA deployed address
- ```0x5B38Da6a701c568545dCfcB03FcB875f56beddC4``` : Address of account 1 responsible for deploying TokenA
- ```0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2``` : Address of account 2 responsible for deploying TokenB

### Procedure and Analysis
- Created two ERC-20 tokens tokenA and tokenB each having 1000 initial mint.
- Created a contract called SimpleDEX which handles the functionality of exchanging these tokens (A to B for a provided exchange Rate).

- The below picture showing all the deployed contracts which include the 2 ERC-20 tokens along with the SimpleDEX contract
![Screenshot from 2024-05-23 21-59-59](https://github.com/Cioraz/ERC-20-Task/assets/76161837/1e6c1605-6f0c-48a5-bad9-aadca59e7aef)

- Below picture showing me fund the contract for 5 out of the 1000 minted tokens of B to ensure we can exchange via the SimpleDEX contract, some tokens of A to tokens of B provided a given exchange Rate.
![Screenshot from 2024-05-23 21-57-50](https://github.com/Cioraz/ERC-20-Task/assets/76161837/9904cc90-4dd1-440d-95bf-a6f87093f1f5)

- Below picture approving the SimpleDEX contract to spend given number of tokensA (for exchange of A to B).
![Screenshot from 2024-05-23 22-01-42](https://github.com/Cioraz/ERC-20-Task/assets/76161837/7f3c6e46-ab26-4efc-9f9c-60624f713895)

- Below logs confirming successful transaction of tokens A to tokens B for given fixed exchange rate which here is given 1 for easy debugging
![Screenshot from 2024-05-23 22-06-08](https://github.com/Cioraz/ERC-20-Task/assets/76161837/9d7f0086-1595-451f-b6cf-378fb5e84511)

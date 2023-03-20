# Web3App - Linksports

This is a simple application that runs the Storage contract provided by [Remix Ethereum Org](https://remix.ethereum.org/#lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.18+commit.87f61d96.js).

<img src="[https://github.com/asd/privategithubrepo/images/output/video1.gif](https://user-images.githubusercontent.com/20178351/226338884-2b9b4219-53bb-427b-8259-0d661325c3bb.gif)" width="470" height="600">


## Installation

 - You must deploy the app's contract on a blockchain. For a basic deploy, we recommend using [Ganache](https://ganache.dev/).
 - Fork/clone this repository and open on Android Studio
 - The contract's file deployment can be found on /smartcontracts/ folder
 - Define as running arguments (default for Ganache):
	 - RPC_URL="http://127.0.0.1:7545"	
	 - WS_URL="ws://127.0.0.1:7545/"
	 - PRIVATE_KEY="Your private key here"
- Execute your simulation device
- Run the terminal command on the project's root (change the port if not using Ganache's default): 
	- adb reverse tcp:7545 tcp:7545
- Run the application

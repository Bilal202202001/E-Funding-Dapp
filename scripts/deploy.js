const hre = require("hardhat");

async function main() {
  const Donate = await hre.ethers.getContractFactory("Donate"); 
  const contract = await Donate.deploy(); 

  // console.log("Contract object:", contract);

  console.log("Address of contract:", contract.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});



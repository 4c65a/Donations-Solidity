const hre = require("hardhat");

async function main() {

  const DonacionesContract = await ethers.getContractFactory("Donaciones");

  const deployedDonacionesContract = await DonacionesContract.deploy();

  await deployedDonacionesContract.deployed();

  console.log(
    " Contract Address:",
    deployedDonacionesContract.address
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
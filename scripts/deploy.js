const hre = require("hardhat");

async function main() {
  //  const Workspace = await hre.ethers.getContractFactory("Workspace");
  // const workspace = await hre.upgrades.deployProxy(Workspace);
  // await workspace.deployed();

  // console.log("workspace deployed to:", workspace.address);

  const WorkspaceV1 = await hre.ethers.getContractFactory("WorkspaceV1"); 
  const workspaceV1 = await hre.upgrades.upgradeProxy("0x3b4248285479eB0E5B2FBf12a9d54b4CE1515E1A", WorkspaceV1); 
  console.log("Workspace upgraded at address",workspaceV1.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

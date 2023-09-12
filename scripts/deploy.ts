import {ethers} from "hardhat";

async function main() {
    const sbt = await ethers.deployContract("SBT");
    await sbt.waitForDeployment();
    console.log(`SBT deployed to ${sbt.target}`);
}


main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
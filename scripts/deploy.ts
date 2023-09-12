import {ethers} from "hardhat";

async function deploySbt() {
    console.log("secret key is " + process.env.PRIVATE_KEY)
    const sbt = await ethers.deployContract("SBT", ['0x6f6E19781600d6B06D64A6b86431FB7dB3E919e0']);
    await sbt.waitForDeployment();
    console.log(`SBT deployed to ${sbt.target}`);
}

async function deployRegistry() {
    console.log("secret key is " + process.env.PRIVATE_KEY)
    const sbt = await ethers.deployContract("SBTRegistry", ['0xe3205e2A207815F93F0EdC92Aff491d3313a141d']);
    await sbt.waitForDeployment();
    console.log(`SBT deployed to ${sbt.target}`);
}



deployRegistry().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
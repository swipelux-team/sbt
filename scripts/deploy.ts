import {ethers} from "hardhat";
import {BaseContract} from "ethers";
import {EnvRequired} from "./util";

const VERIFIER_ADDRESS = new EnvRequired('VERIFIER_ADDRESS');
const NETWORK_NAME = new EnvRequired('NETWORK_NAME');

async function sbtBorn() {
    console.log(`Deploying SBT to ${NETWORK_NAME.value()}`);
    const sbt = await ethers.deployContract(
        "SBT", [VERIFIER_ADDRESS.value()]
    );
    await sbt.waitForDeployment();
    console.log(`SBT deployed to ${sbt.target}`);
    return sbt;
}

async function registryBorn(sbtContract: BaseContract) {
    const registry = await ethers.deployContract(
        "SBTRegistry", [
            sbtContract.target
        ]
    );
    await registry.waitForDeployment();
    console.log(`registry deployed to ${registry.target}`);
    return registry;
}


sbtBorn().then(registryBorn).catch(
    error => {
        console.error(error);
        process.exitCode = 1;
    }
);
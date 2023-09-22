import {HardhatUserConfig} from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import {ethers} from "hardhat";

const config: HardhatUserConfig = {
    solidity: "0.8.19",
};

module.exports = {
    solidity: {
        version: "0.8.18", // Specify your preferred Solidity version
        settings: {
            optimizer: {
                enabled: true,
                runs: 200,
            },
        },
    },
    networks: {
        // Default Hardhat Network (for local testing)
        hardhat: {
            chainId: 1337,
        },

        // Polygon (Matic) Mainnet
        polygon: {
            url: `https://polygon-rpc.com/`,
            chainId: 137,
            accounts: [process.env.PRIVATE_KEY]
        },
        mumbai: {
            url: 'https://polygon-mumbai.blockpi.network/v1/rpc/public',
            chainId: 80001,
            accounts: [process.env.PRIVATE_KEY]
        }
    }
};

export default config;

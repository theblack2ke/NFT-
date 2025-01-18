// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script,console} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {MoodNft} from "src/MoodNft.sol";

contract DeployMoodNft is Script {
    function run() external returns(MoodNft) {

        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");
        console.log(sadSvg);

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(svgToImageUri(sadSvg), svgToImageUri(happySvg));
        vm.stopBroadcast();

        return moodNft;
    }

    function svgToImageUri(string memory svg) public pure returns(string memory) {
        string memory baseUrl = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseUrl, svgBase64Encoded));

    }
}

// function svgToImageURI(string memory svg) public pure returns (string memory) {
//     string memory baseURL = "data:image/svg+xml;base64,";
//     string memory svgBase64Encoded = Base64.encode(bytes(svg));
//     return string(abi.encodePacked(baseURL, svgBase64Encoded));
// }

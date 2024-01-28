// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Donate{

    struct DonationDetail{
        string donorName;
        uint256 donationAmount;
        uint256 timestamp;
        address from;
    }

    DonationDetail[] donationDetails;
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function donateFund(string memory _donarName) public payable {
        require(msg.value > 0, "Please pay greater than 0 ether");
        owner.transfer(msg.value);
        donationDetails.push(DonationDetail(_donarName, msg.value, block.timestamp, msg.sender));
    }

    function getBalance() public view returns (uint){
        return msg.sender.balance;
    }

    function getDonationDetails() public view returns (DonationDetail[] memory) {
        return donationDetails;
    }
}

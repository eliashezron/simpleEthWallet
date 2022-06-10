// SPDX-License-Identifier:MIT
pragma solidity ^0.8.11;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract test{
    address[] public receiveUsers;
    address[] public fallbackUsers;
    uint256 public v1;
    uint256 public v2;
    bytes public data;

    receive() external payable{
        receiveUsers.push(msg.sender);
        v1 = msg.value;
    }
    fallback() external payable{
        fallbackUsers.push(msg.sender);
        data = msg.data;
        v2  = msg.value;
    }

    function getContractBalance() public view returns(uint256){
    return address(this).balance;
    }


}
contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MT") {
        _mint(msg.sender, initialSupply);
    }
}
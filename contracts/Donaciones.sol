// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Donaciones {
    //variations
    uint256 amount;
    address payable owner;
    
  
    //event
    event Donation(address sender, uint256 amount);
    event Withdraw(uint256 amount, uint256 balance);


    //modifier
    modifier controlDonation(){
        require(msg.value > 0 ether,"El valor a donar debe ser mayor a 0");
        _;
    }
  
    modifier onlyOwnerd() {
        require(msg.sender == owner, "No es el propietario");
        _;
    }

    //function
    function donation() public  payable controlDonation(){
        emit Donation(msg.sender,msg.value);
    }

    function getBalance() view public returns (uint256) {
        return address(this).balance;
    }


    function withdraw(uint256 _amount) public  onlyOwnerd  {
        owner.transfer(_amount);
        emit Withdraw(_amount,address(this).balance);

    }
   
}

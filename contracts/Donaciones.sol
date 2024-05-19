// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/**
@title Donaciones smart contract
@notice Es un smart contract que recive donacion solo en ETHE
*/

contract Donaciones {
 
    uint256 amount;
    address payable owner;
    
    /**
    @notice Envia un evento cada ves que se dona o se retira los ETH
    */
    event Donation(address sender, uint256 amount);
    event Withdraw(uint256 amount, uint256 balance);


    /**
    @notice Es un control de donacion
    */
    modifier controlDonation(){
        require(msg.value > 0 ether,"El valor a donar debe ser mayor a 0");
        _;
    }
    
    /**
    @notice Solo el pripietario puede utilizar algunas funciones
    */
    modifier onlyOwnerd() {
        require(msg.sender == owner, "No es el propietario");
        _;
    }

    /**
    @notice El smart contract recive ETH a traves de esta funcion
    */
    function donation() public  payable controlDonation(){
        emit Donation(msg.sender,msg.value);
    }

    /**
    @notice Muestra el balance de ETH en el smart contract
    */
    function getBalance() view public returns (uint256) {
        return address(this).balance;
    }

    /**
    @notice Funcion que sirve para retirar los ETH del smart contract 
    @param _amount Cantidad de Ether a retirar
    @dev Solo el propietario puede retirar y utlizar esta funcion 
    */
    function withdraw(uint256 _amount) public  onlyOwnerd  {
        owner.transfer(_amount);
        emit Withdraw(_amount,address(this).balance);
    }
   
}

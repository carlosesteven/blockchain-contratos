// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Contrato_A 
{
    uint public numeroA = 1000;
    
    function cambiarValorA(uint _numero) public {
        numeroA = _numero;
    }

    // Funcion a la que llamamos
    function IdContrato() public view returns(address) {
        return address(this);
    }
    
}
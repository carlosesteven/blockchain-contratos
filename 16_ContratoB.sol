// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Contrato_B  {
    
    Contrato_A contrato;
    
    function IdContrato(address _id) public {
        contrato = Contrato_A(_id);
    }
 
    function cambiarNumero() public view returns (uint result) {
        return contrato.numeroA();
    }
    
    function verNumero(uint _valor) public {
        contrato.cambiarValorA(_valor);
    }
    
}

interface Contrato_A{
    function cambiarValorA(uint _numero) external;

    function numeroA() external pure returns( uint );
}
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Funciones{

    uint numero;

    function cambiarNumero( uint valor ) public {
        numero = valor;
    } 

    function verNumero() public view returns (uint) {
        return numero;
    }

}
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Modificadores{

    uint numero;
    address creador;

    constructor() {
        creador = msg.sender;
    }

    modifier validarCreador(){
        require(msg.sender == creador);
        _;
    }

    function cambiarNumero( uint _numero ) public validarCreador {
        numero = _numero;
    } 

    function verNumero() public view returns (uint) {
        return numero;
    }

}
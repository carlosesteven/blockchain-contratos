// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Eventos{

    uint numero;
    address creador;

    constructor() {
        creador = msg.sender;
    }

    modifier validarCreador(){
        require(msg.sender == creador);
        _;
    }

    event VariableModificada(address direccion, uint nuevoValor);   

    function cambiarNumero( uint _numero ) public validarCreador {
        numero = _numero;
        emit VariableModificada(msg.sender, _numero);               
    } 

    function verNumero() public view returns (uint) {
        return numero;
    }

}



// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Enumerados{

    enum EstadoVariable { Original, Modificada } 

    uint numero;

    EstadoVariable public estado;

    constructor()
    {
        estado = EstadoVariable.Original;
    }

    function cambiarNumero( uint _numero ) public {
        numero = _numero;
        estado = EstadoVariable.Modificada;
    } 

    function verNumero() public view returns (uint) {
        return numero;
    }

    function verEstado() public view returns (string memory) {
        if( estado == EstadoVariable.Original )
        {
            return "Estado: original";
        }else{
            return "Estado: modificada";
        }
    }

}
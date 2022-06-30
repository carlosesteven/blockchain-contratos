// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Estructuras{

    struct Registro{
        uint numero;
        uint contador;
    }

    Registro _Registro;

    function cambiarNumero( uint _numero ) public {
        _Registro.numero = _numero;
        _Registro.contador = _Registro.contador + 1;
    } 

    function verNumero() public view returns (uint, uint) {
        return (_Registro.numero, _Registro.contador);
    }

}


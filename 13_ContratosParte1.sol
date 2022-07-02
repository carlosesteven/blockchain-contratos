// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract ContratoA {
    // Variable que va ser del tipo contract
    ContratoB llamarContrato = new ContratoB();
    // consultar un número de contrato
    function getNumeroA() public view returns(uint) {
        // Devuelve el número del contrato al que vamos a llamar
        return llamarContrato.getNumeroB();
    }
    function setNumeroA( uint _numero ) public {
        // Devuelve el número del contrato al que vamos a llamar
        return llamarContrato.setNumeroB( _numero ) ;
    }
}

contract ContratoB {
    uint numero = 40;
    // Funcion a la que llamamos
    function getNumeroB() public view returns(uint) {
        return numero;
    }

    // Funcion a la que llamamos
    function setNumeroB( uint _numero ) public {
        numero = _numero;
    }
}
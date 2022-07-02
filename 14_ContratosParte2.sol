// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

// Dirección de este contrato: 
contract ContratoD 
{
    uint numero = 400;

    // Funcion a la que llamamos
    function getNumeroD() public view returns(uint) {
        return numero;
    }

    // Funcion a la que llamamos
    function setNumeroD( uint _numero) public {
        numero = _numero;
    }

    // Funcion a la que llamamos
    function IdContrato() public view returns(address) {
        return address(this);
    }
    
}

// Para que funcione vamos a crear primero el contratoD y asi poder añadir la dirección en el contrato C
contract ContratoC {

    // Dentro del new ContratoD(Dirección del contrato);
    address direccionContrato = 0x62FF318Bee4D6d605D163Ed3325077E32803599B;

    ContratoD contrato = ContratoD(direccionContrato);

    // consultar un número de contrato
    function getNumero() public view returns(uint) {
        // Devuelve el número del contrato al que vamos a llamar
        return contrato.getNumeroD();
    }

    // consultar un número de contrato
    function setNumero( uint _numero ) public {
        // Devuelve el número del contrato al que vamos a llamar
        return contrato.setNumeroD( _numero );
    }
}
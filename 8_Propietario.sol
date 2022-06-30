// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Propietario {

    address private propietario;

    event cambioPropietario(address anteriorPropietario, address nuevoPropietario);

    modifier esPropietarioDelContrato() {
        require(msg.sender == propietario, "La persona NO es el propietario del contrato");
        _;
    }

    constructor() {
        propietario = msg.sender; 
    }

    function cambiarPropietario(address nuevoPropietario) public esPropietarioDelContrato {
        emit cambioPropietario(propietario, nuevoPropietario);
        propietario = nuevoPropietario;
    }

    function obtenerPropietario() external view returns (address) {
        return propietario;
    }
} 
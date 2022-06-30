// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Transferencia {

    address public minter;
    mapping (address => uint) public saldoDisponible;

    event TranferirValores(address emisor, address receptor, uint cantidad);

    constructor() {
        minter = msg.sender;
    }

    function Recargar(address receptor, uint cantidad) public {
        require(msg.sender == minter);
        saldoDisponible[receptor] += cantidad;
    }

    error SaldoInsuficiente(uint solicitado, uint disponible);

    function Transferir(address receptor, uint cantidad) public {
        if (cantidad > saldoDisponible[msg.sender])
            revert SaldoInsuficiente({
                solicitado: cantidad,
                disponible: saldoDisponible[msg.sender]
            });

        saldoDisponible[msg.sender] -= cantidad;
        saldoDisponible[receptor] += cantidad;
        emit TranferirValores(msg.sender, receptor, cantidad);
    }
}
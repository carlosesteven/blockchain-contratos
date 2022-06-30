// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Votacion {

    string[] nombreCandidatos = ["Carlos","Camilo"];

    mapping (string => uint8) votosRecibidos; //mapping que asocia numero de votos a candidato
    mapping (string => bool) candidatos; //mapping para saber si un candidato es válido

    constructor(){
        for(uint i = 0; i < nombreCandidatos.length; i++) {
            candidatos[nombreCandidatos[i]] = true;
        }
    }

    // Numero total de votos recibidos por un candidato
    function votosTotales(string memory candidato) public view returns (uint8) {
        require(candidatoEsValido(candidato));
        return votosRecibidos[candidato];
    }

    // Incrementa en 1 el numero de votos de un candidato
    function votar(string memory candidato) public {
        require(candidatoEsValido(candidato));
        votosRecibidos[candidato] += 1;
    }

    // Comprueba que un candidato existe
    function candidatoEsValido(string memory candidato) public view returns (bool) {
        return (candidatos[candidato]);
    }
}

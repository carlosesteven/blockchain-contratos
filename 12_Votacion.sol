// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Votacion {

    string[] listaCandidatos = [ 
        "Carlos",
        "Camilo" 
    ];

    mapping (string => uint8) votosRecibidos; //mapping que asocia numero de votos a candidato
    mapping (string => bool) candidatos; //mapping para saber si un candidato es válido
    mapping(address => bool) votantes;  //mapping para saber si un usuario ya realizo su voto

    // Inicializa el mapping de los candidatos
    constructor(){
        for(uint i = 0; i < listaCandidatos.length; i++) 
        {
            candidatos[listaCandidatos[i]] = true;
        }
    }

    // Evento de seguimiento de votos totales
    event agregoVotoCandidato(string candidato, uint cantidadVotosTotales);  

    // Incrementa en 1 el numero de votos de un candidato
    function votarCandidato(string memory candidato) public 
    {
        // Valida si el candidato existe
        require( verificarCandidato(candidato), "El CANDIDATO votado es INVALIDO");

        // Valida si el usuario ya registro el voto
        require( verificarUsuario(msg.sender), "El USUARIO ya voto previamente");

        // Agrega un voto al candidato seleccionado
        votosRecibidos[candidato] += 1;

        // Marca el usuario del votante
        votantes[ msg.sender ] = true;

        // Lanza el evento
        emit agregoVotoCandidato( candidato, votosRecibidos[candidato] );
    }

    // Verifica el numero total de votos recibidos por un candidato
    function votosTotales(string memory candidato) public view returns (uint8) 
    {
        require( verificarCandidato(candidato), "El candidato votado es INVALIDO");
        return votosRecibidos[candidato];
    }

    // Agrega un nuevo candidato
    function agregarCandidato(string memory candidato) public 
    {
        // Valida que el candidato no existe en la lista
        require( !verificarCandidato(candidato), "El candidato ya se encuentra registrado");

        // Agrega el candidato a la lista de candidatos
        listaCandidatos.push( candidato );

        // Marca el candidato como valido
        candidatos[ candidato ] = true;
    }

    // Verifica si el canditato existe en el mapping
    function verificarCandidato(string memory candidato) internal view returns (bool) 
    {
        return ( candidatos[candidato] );
    }

    // Verifica si el votante existe en el mapping
    function verificarUsuario(address votante) internal view returns (bool) 
    {
        return ( !votantes[votante] );
    }

    // Ver lista de candidatos agregados
    function verCandidatos() public view returns( string[] memory )
    {
        return listaCandidatos;
    }

    function verGanador() public view returns( string memory )
    {
        string memory candidato = "- - -";
        uint votos = 0;
        for( uint i = 0; i < listaCandidatos.length; i++ )
        {
            if( votosRecibidos[ listaCandidatos[ i ] ] > votos )
            {
                candidato = listaCandidatos[ i ];
                votos = votosRecibidos[ listaCandidatos[ i ] ];
            }
        }
        return string(
            abi.encodePacked('El candidato con MAS votos es: ',candidato)
        );
    }

}
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract AgendaMapping 
{
    // Estructura de datos de la AGENDA
    struct Contacto {
        string nombre;
        uint telefono;
        string email;
        uint edad;
        bool valido; // Variable Validadora
    }

    // Evento que registra los nuevos libros
    event nuevoContacto(uint telefono, string nombre);

    // MAPPING de contactos   
    mapping(uint => Contacto) public mappingContactos; 

    // Función para AGREGAR nuevos contactos
    function anadirContacto(string memory _nombre, uint _telefono, string memory _email, uint _edad) public 
    {
        // Funcion para validar SI YA EXISTE un contacto en la lista, en caso de EXISTIR, muestra el error entre " (comillas).
        require( mappingContactos[_telefono].valido == false, "Ya existe un contacto con el mismo numero de TELEFONO."); 

        // Crea el contacto en el MAPPING de contactos del contactos
        mappingContactos[_telefono] = Contacto(
            _nombre, 
            _telefono, 
            _email, 
            _edad, 
            true
        );

        emit nuevoContacto( _telefono, _nombre );
    }
   
    // Función para BUSCAR un contacto en la lista (MAPPING) de contactos
    function obtenerContacto(uint _telefono) public view returns (string memory, uint, string memory, uint) 
    {
        //  Busca el contacto en el mapping de contactos mediante el numero de telefono
        Contacto storage contacto = mappingContactos[_telefono];
        
        // Valida si el que el contacto existe, en caso de NO existir muestra el error entre " (comillas).
        require(
            contacto.valido, 
            "El contacto NO esta registrado o NO existe"
        ); 
        
        // Retorna el contacto encontrado en la lista (MAPPING)
        return (
            contacto.nombre, 
            contacto.telefono, 
            contacto.email, 
            contacto.edad
        );
    }
}
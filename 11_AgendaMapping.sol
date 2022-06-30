// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract AgendaMapping {
    
    // Estructura de datos
    struct Contacto {
        string nombre;
        uint telefono;
        string email;
        uint edad;
        bool valido; // Validador
    }
   
    Contacto[] arrayContactos;  // Array de contactos   

    mapping(uint => Contacto) mappingContactos; // Mapping de contactos   
   
    // Función para añadir contactos
    function anadirContacto(string memory _nombre, uint _telefono, string memory _email, uint _edad) public 
    {
        
        // Verifica que no hay otro contacto con el mismo telefono
        require(
            mappingContactos[_telefono].valido == false, 
            "Ya existe un contacto con el mismo numero de TELEFONO."
        ); 

        // Crea el contacto en el MAPPING de contactos del cobtrato
        mappingContactos[_telefono] = Contacto(
            _nombre, 
            _telefono, 
            _email, 
            _edad, 
            true
        );

        // Agrega el contacto al ARRAY de contactos del contrato
        arrayContactos.push(mappingContactos[_telefono]);
    }
   
    // Función para leer contactos a partir del teléfono 
    function obtenerContacto(uint _telefono) public view returns (string memory, uint, string memory, uint) 
    {
        //  Busca el contacto en el mapping de contactos mediante el numero de telefono
        Contacto storage contacto = mappingContactos[_telefono];
        
        // Comprobar que el contacto existe
        require(contacto.valido, "El contacto NO esta registrado o NO existe"); 
        
        // Retorna el contacto encontrado
        return (
            contacto.nombre, 
            contacto.telefono, 
            contacto.email, 
            contacto.edad
        );
    }

    // Función para ver todos los contactos agregados al contrato
    function obtenerContactos() public view returns (Contacto[] memory) 
    {
       return arrayContactos;
    } 
}
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract AgendaArray {
    
    // Estructura de datos
    struct Contacto {
        string nombre;
        uint telefono;
        string email;
        uint edad;
    }
   
   Contacto[] arrayContactos; // Array de contactos   
   
    // Función para añadir contactos
    function anadirContacto(string memory _nombre, uint _telefono, string memory _email, uint _edad) public {
        arrayContactos.push(
            Contacto(
                _nombre, 
                _telefono, 
                _email, 
                _edad
            )
        );
    }   
    
    // Función para leer contactos a partir del un numero de teléfono
    function obtenerContacto(uint _telefono) public view returns (string memory, uint, string memory, uint) {
       for (uint i = 0; i < arrayContactos.length; i++)
       {
           if (arrayContactos[i].telefono == _telefono)
           {
               Contacto storage contacto = arrayContactos[i];
               return (
                   contacto.nombre, 
                   contacto.telefono, 
                   contacto.email, 
                   contacto.edad
                );
           }
       }
       revert();
    } 

    // Función para ver todos los contactos agregados al contrato
    function obtenerContactos() public view returns (Contacto[] memory) {
       return arrayContactos;
    } 

}
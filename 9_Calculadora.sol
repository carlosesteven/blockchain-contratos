// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Calculadora {
 
    function and(bool x, bool y) public pure returns (bool) {
        return (x && y);
    }

    function or(bool x, bool y) public pure returns (bool) {
        return (x || y);
    }
    
    function suma(int x, int y) public pure returns (int) {
        return (x + y);
    }
    
    function resta(int x, int y) public pure returns (int) {
        return (x - y);
    }

    function multiplica(int x, int y) public pure returns (int) {
        return (x * y);
    }

    function divide(int x, int y) public pure returns (int) {
        return (x / y);
    }
    
    function mayor(int x, int y) public pure returns (int) {
        if (x > y)
            return x;
        else
            return y;
    }

}
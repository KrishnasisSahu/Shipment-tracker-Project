// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Buyer.sol";

contract Seller 
{   
    address public seller_address;

     constructor() payable
    {
        seller_address=payable (msg.sender);
    }

    struct seller
    {
        uint id;
        string name;
        string email;
        string addr;
    }

    uint seller_count=0;
    mapping (uint=> seller)public sellers;

    function addSeller(string memory _name,string memory _email,string memory _delivery_addr) public  {
        seller_count++;
        sellers[seller_count]=seller(seller_count,_name,_email,_delivery_addr);
    }  

    function sendQuotation(uint _quantity) public pure returns (uint)
    {   
        uint price=10; 
        uint total_price = price*_quantity;
        return total_price;
    }

}
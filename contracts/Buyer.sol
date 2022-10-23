// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Buyer
{
    address public buyer_address ;

    constructor() payable
    {
        buyer_address=payable (msg.sender);
    }

    struct buyer
    {
        uint id;
        string name;
        string email;
        string delivery_addr;
    }
    
    uint buyer_count=0;
    mapping (uint=> buyer)public buyers;

    struct product_requested
    {
        string product_name;
        uint quantity;
    }

    uint product_count=0;
    mapping (uint=> product_requested)public products;
    
    function addBuyer(string memory _name,string memory _email,string memory _delivery_addr) public  {
        buyer_count++;
        buyers[buyer_count]=buyer(buyer_count,_name,_email,_delivery_addr);
    }  

     function addProduct(string memory _name,uint _quantity) public  {
        product_count++;
        products[product_count]=product_requested(_name,_quantity);

    }  

    modifier onlyBuyer {
      require(msg.sender == buyer_address);
      _;
   }


    function send(address payable to, uint amount) public payable onlyBuyer
    {
        to.transfer(amount );
        return;

    }
     
    


}



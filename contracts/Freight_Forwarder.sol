// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Seller.sol";

contract Freight_Forwarder
{
    struct Location {
        string name;
        string custodian;
        uint arrival;
        uint departure;
    }

     event Departed(
        string location,
        string custodian,
        uint time,
        uint index
    );

    event Arrived(
        string location,
        string custodian,
        uint time,
        uint index
    );

    event Delivered(
        string location,
        string custodian,
        uint time
    );

    uint public packageId;
    string public from;
    string public to;
    string public originName;
    string public destinationName;
    uint public departureTime;
    uint public deliveryTime;

    Location[] locations;

    function shipmentTracking(uint _packageId,string memory _from,string memory _to,string memory _originName,string  memory _destinationName,string memory _custodian,uint _departureTime) public {
        packageId = _packageId;
        from = _from;
        to = _to;
        originName = _originName;
        destinationName = _destinationName;
        departureTime = _departureTime;
        deliveryTime = 0;

        locations.push(Location({
            name: _originName,
            custodian: _custodian,
            arrival: 0,
            departure: block.timestamp
        }));

        emit Departed(_originName, _custodian, block.timestamp, locations.length - 1);
    }

    function arrive(string memory _name,string memory _custodian,uint _arrival ) public returns (bool success)
    {
        if (_arrival == 0) {
            _arrival = block.timestamp;
        }

        locations.push(Location({
            name: _name,
            custodian: _custodian,
            arrival: _arrival,
            departure: 0
        }));

        emit Arrived(_name, _custodian, _arrival, locations.length - 1);
        return true;
    }

    function depart(uint _index,uint _departure)public returns (bool success)
    {
        if (_departure == 0) {
            _departure = block.timestamp;
        }

        locations[_index].departure = _departure;

       emit  Departed(
            locations[_index].name,
            locations[_index].custodian,
            _departure,
            _index
        );
        return true;
    }

    function deliver(string memory _name,string memory _custodian,uint _arrival)public returns (bool success)
    {
        if (_arrival == 0) {
            _arrival = block.timestamp;
        }

        locations.push(Location({
            name: _name,
            custodian: _custodian,
            arrival: _arrival,
            departure: 0
        }));

       emit Arrived(_name, _custodian, _arrival, locations.length - 1);
       emit Delivered(_name, _custodian, _arrival);
        return true;
    }

    function getDetails() view public returns (uint, string memory, string memory, string memory, string memory, uint, uint)
    {
        return (
            packageId,
            from,
            to,
            originName,
            destinationName,
            departureTime,
            deliveryTime
        );
    }


    function getLocations() view public returns (Location[] memory)
    {
        return locations;
    }

}
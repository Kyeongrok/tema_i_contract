pragma solidity ^0.4.24;

contract Room {


    mapping(address => RoomInfo) public rooms;

    RoomInfo[] public roomByIndex;

    struct RoomInfo {
        address host;
        string title;
        uint price;
    }

    event RegistRoom(address _address, string _title, uint price);

    constructor() public{

    }

    function roomCount() public view returns (uint) {
        return roomByIndex.length;
    }

    function registRoom(string _title, uint _price) public{
        RoomInfo storage room = rooms[msg.sender];
        room.title = _title;
        room.price = _price;
        room.host = msg.sender;

        roomByIndex.push(room);

        emit RegistRoom(msg.sender, _title, _price);
    }

    function echoAccount(address _address) public pure returns(address){
        return _address;
    }

    function myAccount() public view returns(address){
        return msg.sender;
    }


}

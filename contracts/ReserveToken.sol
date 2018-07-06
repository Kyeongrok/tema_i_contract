pragma solidity ^0.4.24;

contract ReserveToken {

    address public host;

    mapping(address => Room) public rooms;

    Room[] public roomByIndex;

    struct Room{
        address host;
        string title;
        uint price;
    }

    event RegistRoom(address _address, string _title, uint price);

    constructor() public{
        host = msg.sender;
    }


    function roomCount() public view returns (uint) {
        return roomByIndex.length;
    }

    function registRoom(string _title, uint _price) public{
        Room storage room = rooms[msg.sender];
        room.title = _title;
        room.price = _price;
        room.host = msg.sender;

        roomByIndex.push(room);

        emit RegistRoom(msg.sender, _title, _price);
    }

    function getRoomName(address _address) public view returns(string){
        return rooms[_address].title;
    }

    function getRoomPrice(address _address) public view returns(uint){
        return rooms[_address].price;
    }

    function echoAccount(address _address) public pure returns(address){
        return _address;
    }

    function myAccount() public view returns(address){
        return msg.sender;
    }

    function getHost() public returns(address){
        return host;
    }

}

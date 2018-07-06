pragma solidity ^0.4.18;

contract ReserveToken {

    address public host;

    mapping(address => Reserve) public reserves;
    mapping(address => Room) public rooms;

    Room[] public roomByIndex;

    struct Reserve{
        address host;
        string from;
        string to;
    }

    struct Room{
        address host;
        string title;
        uint price;
    }

    event NewReserve(address _host, address _guest, string from, string to);
    event RegistRoom(address _address, string _title, uint price);

    constructor() public{
        host = msg.sender;
    }


    function roomCount() public view returns (uint) {
        return roomByIndex.length;
    }

    function reserve(address _host, string _from, string _to) public{
        address guest = msg.sender;
        Reserve storage reservation = reserves[guest];
        reservation.host = _host;
        reservation.from = _from;
        reservation.to = _to;

        emit NewReserve(_host, guest, _from, _to);
    }

    function reserveOf(address _address) public view returns(string from){
        return reserves[_address].from;
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

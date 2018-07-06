pragma solidity ^0.4.18;

contract ReserveToken {

    mapping(address => Reserve) public reserves;
    mapping(address => Room) public rooms;

    Room[] public roomByIndex;

    struct Reserve{
        string from;
        string to;
    }

    struct Room{
        string title;
        uint price;
    }

    event NewReserve(address _address, string from, string to);
    event RegistRoom(address _address, string _title, uint price);


    function ReserveToken(){

    }

    function reserve(address _address, string _from, string _to){
        Reserve storage reserve = reserves[_address];
        reserve.from = _from;
        reserve.to = _to;

        emit NewReserve(_address, _from, _to);
    }

    function reserveOf(address _address) public returns(string from){
        return reserves[_address].from;
    }

    function registRoom(string _title, uint _price) public{
        Room storage room = rooms[msg.sender];
        room.title = _title;
        room.price = _price;

        roomByIndex.push(room);

        emit RegistRoom(msg.sender, _title, _price);
    }

}

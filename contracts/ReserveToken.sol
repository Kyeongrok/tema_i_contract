pragma solidity ^0.4.0;

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

    function reserve(address _address, String _from, String _to){
        NewReserve storage reserve = animals[_address];
        reserve.from = _from;
        reserve.to = _to;

        // 돈을 빼간다 _address
        // 돈을 너준다

        emit NewReserve(_address, _from, _to);
    }

    function reserveOf(address _address) public {
        return reserves[_address];
    }

    function registRoom(string _title, uint _price) public{
        Room storage room = rooms[msg.sender];
        room.title = _title;
        room.price = _price;

        roomByIndex.push(room);

        emit RegistRoom(msg.sender, _title, _price);
    }



}

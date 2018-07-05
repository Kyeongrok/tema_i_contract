pragma solidity ^0.4.0;

contract ReserveToken {

    mapping(address => Reserve) public reserves;

    struct Reserve{
        string from;
        string to;
    }

    struct Room{
        string title;
        uint price;
    }

    event NewReserve(address _address, string from, string to);


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



}

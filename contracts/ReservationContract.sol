pragma solidity ^0.4.24;

import "./ReserveToken.sol";
import "./TemaToken.sol";

contract ReservationContract {
    mapping(address => Reservation) public reserves;

    TemaToken temaToken;
    ReserveToken reserveToken;

    struct Reservation {
        address host;
        string from;
        uint duration;
    }

    event NewReserve(address _host, address _guest, string from, uint _duration);

    constructor() public{
        temaToken = new TemaToken();
        reserveToken = new ReserveToken();
    }

    function reserve(address _host, string _from, uint _duration) public{
        address guest = msg.sender;
        Reservation storage reservation = reserves[guest];
        reservation.host = _host;
        reservation.from = _from;
        reservation.duration = _duration;

        emit NewReserve(_host, guest, _from, _duration);
    }
}

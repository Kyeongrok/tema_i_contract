pragma solidity ^0.4.18;

import "./ReserveToken.sol";
import "./TemaToken.sol";

contract ReservationContract {
    mapping(address => Reservation) public reserves;

    TemaToken temaTokenAddress;
    ReserveToken reserveTokenAddress;

    struct Reservation {
        address host;
        string from;
        string to;
    }

    event NewReserve(address _host, address _guest, string from, string to);

    constructor(TemaToken _temaTokenAddress, ReserveToken _reserveTokenAddress) public{
        temaTokenAddress = _temaTokenAddress;
        reserveTokenAddress = _reserveTokenAddress;
    }

    function reserve(address _host, string _from, string _to) public{
        address guest = msg.sender;
        Reservation storage reservation = reserves[guest];
        reservation.host = _host;
        reservation.from = _from;
        reservation.to = _to;

        emit NewReserve(_host, guest, _from, _to);
    }

}

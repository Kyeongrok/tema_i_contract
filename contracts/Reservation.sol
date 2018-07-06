pragma solidity ^0.4.24;

import "./Room.sol";
import "./TemaToken.sol";
import "./Reputation.sol";

contract Reservation is Room, Reputation {
    mapping(address => ReservationInfo) public reserves;

    TemaToken temaToken;

    struct ReservationInfo {
        address host;
        string from;
        uint duration;
    }

    event NewReserve(address _host, address _guest, string from, uint _duration);

    constructor() public{
        temaToken = new TemaToken();
    }

    function reserve(address _host, string _from, uint _duration) public{
        address guest = msg.sender;
        ReservationInfo storage reservation = reserves[guest];
        reservation.host = _host;
        reservation.from = _from;
        reservation.duration = _duration;

        emit NewReserve(_host, guest, _from, _duration);
    }
}
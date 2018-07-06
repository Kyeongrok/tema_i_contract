pragma solidity ^0.4.24;

import "./Room.sol";
import "./TemaToken.sol";
import "./Reputation.sol";

contract Reservation is Room, Reputation {
    enum ReservationState { Reserved, CheckedIn, CheckedOut }

    mapping(address => ReservationInfo) public reserves;

    TemaToken temaToken;

    struct ReservationInfo {
        address host;
        string from;
        uint duration;
        ReservationState state;
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
        // reservation.state = ReservationState.Reserved; //우선 체크인상태로 바로 설정.
        reservation.state = ReservationState.CheckedIn;
        reservation.duration = _duration;

        emit NewReserve(_host, guest, _from, _duration);
    }

    function checkout() public {
        ReservationInfo storage reservation = reserves[msg.sender];

        // 체크인 상태인지 확인
        require(reservation.state == ReservationState.CheckedIn);

        // 호스트에게 토큰 전달

        // 체크아웃으로 변경
        reservation.state = ReservationState.CheckedOut;
    }
}
pragma solidity ^0.4.24;

contract Reputation {
    enum Grade {VeryGood, Good, Normal, NotBad, Bad}

    struct ReputationInfo {
        address writer;
        string comment;
        Grade grade;
    }

    mapping (address => ReputationInfo[]) hostReputation;
    mapping (address => ReputationInfo[]) guestReputation;

    function setHostReputation(
        address _host,
        string _comment,
        uint8 _grade
    )
    public
    {
        ReputationInfo memory reputation
        = ReputationInfo(msg.sender, _comment, Grade(_grade));
        hostReputation[_host].push(reputation);
    }

    function setGuestReputation(
        address _guest,
        string _comment,
        uint8 _grade
    )
    public
    {
        ReputationInfo memory reputation
        = ReputationInfo(msg.sender, _comment, Grade(_grade));
        guestReputation[_guest].push(reputation);
    }

    function getHostReputationNumber(address _host)
    public
    view
    returns(uint256)
    {
        return hostReputation[_host].length;
    }

    function getGuestReputationNumber(address _guest)
    public
    view
    returns(uint256)
    {
        return guestReputation[_guest].length;
    }

    function getHostReputation(address _host, uint256 _id)
    public
    view
    returns(address writer, string comment, Grade grade)
    {
        ReputationInfo memory reputation = hostReputation[_host][_id];
        return (reputation.writer, reputation.comment, reputation.grade);
    }

    function getGuestReputation(address _guest, uint256 _id)
    public
    view
    returns(address writer, string comment, Grade grade)
    {
        ReputationInfo memory reputation = guestReputation[_guest][_id];
        return (reputation.writer, reputation.comment, reputation.grade);
    }
}
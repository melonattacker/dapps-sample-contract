pragma solidity ^0.5.0;

contract Recorder {
    
    struct Data {
        uint256 weight;
        uint256 height;
        uint256 time;
    }
    
    address[] public users;
    
    mapping (address => Data) userToData;
    
    function writeData(uint256 weight, uint256 height) public returns(bool) {
        uint256 time = block.timestamp;
        if(!isUserExist(msg.sender)) {
            users.push(msg.sender);
        }
        userToData[msg.sender].weight = weight;
        userToData[msg.sender].height = height;
        userToData[msg.sender].time = time;
        return true;
    }
    
    function viewData(address user) public view returns(uint256, uint256, uint256) {
        uint256 weight = userToData[user].weight;
        uint256 height = userToData[user].height;
        uint256 time = userToData[user].time;
        return (weight, height, time);
    }
    
    function isUserExist(address user) public view returns(bool) {
        for(uint i = 0; i < users.length; i++) {
            if(users[i] == user) {
                return true;
            }
        }
        return false;
    }
    
}
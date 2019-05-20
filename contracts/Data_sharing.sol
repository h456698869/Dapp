pragma solidity ^0.5.0;

contract Data_sharing {
     // Model a Member
     struct Member {
        uint id;
        string name;
        address addr;
        uint ObjectNum;
        mapping(uint => string) ObjectID;
        mapping(address => mapping(uint => bool)) Authorizations;
    }
    
    address public president;
    mapping(address => uint) public memberList;
    mapping(uint => Member) public members;
    uint public membersCount;
    
    
    event memberRegister (
        uint indexed _MemberID
    );

    
    function addPresident(string memory _name) public{
        president = msg.sender;
        members[membersCount] = Member(membersCount, _name, msg.sender, 0);
        memberList[msg.sender] = membersCount;
        membersCount ++;
    }

    function joinMember(string memory _name) public {
        members[membersCount] = Member(membersCount, _name, msg.sender, 0);
        memberList[msg.sender] = membersCount;
        membersCount ++;
    }
    
    function getPresidentName()  public view returns(string memory, address){
        return (members[0].name, members[0].addr);
    }
    
    function registerObject(string memory _ObjectName) public {
        require(members[memberList[msg.sender]].addr == msg.sender);
        members[memberList[msg.sender]].ObjectID[members[memberList[msg.sender]].ObjectNum] = _ObjectName;
        members[memberList[msg.sender]].ObjectNum++;
        
    }
    
    function getObjectName(uint _ObjectID) public view returns(string memory, string memory){
        require(members[memberList[msg.sender]].addr == msg.sender);
        require(_ObjectID < members[memberList[msg.sender]].ObjectNum);
        return (members[memberList[msg.sender]].name, members[memberList[msg.sender]].ObjectID[_ObjectID]);
    }
    
    function authorization(address _Other, uint _ObjectID) public{
        require(members[memberList[msg.sender]].addr == msg.sender);
        require(_ObjectID < members[memberList[msg.sender]].ObjectNum);
        members[memberList[msg.sender]].Authorizations[_Other][_ObjectID] = true;
    }
    
    function getOthersObjectName(address _Other, uint _ObjectID) public view returns(string memory, string memory, string memory){
        require(_ObjectID < members[memberList[_Other]].ObjectNum);
        require(members[memberList[_Other]].Authorizations[_Other][_ObjectID] == true);
        return(members[memberList[msg.sender]].name, members[memberList[_Other]].name, members[memberList[_Other]].ObjectID[_ObjectID]);
        
    }
}

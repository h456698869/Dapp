pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Data_sharing.sol";

contract TestData_sharing{
 // The address of the data_sharing contract to be tested
 	

 	Data_sharing data_sharing = Data_sharing(DeployedAddresses.Data_sharing());

 	// test add President function
	function testaddPresidentName() public {

  		data_sharing.addPresident("henry");
  		(uint President_id, string memory President, address President_addr, uint President_ObjectNum) = data_sharing.members(0);
  		Assert.equal( 0, President_id , "President ID is 0.");
  		Assert.equal( "henry", President, "Name is setting to henry.");
 

	}
	function testjoinmember() public {
		data_sharing.addPresident("henry");
		data_sharing.joinMember("Mary");
		
  		(uint Member_id, string memory Member_name, address Member_addr, uint Member_ObjectNum) = data_sharing.members(data_sharing.membersCount()-1);
		Assert.equal( data_sharing.membersCount()-1, Member_id , "members is added");
		Assert.equal( "Mary", Member_name, "Name is setting to Mary.");
	}
}
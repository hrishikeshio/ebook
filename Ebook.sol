contract Ebook{
 	address contractOwner = msg.sender;
 	bool public _success = true;
    struct bookOwner{
        address addr;
    }
	mapping(bytes32 => bookOwner) public ownership;

	function Ebook() noether
	{
	}
    modifier noether { if (msg.value > 0) throw; _ }

	function register (bytes32 identity) noether public returns (bool _success)
	{
		
		if(ownership[identity].addr!=0)
		{
		    throw;
		}
		ownership[identity]=bookOwner(msg.sender);	
	}
	
	function transfer(bytes32 identity,address reciever) noether public returns (bool _success)
	{   
	    if(ownership[identity].addr!=msg.sender)
	    {
	        throw;
	    }
	    ownership[identity]=bookOwner(reciever);
	}

	function checkOwnership(bytes32 identity) constant returns (address) 
	{
		return ownership[identity].addr;
	}

}
contract Ebook{
 	address contractOwner = msg.sender;
    struct bookOwner{
        address addr;
    }
	mapping(bytes32 => bookOwner) public ownership;

	function Ebook() noether
	{
	}
    modifier noether { if (msg.value > 0) throw; _ }
	function register (string ISBN, string seriall) noether
	{
		var identity=sha3(ISBN, seriall);
    	
		if(ownership[identity].addr!=0)
		{
		    throw;
		}
		ownership[identity]=bookOwner(msg.sender);	
	}
	
	function transfer(bytes32 identity,address reciever) noether
	{   
	    if(ownership[identity].addr!=msg.sender)
	    {
	        throw;
	    }
	    ownership[identity]=bookOwner(reciever);
	}

	function checkOwnership(bytes32 identity) noether returns (address owner) 
	{
		return ownership[identity].addr;
	}

}
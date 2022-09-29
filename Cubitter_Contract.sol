// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Cubits {
    address public owner;
    uint256 private counter;

    constructor() { 
    counter = 0;
    owner = msg.sender;  
    
    }
        struct  cubits {
        address cubitter;
        uint256 id;
        string cubitsTxt;
        string cubitsImg;
    }
              
        event cubitsCreated (
        address cubitter,
        uint256 id,
        string cubitsTxt,
        string cubitsImg
   );

    mapping(uint256 => cubits) Cubitss;

    function addcubits(
    string memory cubitsTxt,
    string memory cubitsImg
) 

public payable {
    require(msg.value == (1 ether), "Lutfen 1 Cuberium Coin Gonderin");
    cubits storage newCubits = Cubitss[counter];
    newCubits.cubitsTxt = cubitsTxt;
    newCubits.cubitsImg = cubitsImg;
    newCubits.cubitter = msg.sender;
    newCubits.id = counter;

    emit cubitsCreated(
          msg.sender,
          counter,
          cubitsTxt,
          cubitsImg);

    counter++;
     payable(owner).transfer(msg.value);
}

        function getCubits(uint256 id) public view returns(

            string memory,
            string memory,
            address
        ){
            require(id < counter, "Oyle bir cubit yok");
            cubits storage c = Cubitss[id];
            return(c.cubitsTxt,c.cubitsImg,c.cubitter);
        }
}

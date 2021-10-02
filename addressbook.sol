// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

//Essentially we want an address book that contains a list of addresses
// but since we don't want the addresses to be public we will map them
// to names(aliases) then host the aliases



contract AddressBook {
//map an address onto an address book(or list)
 mapping(address => address[]) private _addresses;
 
 //map an address to an address book that has been mapped to a string(the alias)
  
  mapping(address => mapping(address => string)) private _aliases;
  
  //function to get the addresses in mapping using an address input
  
  function getAddressArray(address addr) public view returns(address[] memory) {
      return _addresses[addr];
  }
  
  //Adding an address to the address book using push 
  //Giving the added address an alias
  
  function addAddress(address addr, string memory alia) public {
      _addresses[msg.sender].push(addr);
      _aliases[msg.sender][addr] = alia;
  }
  
  //function to remove address and replace it with default 0 then reorganize the Map array 
  
  function removeAddresss(address addr) public {
      
      uint length = _addresses[msg.sender].length;
      
      for(uint i = 0; i < length; i++) {
        
        //check if the address input matches any in the senders address book
        
       if(addr == _addresses[msg.sender][i]) { 
         
         //Check whether the address book has more than one address 
         //&& if the address we are looking for is the last in the array
         
           if(1 < _addresses[msg.sender].length && i < length - 1) {
            
            //shift the last item to the place of the item we want to remove 
            
            _addresses[msg.sender][i] = _addresses[msg.sender][length - 1];
        }
        //delete the last address since you've moved it by equating it the addr
        delete _addresses[msg.sender][length - 1];
        //reduce the number of the array by one
        _addresses[msg.sender].pop();
        //delete the alias for the address you removed(addr)
        delete _aliases[msg.sender][addr];
        break;
        
       }
       
       
          }
  }
          
          function getAlias(address addrowner, address addr) public view returns (string memory) {
        return _aliases[addrowner][addr];
    } 
  }
  
  

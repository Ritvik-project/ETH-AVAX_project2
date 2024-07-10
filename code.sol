// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
contract mytoken is ERC20("mytoken","TT"){
    address owner;
    
    modifier onlyowner{
        require(owner== msg.sender,"only owner can access this function");_;
    }
    function mint(address add,uint amount) public onlyowner{
        require(add!=address(0),"please enter address");
        require(amount !=0,"please enter some amount");
        _mint(add,amount*10**18);
    }
    function setowner(address add) public{
        require(add!=address(0),"please enter the address of the owner");
        owner = add;
    }
    function burn(uint num) public{
        require(num!=0,"please enter some amount");
        _burn(msg.sender,num*10**18);
    }
    function transfertokens(address receiver,uint amount) public{
        require(receiver!=address(0),"please enter the receiver's address");
        require(amount!=0,"please enter some amount");
        require(balanceOf(msg.sender)>=amount,"insufficient balance to transfer");
        amount = amount*10**18;
        _transfer(msg.sender,receiver,amount);
    }
}

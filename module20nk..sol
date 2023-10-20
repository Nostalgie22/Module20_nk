pragma solidity ^0.5.0;

contract JoinSavings{
    address payable accountOne  = 0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb;
    address payable accountTwo  = 0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb;
    address public lastTowithdraw;
    uint lastWithdrawAmount;
    uint contractBalance;


    function withdraw(uint amount, address payable recipient) public {
    require(recipient == accountOne || recipient == accountTwo, "You don't own this account");
    require(address(this).balance >= amount, "Insufficient funds!");
    if (lastTowithdraw != recipient) {
      lastTowithdraw = recipient;
    }
    lastWithdrawAmount = amount;
    contractBalance = address(this).balance - amount;
 return recipient.transfer(amount);
  }
  function deposit() public payable {
    
    contractBalance = address(this).balance;
  }

  function setAccounts (address payable account1,address payable account2 ) public{
        accountOne = account1;
        accountTwo = account2;
  }
  function() external payable {}
}





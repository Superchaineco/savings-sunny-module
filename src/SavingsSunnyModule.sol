// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {ISafe} from "./interfaces/ISafe.sol";
import {Enum} from "./libraries/Enum.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SavingsSunnyModule is Ownable{

  error OperationFailed();

  address public operator;

  modifier isOperator() {
    require(msg.sender == operator, "The sender is not an operator");
    _;
  }

  constructor(address _operator) Ownable(msg.sender){
    operator = _operator;
  }
  
  function executeAutomatedOperation(address account, address to, bytes memory data, uint256 value) public isOperator {

    ISafe safe = ISafe(account);
      bool success = safe.execTransactionFromModule(
      to,
      value,
      data,
      Enum.Operation.DelegateCall
    );

    if (!success) {
      revert OperationFailed();
    }
  }
 
  function setOperator(address _operator) public onlyOwner {
    operator = _operator;
  }

}

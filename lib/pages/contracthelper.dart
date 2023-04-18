import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class ContractHelper {
   Client? httpClient;
  Web3Client? ethClient;

  void initialize(){
      httpClient = Client();
    ethClient = Web3Client('https://sepolia.infura.io/v3/ff7a819830c14331b0ee6c1a5b899efe', httpClient!);
  }

  Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString("assets/abi.json");
  String contract_address = "0x4F4076e3D96eebAFCF3239980854F746A4E26F17";
  final contract = DeployedContract(ContractAbi.fromJson(abi, "SalaryContractAbi"),
      EthereumAddress.fromHex(contract_address));
  return contract;
}

 callFunction(String functionName, List<dynamic> args,
    Web3Client ethClient, String _privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex("f1a8652c9ac420cccd126aeac1ffbea273875ec9bb7823c35687b08dae2a7dc3");
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(functionName);
  var gasPrice=ethClient.getGasPrice();
  var maxGas=ethClient.estimateGas();
  
  final result = await ethClient.sendTransaction(
    
      credentials, 
      Transaction.callContract(maxGas: 300000,gasPrice: EtherAmount.inWei(BigInt.from(300000)),
          contract: contract, function: ethFunction, parameters: args),
      chainId: 11155111,);
  
  log(result.toString());
}

}
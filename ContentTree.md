├─ meta_op
│  ├─ BaseLayer
│  │  ├─ BaseTransfer
│  │  │  ├─ library
│  │  │  │  └─ base64.sol---自主实现部分内容
│  │  │  └─ test
│  │  │     └─ Test_base64.sol---自主实现部分内容
│  │  ├─ Crypto---新增
│  │  │  ├─ Crypto.sol---正在实现sm3和sm2
│  │  │  ├─ LibCryptoHash.sol
│  │  │  ├─ LibDocode.sol---自主实现部分内容
│  │  │  ├─ ShaTest.sol
│  │  │  ├─ VerifySignature.sol
│  │  │  └─ gm
│  │  │     └─ ICrypto.sol
│  │  ├─ DataStructure---新增
│  │  │  ├─ LibDeque.sol
│  │  │  ├─ LibQueue.sol
│  │  │  ├─ LibStack.sol
│  │  │  ├─ heap
│  │  │  │  ├─ LibMaxHeapUint256.sol
│  │  │  │  └─ LibMinHeapUint256.sol
│  │  │  ├─ list
│  │  │  │  ├─ LibLinkedList.sol
│  │  │  │  └─ LibSingleList.sol
│  │  │  ├─ map
│  │  │  │  ├─ LibBytesMap.sol
│  │  │  │  └─ LibBytesMapDemo.sol
│  │  │  ├─ merkle_tree
│  │  │  │  ├─ LibMerkleTree.sol
│  │  │  │  └─ MerkleTreeDemo.sol
│  │  │  ├─ set
│  │  │  │  ├─ AddressSetDemo.sol
│  │  │  │  ├─ Bytes32SetDemo.sol
│  │  │  │  ├─ LibAddressSet.sol
│  │  │  │  ├─ LibBytes32Set.sol
│  │  │  │  ├─ LibUint256Set.sol
│  │  │  │  └─ Uint256SetDemo.sol
│  │  │  └─ table
│  │  │     ├─ DataTable.sol
│  │  │     ├─ Map.sol
│  │  │     └─ StudentsGradesDemo.sol
│  │  ├─ Introspection--新增
│  │  │  ├─ ERC165.sol
│  │  │  ├─ ERC165Checker.sol
│  │  │  └─ IERC165.sol
│  │  ├─ SafeMathOperation
│  │  │  ├─ library
│  │  │  │  ├─ FloatMath.sol---新增+自主实现
│  │  │  │  └─ IntMath.sol---自主实现部分内容
│  │  │  └─ test
│  │  │     └─ Test_Math.sol---自主实现部分内容
│  │  └─ TransferOperation
│  │     ├─ library
│  │     │  └─ SafeERC20.sol
│  │     └─ test
│  │        └─ SafeERC20Test.sol
│  ├─ BusinessLayer---新增
│  │  ├─ Bill
│  │  │  ├─ BillController.sol
│  │  │  ├─ service
│  │  │  │  ├─ BillStorage.sol
│  │  │  │  └─ MapStorage.sol
│  │  │  └─ utils
│  │  │     ├─ Console.sol
│  │  │     ├─ LibString.sol
│  │  │     ├─ Ownable.sol
│  │  │     └─ Table.sol
│  │  ├─ RedPacket
│  │  │  └─ RedPacket.sol---自主实现
│  │  ├─ SupplyChain
│  │  │  └─ Supplychain.sol
│  │  └─ Traceability
│  │     ├─ Goods.sol
│  │     ├─ Traceability.sol
│  │     └─ TraceabilityFactory.sol
│  ├─ InterfaceLayer---新增
│  │  ├─ Manage
│  │  │  ├─ ERC1967
│  │  │  │  ├─ ERC1967Proxy.sol
│  │  │  │  ├─ ERC1967Utils.sol
│  │  │  │  └─ IERC1967.sol
│  │  │  ├─ IERC1822.sol
│  │  │  ├─ IERC5313.sol
│  │  │  └─ ISing.sol
│  │  ├─ Verify
│  │  │  ├─ IERC1271.sol
│  │  │  └─ IERC5267.sol
│  │  └─ BillQuery---自主实现
│  │     └─ bill.sol
│  ├─ MiddlewareLayer
│  │  ├─ AccessControl
│  │  │  ├─ 合约所有权转移
│  │  │  │  ├─ abstractContract
│  │  │  │  │  └─ contractOwnshipCtrl.sol
│  │  │  │  └─ test
│  │  │  │     └─ testContractCtrl.sol
│  │  │  ├─ 外部合约调用
│  │  │  │  ├─ library
│  │  │  │  │  └─ callContract.sol
│  │  │  │  ├─ readme.txt
│  │  │  │  └─ test
│  │  │  │     ├─ deployedContract.sol
│  │  │  │     └─ testCallContract.sol
│  │  │  ├─ 登录注册
│  │  │  │  ├─ library
│  │  │  │  │  └─ UserRegistryLibrary.sol
│  │  │  │  └─ test
│  │  │  │     └─ test2.sol
│  │  │  ├─ 访问控制
│  │  │  │  ├─ library
│  │  │  │  │  └─ AddressRegistry.sol
│  │  │  │  └─ test
│  │  │  │     └─ test1.sol
│  │  │  └─ 身份管理
│  │  │     ├─ library
│  │  │     │  └─ IdentityManger.sol
│  │  │     └─ test
│  │  │        └─ testIdentityMan.sol
│  │  ├─ BasicControl---新增
│  │  │  ├─ Context
│  │  │  │  └─ Context.sol---自主实现
│  │  │  ├─ Counter
│  │  │  │  ├─ CombinedCounter.sol---自主实现
│  │  │  │  └─ SimpleCounter.sol
│  │  │  ├─ FuncControl
│  │  │  │  ├─ FuncCallContract.sol---自主实现部分内容
│  │  │  │  ├─ InternalFunction.sol---自主实现部分内容
│  │  │  │  └─ Ownable.sol
│  │  │  └─ Proxy
│  │  │     ├─ Address.sol
│  │  │     ├─ Clones.sol
│  │  │     ├─ Proxy.sol
│  │  │     ├─ Sing.sol
│  │  │     ├─ SingProxy.sol
│  │  │     ├─ StorageSlot.sol
│  │  │     ├─ Upgrade
│  │  │     │  ├─ ProxyAdmin.sol
│  │  │     │  └─ TransparentUpgradeableProxy.sol
│  │  │     └─ beacon
│  │  │        ├─ BeaconProxy.sol
│  │  │        ├─ IBeacon.sol
│  │  │        └─ UpgradeableBeacon.sol
│  │  └─ ObjectControl
│  │     ├─ library
│  │     │  └─ Object_library.sol
│  │     └─ test
│  │        └─ test.sol
│  ├─ ContentTree.md
│  └─ Readme_wyh.md
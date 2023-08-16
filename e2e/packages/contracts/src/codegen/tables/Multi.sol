// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Multi")));
bytes32 constant MultiTableId = _tableId;

struct MultiData {
  int256 num;
  bool value;
}

library Multi {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.INT256;
    _schema[1] = SchemaType.BOOL;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](4);
    _schema[0] = SchemaType.UINT32;
    _schema[1] = SchemaType.BOOL;
    _schema[2] = SchemaType.UINT256;
    _schema[3] = SchemaType.INT120;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](2);
    _fieldNames[0] = "num";
    _fieldNames[1] = "value";
    return ("Multi", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get num */
  function getNum(uint32 a, bool b, uint256 c, int120 d) internal view returns (int256 num) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getSchema());
    return (int256(uint256(Bytes.slice32(_blob, 0))));
  }

  /** Get num (using the specified store) */
  function getNum(IStore _store, uint32 a, bool b, uint256 c, int120 d) internal view returns (int256 num) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getSchema());
    return (int256(uint256(Bytes.slice32(_blob, 0))));
  }

  /** Set num */
  function setNum(uint32 a, bool b, uint256 c, int120 d, int256 num) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((num)), getSchema());
  }

  /** Set num (using the specified store) */
  function setNum(IStore _store, uint32 a, bool b, uint256 c, int120 d, int256 num) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((num)), getSchema());
  }

  /** Get value */
  function getValue(uint32 a, bool b, uint256 c, int120 d) internal view returns (bool value) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1, getSchema());
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get value (using the specified store) */
  function getValue(IStore _store, uint32 a, bool b, uint256 c, int120 d) internal view returns (bool value) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1, getSchema());
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set value */
  function setValue(uint32 a, bool b, uint256 c, int120 d, bool value) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((value)), getSchema());
  }

  /** Set value (using the specified store) */
  function setValue(IStore _store, uint32 a, bool b, uint256 c, int120 d, bool value) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((value)), getSchema());
  }

  /** Get the full data */
  function get(uint32 a, bool b, uint256 c, int120 d) internal view returns (MultiData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, uint32 a, bool b, uint256 c, int120 d) internal view returns (MultiData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(uint32 a, bool b, uint256 c, int120 d, int256 num, bool value) internal {
    bytes memory _data = encode(num, value);

    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getSchema());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, uint32 a, bool b, uint256 c, int120 d, int256 num, bool value) internal {
    bytes memory _data = encode(num, value);

    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    _store.setRecord(_tableId, _keyTuple, _data, getSchema());
  }

  /** Set the full data using the data struct */
  function set(uint32 a, bool b, uint256 c, int120 d, MultiData memory _table) internal {
    set(a, b, c, d, _table.num, _table.value);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, uint32 a, bool b, uint256 c, int120 d, MultiData memory _table) internal {
    set(_store, a, b, c, d, _table.num, _table.value);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (MultiData memory _table) {
    _table.num = (int256(uint256(Bytes.slice32(_blob, 0))));

    _table.value = (_toBool(uint8(Bytes.slice1(_blob, 32))));
  }

  /** Tightly pack full data using this table's schema */
  function encode(int256 num, bool value) internal pure returns (bytes memory) {
    return abi.encodePacked(num, value);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(uint32 a, bool b, uint256 c, int120 d) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(uint32 a, bool b, uint256 c, int120 d) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getSchema());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, uint32 a, bool b, uint256 c, int120 d) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    _store.deleteRecord(_tableId, _keyTuple, getSchema());
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}

function _boolToBytes32(bool value) pure returns (bytes32 result) {
  assembly {
    result := value
  }
}

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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("SystemRegistry")));
bytes32 constant SystemRegistryTableId = _tableId;

library SystemRegistry {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](1);
    _fieldNames[0] = "resourceSelector";
    return ("SystemRegistry", _fieldNames);
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

  /** Get resourceSelector */
  function get(address system) internal view returns (bytes32 resourceSelector) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(system)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getSchema());
    return (Bytes.slice32(_blob, 0));
  }

  /** Get resourceSelector (using the specified store) */
  function get(IStore _store, address system) internal view returns (bytes32 resourceSelector) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(system)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getSchema());
    return (Bytes.slice32(_blob, 0));
  }

  /** Set resourceSelector */
  function set(address system, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(system)));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((resourceSelector)), getSchema());
  }

  /** Set resourceSelector (using the specified store) */
  function set(IStore _store, address system, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(system)));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((resourceSelector)), getSchema());
  }

  /** Tightly pack full data using this table's schema */
  function encode(bytes32 resourceSelector) internal pure returns (bytes memory) {
    return abi.encodePacked(resourceSelector);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(address system) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(system)));

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(address system) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(system)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getSchema());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, address system) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160(system)));

    _store.deleteRecord(_tableId, _keyTuple, getSchema());
  }
}

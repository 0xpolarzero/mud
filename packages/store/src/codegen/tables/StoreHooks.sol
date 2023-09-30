// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "../../IStore.sol";
import { StoreSwitch } from "../../StoreSwitch.sol";
import { StoreCore } from "../../StoreCore.sol";
import { Bytes } from "../../Bytes.sol";
import { Memory } from "../../Memory.sol";
import { SliceLib } from "../../Slice.sol";
import { EncodeArray } from "../../tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "../../FieldLayout.sol";
import { Schema, SchemaLib } from "../../Schema.sol";
import { PackedCounter, PackedCounterLib } from "../../PackedCounter.sol";
import { ResourceId } from "../../ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "../../storeResourceTypes.sol";

// Import user types
import { ResourceId } from "./../../ResourceId.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14("store"), bytes16("StoreHooks")))
);
ResourceId constant StoreHooksTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0000000100000000000000000000000000000000000000000000000000000000
);

library StoreHooks {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](1);
    _valueSchema[0] = SchemaType.BYTES21_ARRAY;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "tableId";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "hooks";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get hooks
   */
  function getHooks(ResourceId tableId) internal view returns (bytes21[] memory hooks) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes21());
  }

  /**
   * @notice Get hooks
   */
  function _getHooks(ResourceId tableId) internal view returns (bytes21[] memory hooks) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes21());
  }

  /**
   * @notice Get hooks (using the specified store)
   */
  function getHooks(IStore _store, ResourceId tableId) internal view returns (bytes21[] memory hooks) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = _store.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes21());
  }

  /**
   * @notice Get hooks
   */
  function get(ResourceId tableId) internal view returns (bytes21[] memory hooks) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes21());
  }

  /**
   * @notice Get hooks
   */
  function _get(ResourceId tableId) internal view returns (bytes21[] memory hooks) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes21());
  }

  /**
   * @notice Get hooks (using the specified store)
   */
  function get(IStore _store, ResourceId tableId) internal view returns (bytes21[] memory hooks) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = _store.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes21());
  }

  /**
   * @notice Set hooks
   */
  function setHooks(ResourceId tableId, bytes21[] memory hooks) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((hooks)));
  }

  /**
   * @notice Set hooks
   */
  function _setHooks(ResourceId tableId, bytes21[] memory hooks) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((hooks)));
  }

  /**
   * @notice Set hooks (using the specified store)
   */
  function setHooks(IStore _store, ResourceId tableId, bytes21[] memory hooks) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    _store.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((hooks)));
  }

  /**
   * @notice Set hooks
   */
  function set(ResourceId tableId, bytes21[] memory hooks) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((hooks)));
  }

  /**
   * @notice Set hooks
   */
  function _set(ResourceId tableId, bytes21[] memory hooks) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((hooks)));
  }

  /**
   * @notice Set hooks (using the specified store)
   */
  function set(IStore _store, ResourceId tableId, bytes21[] memory hooks) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    _store.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((hooks)));
  }

  /**
   * @notice Get length of hooks
   */
  function lengthHooks(ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 21;
    }
  }

  /**
   * @notice Get length of hooks
   */
  function _lengthHooks(ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 21;
    }
  }

  /**
   * @notice Get length of hooks (using the specified store)
   */
  function lengthHooks(IStore _store, ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = _store.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 21;
    }
  }

  /**
   * @notice Get length of hooks
   */
  function length(ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 21;
    }
  }

  /**
   * @notice Get length of hooks
   */
  function _length(ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 21;
    }
  }

  /**
   * @notice Get length of hooks (using the specified store)
   */
  function length(IStore _store, ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = _store.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 21;
    }
  }

  /**
   * @notice Get an item of hooks
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function getItemHooks(ResourceId tableId, uint256 _index) internal view returns (bytes21) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 21, (_index + 1) * 21);
      return (bytes21(_blob));
    }
  }

  /**
   * @notice Get an item of hooks
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function _getItemHooks(ResourceId tableId, uint256 _index) internal view returns (bytes21) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 21, (_index + 1) * 21);
      return (bytes21(_blob));
    }
  }

  /**
   * @notice Get an item of hooks (using the specified store)
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function getItemHooks(IStore _store, ResourceId tableId, uint256 _index) internal view returns (bytes21) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = _store.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 21, (_index + 1) * 21);
      return (bytes21(_blob));
    }
  }

  /**
   * @notice Get an item of hooks
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function getItem(ResourceId tableId, uint256 _index) internal view returns (bytes21) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 21, (_index + 1) * 21);
      return (bytes21(_blob));
    }
  }

  /**
   * @notice Get an item of hooks
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function _getItem(ResourceId tableId, uint256 _index) internal view returns (bytes21) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 21, (_index + 1) * 21);
      return (bytes21(_blob));
    }
  }

  /**
   * @notice Get an item of hooks (using the specified store)
   * @dev (unchecked, returns invalid data if index overflows)
   */
  function getItem(IStore _store, ResourceId tableId, uint256 _index) internal view returns (bytes21) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = _store.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 21, (_index + 1) * 21);
      return (bytes21(_blob));
    }
  }

  /**
   * @notice Push an element to hooks
   */
  function pushHooks(ResourceId tableId, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to hooks
   */
  function _pushHooks(ResourceId tableId, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to hooks (using the specified store)
   */
  function pushHooks(IStore _store, ResourceId tableId, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    _store.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to hooks
   */
  function push(ResourceId tableId, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to hooks
   */
  function _push(ResourceId tableId, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to hooks (using the specified store)
   */
  function push(IStore _store, ResourceId tableId, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    _store.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from hooks
   */
  function popHooks(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 21);
  }

  /**
   * @notice Pop an element from hooks
   */
  function _popHooks(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 21);
  }

  /**
   * @notice Pop an element from hooks (using the specified store)
   */
  function popHooks(IStore _store, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    _store.popFromDynamicField(_tableId, _keyTuple, 0, 21);
  }

  /**
   * @notice Pop an element from hooks
   */
  function pop(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 21);
  }

  /**
   * @notice Pop an element from hooks
   */
  function _pop(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 21);
  }

  /**
   * @notice Pop an element from hooks (using the specified store)
   */
  function pop(IStore _store, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    _store.popFromDynamicField(_tableId, _keyTuple, 0, 21);
  }

  /**
   * @notice Update an element of hooks at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateHooks(ResourceId tableId, uint256 _index, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 21), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of hooks at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function _updateHooks(ResourceId tableId, uint256 _index, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 21), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of hooks (using the specified store) at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateHooks(IStore _store, ResourceId tableId, uint256 _index, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      _store.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 21), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of hooks at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(ResourceId tableId, uint256 _index, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 21), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of hooks at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function _update(ResourceId tableId, uint256 _index, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 21), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of hooks (using the specified store) at `_index`
   * @dev (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(IStore _store, ResourceId tableId, uint256 _index, bytes21 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      _store.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 21), uint40(_encoded.length), _encoded);
    }
  }

  /** Delete all data for given keys */
  function deleteRecord(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /** Delete all data for given keys */
  function _deleteRecord(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /** Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    _store.deleteRecord(_tableId, _keyTuple);
  }

  /** Tightly pack dynamic data using this table's schema */
  function encodeLengths(bytes21[] memory hooks) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(hooks.length * 21);
    }
  }

  /** Tightly pack dynamic data using this table's schema */
  function encodeDynamic(bytes21[] memory hooks) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((hooks)));
  }

  /** Tightly pack full data using this table's field layout */
  function encode(bytes21[] memory hooks) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(hooks);
    bytes memory _dynamicData = encodeDynamic(hooks);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(ResourceId tableId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    return _keyTuple;
  }
}

pragma solidity ^0.4.22;

contract ProofOfExistence {
      // state
      bytes32 public proof;

      // calculate and store the proof for a document
      // *transactional function*
      function notarize(string document) {
        proof = proofFor(document);
      }

      // helper function to get a document's sha256
      // *read-only function*
      function proofFor(string document) view returns (bytes32) {
        return sha256(abi.encodePacked(document));
      }

}
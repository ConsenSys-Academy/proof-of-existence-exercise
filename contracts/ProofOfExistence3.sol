pragma solidity ^0.4.22;


contract ProofOfExistence3 {

  mapping (bytes32 => bool) private proofs;
  
  // store a proof of existence in the contract state
  function storeProof(bytes32 proof) {
    proofs[proof] = true;
  }
  
  // calculate and store the proof for a document
  function notarize(string document) {
    var proof = proofFor(document);
    storeProof(proof);
  }
  
  // helper function to get a document's sha256
  function proofFor(string document) constant returns (bytes32) {
    return sha256(document);
  }
  
  // check if a document has been notarized
  function checkDocument(string document) constant returns (bool) {
    var proof = proofFor(document);
    return hasProof(proof);
  }

  // returns true if proof is stored
  function hasProof(bytes32 proof) constant returns(bool) {
    return proofs[proof];
  }
}

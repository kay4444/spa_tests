pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Asset.sol";
import "../contracts/ERC20.sol";

contract TestAsset {
    // uint contributing = 100;
    // uint cost = 200;
    
    // Check that user has not made any contribution
    function testMyContributionIsZero() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 111, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 200, 1556712588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.equal(asset.getMyContributions(0x31F2ae92057a7123eF0e490A998e90d4C492b1d3), 0, "Contribution is not zero!");
    }
    
    // Check that user has made some contributions
    //function testGetMyContribution() public {
        //Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 111,
        //0x627306090abab3a6e1400e9345bc60c78a8bef57, "MyTitle", 200, 1556712588,
        //0xf17f52151ebef6c7334fad080c5704d77216b732, 111);
        //asset.contribute(0xf17f52151ebef6c7334fad080c5704d77216b732, 0x627306090abab3a6e1400e9345bc60c78a8bef57, 3);
        //Assert.equal(asset.getMyContributions(0x627306090abab3a6e1400e9345bc60c78a8bef57), 3, "Contribution is not zero!");
    //} 
    
    // Contribute in asset
      //function testContribute() public {
        //Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 111,
        //0x627306090abab3a6e1400e9345bc60c78a8bef57, "MyTitle", 200, 1556712588,
       // 0xf17f52151ebef6c7334fad080c5704d77216b732, 111);
       // asset.contribute(0xf17f52151ebef6c7334fad080c5704d77216b732, 0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef, 1);
       // Assert.equal(asset.isFractional(), true, "Contribution is not fractional!");
    //}
  

    // Check if asset is open for contribution 
    function testIsOpenForContribution() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 666, 1556712588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isTrue(asset.isOpenForContribution(1), "Asset is not open for contribution");
    }
    
    // Check if asset is not open for contribution - date is expired
    function testIsOpenForContributionFalseExpiredDate() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 666, 1493640588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isFalse(asset.isOpenForContribution(1), "Asset is open for contribution");
    }
    
    // Check if asset is not open for contribution - amount funded is bigger than total asset cost
    function testIsOpenForContributionFalseOverFunded() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 666, 1556712588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isFalse(asset.isOpenForContribution(777), "Asset is open for contribution");
    }
    
        // Check if asset is not open for contribution - date is expired + amount funded is bigger than total asset cost
    function testIsOpenForContributionFalseOverFundedExpiredDateAndOverFunded() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 666, 1493640588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isFalse(asset.isOpenForContribution(777), "Asset is open for contribution");
    }
    
    // Check that asset has been funded yet
    //function testIsFunded() public {
    //    Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 0,
     //   0x627306090abab3a6e1400e9345bc60c78a8bef57, "MyTitle", 200, 1556712588,
    //    0xf17f52151ebef6c7334fad080c5704d77216b732, 111);
    //    Assert.isTrue(asset.isFunded(), "Asset has not been funded!");
    //}
    
    // Check that asset has not been funded yet
    function testIsNotFunded() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 200, 1556712588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isFalse(asset.isFunded(), "Asset has been funded!");
    }
    
    // Check that asset is not expired
    function testAssetIsNotExpired() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 200, 1556712588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isFalse(asset.isExpired(), "Asset is expired!");
    }
    
    // Check that asset is expired
    function testAssetIsExpired() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 200, 1493640588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isTrue(asset.isExpired(), "Asset is not expired!");
    }
    
    // Check if asset is fractional
    function testAssetIsFractional() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 200, 1556712588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isTrue(asset.isFractional(), "Contribution is not fractional!");
    }
    
    // Check if asset is not fractional
    function testAssetIsNotFractional() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 0, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 200, 1556712588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        Assert.isFalse(asset.isFractional(), "Contribution is fractional!");
    }
    
    // Check calculation of distribution
    function testCalcDistribution() public {
        Asset asset = new Asset(0x31f2ae92057a7123ef0e490a, 1, 0x31F2ae92057a7123eF0e490A998e90d4C492b1d3, "MyTitle", 200, 1556712588, 0xD770D65e08239258c6f5a367Ef53B236840e6F80, 111);
        uint kickbackWitheld;
        uint sellerGets;
        (kickbackWitheld, sellerGets) = asset.calcDistribution();
        Assert.equal(kickbackWitheld, 111, "something wrong!");
        Assert.equal(sellerGets, 89, "something wrong!");
    }

}
const Seller = artifacts.require("Seller");

Buyer_contract("Seller",(accounts)=>
{
    let seller

    before(async()=>
    {
        seller = await Seller.deployed()
    })

    describe("deployment",async () =>
    {
        it("deploys succesfully",async()=>
        {
            const address = await seller.address;
            assert.notEqual(address,0x00);
            assert.notEqual(address,null);
            assert.notEqual(address,undefined);
            assert.notEqual(address," ");
        })
    })
})

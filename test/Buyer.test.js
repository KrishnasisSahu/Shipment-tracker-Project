const Buyer = artifacts.require("Buyer");

Buyer_contract("Buyer",(accounts)=>
{
    let buyer

    before(async()=>
    {
        buyer = await Buyer.deployed()
    })

    describe("deployment",async () =>
    {
        it("deploys succesfully",async()=>
        {
            const address = await buyer.address;
            assert.notEqual(address,0x00);
            assert.notEqual(address,null);
            assert.notEqual(address,undefined);
            assert.notEqual(address," ");
        })
    })
})

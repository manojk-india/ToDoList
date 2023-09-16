
async function main() {
    const mytodolist = await ethers.getContractFactory("mytodolist");

    // Start deployment, returning a promise that resolves to a contract object
    const mytodolist_ = await mytodolist.deploy();
    console.log("Contract address:", mytodolist_.address);


}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
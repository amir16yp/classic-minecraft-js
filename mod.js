// to be used with experimental.patch

var blockcounter = 40;

var blocks = [];

function createBlock(texture) {
  window.mcmod.api2.registry.registerMaterial(texture, null, "modded/" + texture + ".png");
  blockid = window.mcmod.api2.registry.registerBlock(blockcounter, {
    material: texture,
    solid: true,
  });
  blockcounter += 2; // adding just 1 makes it spawn water when you break the block for some reason 
  console.log("Custom Block: " + blockid);
  return blockid;
}

window.mcmod = {
  api1: null,
  api2: null,
  registerBlocks: function () {
    return [
      createBlock("diamond_block"), // you can extract these assets from
      createBlock("slime_block") // https://mcasset.cloud/1.20.6/assets/minecraft/textures/block
    ];
  },
  commandArray: [
    {
      command: "/setblock",
      func: function (args) {
        if (args.length == 1) {
          window.mcmod.hackj = !window.mcmod.hackj;
          return "use custom block set to " + window.mcmod.hackj.toString();
        } else if (args.length == 2) {
          var j = parseInt(args[1]);
          if (isNaN(j) || j <= 0) {
            return "invalid number";
          }
          window.mcmod.j = j - 1;
          return "j set to " + args[1].toString(); // Show the original value
        }
        return args.length.toString();
      },
    },
  ],
  hackj: false,
  j: 39,
};

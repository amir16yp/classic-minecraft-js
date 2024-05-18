commandArray = [
  {
    command: "/useblock",
    func: function (args) {
      window.mcmod.hackJ = !window.mcmod.hackJ;
      return "using custom blocks set to " + window.mcmod.hackJ;
    }
  },
  {
    command: "/hi",
    func: function (args) {
      return "Hello World, " + args[1] + "!";
    }
  }
];

function registerBlocks() {
  // must return an array with all of your block IDs. a block id is returned when registering a block with `window.mcmod.mc.registry.regsiterBlock`
  window.mcmod.mc.registry.registerMaterial("white", null, "white.png"); // if you need a custom texture you'll need to register a material and put the texture in assets/textures/
  whiteID = window.mcmod.mc.registry.registerBlock(41, {
    material: "white",
    solid: !0,
  });
  return [whiteID];
}

window.mcmod = {
  commandArray: commandArray,
  blocks: registerBlocks,
  hackJ: false, // hijacking the block placement to place any block
  newJ: 0,
  mc: null, // API endpoint 1
};

// ignore this for now
function showCurrentBlockIndex() {
  var j = window.mcmod.newJ;
  ///window.mcmod.mc_more.player.network.sendMessage("set block j to " + j.toString());
}

// there probably is a better of doing this, but currently if useblock is enabled,
// you can control which block is placed by using the up and down arrow keys.

document.addEventListener("keydown", function (event) {
  if (!window.mcmod.hackJ) {
    return;
  }
  if (event.key === "ArrowUp") {
    window.mcmod.newJ++;
  } else if (event.key === "ArrowDown") {
    window.mcmod.newJ--;
    if (window.mcmod.newJ <= -1) {
      window.mcmod.newJ = 0;
    }
  }
});

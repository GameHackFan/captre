class ROMService
{
  constructor()
  {
    this.rom = null;
    this.generatedROM = null;
    this.romReady = false;
  }

  applyOverwritePatch = (patch) =>
  {
    let fileBytes = this.generatedROM[patch.filename];

    if(fileBytes)
    {
      let isHex = patch.byteFormat === "hex";

      Object.keys(patch.data).forEach((dataKey) => 
      {
        let index = parseInt(dataKey);

        if(!isNaN(index))
        {
          let nbs = patch.data[dataKey];

          for(let i = 0; i < nbs.length; i++)
            fileBytes[index + i] = isHex ? parseInt(nbs[i], 16) : nbs[i];
        }
      });
    }
  }

  applyPatch = (patch) =>
  {
    if(patch.type === "build")
      this.applyBuildPatch(patch);
    else if(patch.type === "overwrite")
      this.applyOverwritePatch(patch);
  }

  applyPatches = (patches) =>
  {
    Object.keys(patches).forEach((field) =>
    {
      this.applyPatch(patches[field]);
    });
  }

  convertHexArrayToByteArray = (hexArray) =>
  {
    let byteArray = new Array();

    for(let i = 0; i < hexArray.length; i++)
      byteArray.push(parseInt(hexArray[i], 16));

    return byteArray;
  }

  convertNumberToROMBytes = (number, byteAmount) =>
  {
    let bytes = new Array();
    let hex = (number >>> 0).toString(16);

    if(number > -1)
    {
      hex = "0".repeat((2 * byteAmount) - hex.length) + hex;
      
      for(let i = 0; i < byteAmount; i++)
        bytes[i] = hex.slice(i * 2, (i + 1) * 2);
      
      bytes.reverse();
    }
    else
    {
      let startIndex = hex.length - (byteAmount * 2);
      let hexChars = hex.substring(startIndex, hex.length);

      for(let i = 0; i < byteAmount; i++)
      {
        let index = i * 2;
        bytes[i] = hexChars[index] + hexChars[index + 1];
      }
    }

    return bytes;
  }

  convertStringToROMBytes = (text) =>
  {
    let bytes = [];

    for(let i = 0; i < text.length - 1; i += 2)
    {
      bytes.push(text.charCodeAt(i + 1).toString(16));
      bytes.push(text.charCodeAt(i).toString(16));
    }

    return bytes;
  }

  cloneROM = () =>
  {
    this.generatedROM = {};
    Object.keys(this.rom).forEach((e) =>
    {
      this.generatedROM[e] = this.rom[e].slice();
    });
    this.mergeFiles();
    this.renameFiles();
  }
  
  setROM = (rom) =>
  {
    this.rom = rom;
  }

  getGeneratedROM = () =>
  {
    return this.generatedROM;
  }

  getBytesAsDecimal = (bytes, byteFormat) =>
  {
    return byteFormat === "hex" ?
        this.convertHexArrayToByteArray(bytes) : bytes;
  }

  setByte = (filename, byteIndex, value) =>
  {
    let fileBytes = this.generatedROM[filename];

    if(fileBytes && !isNaN(value) && value > -1 && value < 256)
      fileBytes[byteIndex] = value;
  }

  setHexByte = (filename, byteIndex, value) =>
  {
    let fix = parseInt(value, 16);
    this.setByte(filename, byteIndex, fix);
  }

  setBytes = (filename, byteIndex, bytes, byteFormat) =>
  {
    if(byteIndex > -1)
    {
      let fbs = this.getBytesAsDecimal(bytes, byteFormat);
      let fileBytes = this.generatedROM[filename];
      fbs.forEach((byte, index) => fileBytes[byteIndex + index] = byte);
    }
  }

  getByte = (filename, byteIndex) =>
  {
    return this.getFileBytes(filename)[byteIndex];
  }

  getBytes = (filename, byteIndex, amount) =>
  {
    return this.getFileBytes(filename).slice(byteIndex, byteIndex + amount);
  }

  indexOfBytes = (filename, bytes, byteFormat, startIndex) =>
  {
    let fileBytes = this.generatedROM[filename];

    if(fileBytes)
    {
      let fbs = this.getBytesAsDecimal(bytes, byteFormat);
      let checkBytes = (element, index, romBytes) =>
      {
        for(let i = 0; i < fbs.length; i++)
        {
          if(fbs[i] !== romBytes[index + i])
            return false;
        }
        
        return true;
      };
      return fileBytes.findIndex(checkBytes, startIndex);
    }

    return -1;
  }

  mergeFiles = () =>
  {
    let file23 = this.removeCPUFile(23);
    let file22 = this.removeCPUFile(22);
    let file28 = this.removeCPUFile(28);
    let file24 = this.removeCPUFile(24);
    let blankLength = 786432;

    if(file23 && file22 && file28 && file24)
    {
      let byteSwapedFile = this.createByteSwapedFile(file28, file24);
      this.generatedROM["cce_re.10f"] = [].concat(file23).concat(file22).
          concat(byteSwapedFile).concat(Array(blankLength).fill(0));
    }
    else
      throw new Error("The ROM has problems with one of the 4 main CPU files!");
  }

  createByteSwapedFile = (file1, file2) => {
    let newFile = [];
    file1.forEach((byte, index) => {
      newFile.push(file1[index]);
      newFile.push(file2[index]);
    })
    return newFile;
  }

  renameFiles = () =>
  {
    let fileType1 = ["cc-1m.4a", "cc-2m.8a", "cc-3m.6a",
        "cc-4m.10a", "cc-5m.3a", "cc-6m.7a", "cc-7m.5a", "cc-8m.9a"];
    let fileType2 = ["gfx_02.rom", "gfx_06.rom", "gfx_04.rom",
        "gfx_08.rom", "gfx_01.rom", "gfx_05.rom", "gfx_03.rom", "gfx_07.rom"];
    let newType = ["cc-1re.4a", "cc-2re.8a", "cc-3re.6a",
        "cc-4re.10a", "cc-5re.3a", "cc-6re.7a", "cc-7re.5a", "cc-8re.9a"];

    for(let i = 0; i < fileType1.length; i++)
    {
      let file = this.generatedROM[fileType1[i]];
      file = file ? file : this.generatedROM[fileType2[i]];
      delete this.generatedROM[fileType1[i]];
      delete this.generatedROM[fileType2[i]];

      if(!file)
        throw new Error("The ROM has problems with one of the 8 main graphic files!");

      this.generatedROM[newType[i]] = file;
    }
  }

  removeCPUFile = (id) =>
  {
    const prefix = {22: "cc_22", 23: "cce_23", 24: "cc_24", 28: "cc_28"};
    const sufix = {22: "7f", 23: "8f", 24: "9e", 28: "9f"};
    const lengths = {22: 524288, 23: 524288, 24: 131072, 28: 131072};
    let cpuFile;
    let names =
    [
      prefix[id] + "d.rom",
      prefix[id] + "d.bin",
      prefix[id] + "d." + sufix[id],
      prefix[id] + "f." + sufix[id]
    ];
    names.forEach((name) => 
    {
      cpuFile = cpuFile ? cpuFile : this.generatedROM[name];
      delete this.generatedROM[name];
    });

    return (cpuFile && cpuFile.length === lengths[id]) ? cpuFile : null;
  }

  getFileBytes = (filename) =>
  {
    let gr = this.generatedROM ? this.generatedROM : {};
    let fileBytes = gr[filename];
    return fileBytes ? fileBytes : [];
  }
}


let romService = new ROMService();
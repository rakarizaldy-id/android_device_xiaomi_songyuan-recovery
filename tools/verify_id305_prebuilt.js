#!/usr/bin/env node
"use strict";
// Ensure DT original binary members and manifest remain pinned to native Songyuan ID305.
const fs=require("node:fs"),path=require("node:path"),crypto=require("node:crypto");
const root=path.resolve(__dirname,".."),dir=path.join(root,"prebuilt");
const mf=path.join(dir,"curated-manifest.json");
const yes=(v,s)=>{if(!v)throw Error(s)};
const sha=x=>crypto.createHash("sha256").update(x).digest("hex");
yes(fs.existsSync(mf),"Songyuan ID305 manifest missing");
const raw=fs.readFileSync(mf);
yes(sha(raw)==="d1eeb419dbcc7593a1b5d72fc5d66f783341b6b5dcdd11f42d27e3a852bc1fc2","Pinned Songyuan ID305 manifest was altered");
const m=JSON.parse(raw.toString("utf8")),files=Object.entries(m.files);
yes(m.device==="songyuan"&&m.source_firmware==="OS3.0.305.0.WGNIDXM","Unexpected OEM identity");
yes(m.file_count===162&&m.module_count===73&&files.length===162,"Unexpected OEM manifest counts");
const expected=new Set(["curated-manifest.json"]);let bytes=0,modules=0;
for(const [rel,entry] of files){
 yes(rel==="kernel"||/^(vendor|odm|vendor_dlkm)\/[A-Za-z0-9_./@+-]+$/.test(rel),"Forbidden member: "+rel);
 yes(!rel.includes("..")&&!rel.toLowerCase().includes("nezha")&&rel.split("/").every(Boolean),"Unsafe/foreign member: "+rel);
 yes(!expected.has(rel),"Duplicate member: "+rel);
 expected.add(rel);
 const p=path.resolve(dir,...rel.split("/"));
 yes(p.startsWith(dir+path.sep)&&fs.lstatSync(p).isFile()&&!fs.lstatSync(p).isSymbolicLink(),"Missing/invalid original: "+rel);
 const content=fs.readFileSync(p);
 yes(content.length===entry.bytes&&sha(content)===entry.sha256,"ID305 OEM byte mismatch: "+rel);
 bytes+=content.length;if(rel.endsWith(".ko"))modules++;
}
yes(modules===73&&bytes===116231372,"Non-ID305 module/payload totals");
const kernel=fs.readFileSync(path.join(dir,"kernel"));
yes(kernel.length===42097152&&kernel.subarray(0x38,0x3c).toString("hex")==="41524d64","Original ARM64 kernel magic/size wrong");
const found=[];function walk(p){for(const ent of fs.readdirSync(p,{withFileTypes:true})){
 const f=path.join(p,ent.name);yes(!ent.isSymbolicLink(),"Unexpected symlink "+f);
 if(ent.isDirectory())walk(f);else {yes(ent.isFile(),"Nonregular OEM member "+f);found.push(path.relative(dir,f).split(path.sep).join("/"));}
}}
walk(dir);for(const x of found)yes(expected.has(x),"Extra unverified OEM member "+x);
yes(found.length===expected.size,"Source set is incomplete");
const dev=fs.readFileSync(path.join(root,"device.mk"),"utf8");
for(const p of ["prebuilt/vendor","prebuilt/odm","prebuilt/vendor_dlkm"])yes(dev.includes(p),"Copy map missing "+p);
yes(fs.readFileSync(path.join(root,"BoardConfig.mk"),"utf8").includes("$(DEVICE_PATH)/prebuilt/kernel"),"Stock kernel definition absent");
console.log("PASS original Songyuan ID305 OEM: 162 SHA256 verified, 73 original modules, 116231372 bytes, no foreign paths.");

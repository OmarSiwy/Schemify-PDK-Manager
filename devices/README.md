# devices: copies of Schemify's core MOS symbols

`nmos4.shprim` and `pmos4.shprim` from Schemify's `devices/` at rev
df18b211f18d7263e59d579e13df96d265ea4012. Generated `tech:` device cells take their pins and
drawing from these byte for byte (`src/install.rs`), so a placed `tech:` instance and a direct
`core:` one look and connect alike. When Schemify changes them, copy them again with the
`rev` bump in `Cargo.toml`.

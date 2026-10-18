# devices: copies of Schemify's core MOS symbols

`nmos4.shprim` and `pmos4.shprim` from Schemify's `crates/doc/devices/` at rev
7a37e03be23fbc3fb743fa53c6430e7ab77941a0. Generated `tech:` device cells take their pins and
drawing from these byte for byte (`src/install.rs`), so a placed `tech:` instance and a direct
`core:` one look and connect alike. When Schemify changes them, copy them again with the
`rev` bump in `Cargo.toml`.

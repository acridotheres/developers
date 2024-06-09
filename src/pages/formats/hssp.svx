---
name: HSSP
developer: Leonard Lesinski
website: https://github.com/HSSPfile/specification#readme
extensions:
  - hssp
endianness: little
---

## About HSSP

HSSP is being developed as a simple archive format, allowing for the storage of up to 4,294,967,295 (=2^32, the highest possible Uint32 value) files in a single archive.
Every file can be up to 16 exbibytes (2^64 B) in size. In total, the archive can hold up to 64 robibytes (2^86 B) of data, thats why the format is called HSSP (Huge Size Supporting Package). The format is designed to be simple and easy to implement, while still being able to store large amounts of data.

## History of HSSP

HSSP is being developed since March 2023 and receives updates since then. The format is still in development and may change with future updates.

Since version 4 of the format, the format is considered stable and no breaking changes are expected to be made.

Every version uses AES-256 in CBC mode for encryption and MurmurHash3 for hashing.

### Version history

- 1 (2023-03-14): Initial version
- 2 (2023-03-14): Fixed the magic value from `SFA\x00` to `HSSP` (SFA was standing for Secure File Archive, the development name of the format)
- 3 (2023-03-14): File header is now twice as big for no reason

#### Version 4 (2023-07-11)

**Code name:** Indexed (IDXD)

- Added version number to the file header
- Added compression support
- Added file metadata support
- Added a file index to the beginning of the file, was previously inbetween the files
- Added file splitting support
- Removed a so-called "main file" which indicated the most important file in the archive, this has been replaced with an attribute in the file metadata

##### Version 4 & 5 compression codes

| Code | Compression method             |
| ---- | ------------------------------ |
| NONE | No compression, only version 4 |
| LZMA | LZMA                           |
| DFLT | Deflate                        |

#### Version 5 (2023-08-24)

**Code name:** Flagged (FLGD)

- Added flags to make compression, encryption and splitting more safe so the parser doesn't have to guess the settings from hashes

#### Version 6 (2023-08-31)

**Code name:** Separated (SPRD)

- Added file chaining to group files together for better compression and encryption as well as faster access
- Index and files are compressed and encrypted separately
- Added a new format to store the used compression method
- Removed unused flags F9-F24 because they were never used

## Format structure

### Version 1-3

| Offset           | Size             | Type   | Description      |
| ---------------- | ---------------- | ------ | ---------------- |
| 0x00             | 0x40/&#8203;0x80 | Header | File header      |
| 0x40/&#8203;0x80 | ?                | File[] | All stored files |

#### Version 1-3 Header

| Offset | Size             | Type                  | Description                                                                                   |
| ------ | ---------------- | --------------------- | --------------------------------------------------------------------------------------------- |
| 0x00   | 0x04             | String(4)             | Magic value `HSSP`; Version 1: `SFA\x00`                                                      |
| 0x04   | 0x04             | Uint32                | Murmur&shy;Hash3 hash of the body                                                             |
| 0x08   | 0x04             | Uint32                | Number of files in the archive                                                                |
| 0x0c   | 0x20             | Blob(32)              | Double SHA-256 hash of the password, filled with 32&times;`\x00` if encryption is not enabled |
| 0x2c   | 0x10             | Uint128               | Encryption initialization vector, filled with 16&times;`\x00` if encryption is not enabled    |
| 0x3c   | 0x04             | Uint32                | "Main file" index                                                                             |
| 0x40   | 0x00/&#8203;0x40 | Empty/&#8203;Blob(64) | Nothing, Version 3: just 64 bytes of padding, filled with `\x00`                              |

#### Version 1-3 File

| Offset             | Size | Type         | Description                                                                  |
| ------------------ | ---- | ------------ | ---------------------------------------------------------------------------- |
| 0x00               | 0x08 | Uint64       | File size (= `FS`)                                                           |
| 0x08               | 0x02 | Uint16       | File name length (= `NL`)                                                    |
| 0x0a               | `NL` | String(`NL`) | File name, if starting with `//`, the parser will assume it's a folder       |
| 0x0a + `NL`        | `FS` | Blob(`FS`)   | File contents                                                                |
| 0x0a + `NL` + `FS` | `NL` | Blob(`NL`)   | Padding, filled with `\x00` (this was a bug in the reference implementation) |

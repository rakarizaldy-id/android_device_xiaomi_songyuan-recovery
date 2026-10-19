/*
 * First-party Songyuan TWRP16 recovery compatibility shim (source only).
 *
 * Restores legacy android_memset16 / android_memset32 entrypoints required
 * by source-built libtwrpminui.so. Argument size is BYTE COUNT.
 * Freestanding AArch64 Android source; no foreign donor binary input.
 *
 * Reference compile (from source; not copied V16 binary):
 * clang --target=aarch64-linux-android36 -O2 -fno-vectorize
 *   -fno-slp-vectorize -fno-unroll-loops -fPIC -fvisibility=hidden
 *   -shared -nostdlib -fno-builtin -Wl,-soname,libsongyuan_memset_compat.so
 *   -Wl,--no-undefined -o libsongyuan_memset_compat.so songyuan_memset_compat.c
 *
 * Future IMG assembly must add the output .so to recovery/system/lib64 AND
 * set LD_PRELOAD specifically for the recovery service. Verify linker closure.
 * This file is not a bootability guarantee.
 */
typedef __SIZE_TYPE__ size_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
_Static_assert(sizeof(uint16_t) == 2 && sizeof(uint32_t) == 4,
               "unexpected ABI");

__attribute__((visibility("default")))
void android_memset16(void *dst, uint16_t value, size_t size_in_bytes) {
    uint16_t *ptr = (uint16_t *)dst;
    size_t count = size_in_bytes / sizeof(*ptr);
    for (size_t i = 0; i < count; ++i) ptr[i] = value;
}

__attribute__((visibility("default")))
void android_memset32(void *dst, uint32_t value, size_t size_in_bytes) {
    uint32_t *ptr = (uint32_t *)dst;
    size_t count = size_in_bytes / sizeof(*ptr);
    for (size_t i = 0; i < count; ++i) ptr[i] = value;
}

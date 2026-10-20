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

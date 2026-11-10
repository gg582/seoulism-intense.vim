#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/* * SEOULISM EDGE-CASE TEST 
 * -----------------------
 * Dark (Original): Based on the harmony of Mutual Generation.
 * A fluid hierarchy from Water(BG) to Wood and Fire.
 * Light (Intense): Based on the tension of Mutual Overcoming.
 * A sharp contrast between Metal(BG) and Fire(Red).
 */

#define MAX_BUFFER_SIZE 1024
#define IS_VALID_PTR(p) ((p) != NULL)

typedef struct {
    uint32_t id;
    char *name;
    void (*handler)(int);
} system_node_t;

// Edge Case: Testing nested pointers and complex type casting
void process_raw_data(void **raw_ptr) {
    if (!IS_VALID_PTR(raw_ptr) || !IS_VALID_PTR(*raw_ptr)) {
        fprintf(stderr, "Error: Invalid memory access.\n");
        return;
    }

    uint8_t *byte_data = (uint8_t *)(*raw_ptr);
    for (int i = 0; i < 8; i++) {
        // Testing visibility of bitwise operators and conditional logic
        byte_data[i] = (byte_data[i] ^ 0xFF) << 1;
    }
}

int main(int argc, char *argv[]) {
    // 1. Constants and Types: Highlighting 'Fire Alarm' vs 'Ochre'
    const system_node_t node = {
        .id = 0xDEADBEEF,
        .name = "Seoulism_Core",
        .handler = NULL
    };

    // 2. Pointer Arithmetic: Distinguishing 'Jade' vs 'Muted Blue'
    char *buffer = malloc(MAX_BUFFER_SIZE);
    char *ptr = buffer;

    if (buffer == NULL) return 1;

    // 3. String Literals: Readability of escape sequences and format specifiers
    snprintf(buffer, MAX_BUFFER_SIZE, "Node: %s\tID: %u\n", node.name, node.id);

    while (*ptr != '\0') {
        if (*ptr == '\t') {
            printf("[TAB DETECTED]");
        }
        ptr++;
    }

    free(buffer);
    return 0;
}

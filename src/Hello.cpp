#include <iostream>
#include <vector>
#include <fmt/ranges.h>
#include <folly/hash/Checksum.h>

#include "static/Hello.h"

void Hello::print()
{
    std::vector<int> v = {1, 2, 3};
    fmt::print("{}\n", v);
    fmt::print("{}\n", folly::crc32c_combine(1,2,3));
}

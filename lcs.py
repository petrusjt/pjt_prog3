
def lcs(str1, str2):
    if len(str1) == 0 or len(str2) == 0:
        return 0
    elif str1[0] == str2[0]:
        return 1 + lcs(str1[1:], str2[1:])
    else:
        return max(lcs(str1[1:], str2), lcs(str1, str2[1:]))

def lcs_hash(outer_str1, outer_str2):
    ht = {}
    def lcs(str1, str2):
        if (str1, str2) in ht:
            return ht[(str1, str2)]
        if len(str1) == 0 or len(str2) == 0:
            return 0
        elif str1[0] == str2[0]:
            ht[(str1, str2)] = 1 + lcs(str1[1:], str2[1:])
            return 1 + lcs(str1[1:], str2[1:])
        else:
            ht[str1, str2] = max(lcs(str1[1:], str2), lcs(str1, str2[1:]))
            return max(lcs(str1[1:], str2), lcs(str1, str2[1:]))
    return lcs(outer_str1, outer_str2)


    



print(lcs("bcacbcabbaccbab", "bccabccbbabacbc"))

#print(lcs("abcdefghijklmnopqrstuvwxyz", "a0b0c0d0e0f0g0h0i0j0k0l0m0n0o0p0q0r0s0t0u0v0w0x0y0z0"))

print(lcs_hash("bcacbcabbaccbab", "bccabccbbabacbc"))
print(lcs_hash("abcdefghijklmnopqrstuvwxyz", "a0b0c0d0e0f0g0h0i0j0k0l0m0n0o0p0q0r0s0t0u0v0w0x0y0z0"))
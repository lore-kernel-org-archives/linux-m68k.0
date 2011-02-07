From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: find_next bitops on m68k may cause out of bounds memory access
Date: Mon, 7 Feb 2011 21:37:37 +0900
Message-ID: <AANLkTik00GTZDn=t6J65dHjJiU53M5vXzBqToiYWz33P@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org

find_next bitops on m68k (find_next_zero_bit, find_next_bit, and
ext2_find_next_bit) may cause out of bounds memory access
when the bitmap size in bits % 32 != 0 and offset (the bitnumber
to start searching at) is very close to the bitmap size.

For example,

	unsigned long bitmap[2] = { 0, 0};
	find_next_bit(bitmap, 63, 62)

1. find_next_bit() tries to find any set bits in bitmap[1], but no bits set

2. Then find_first_bit(bimap + 2, -1)

3. Unfortunately find_fist_bit() takes unsigned int as the size argument.

4. find_first_bit will access bitmap[3~] until it find any set bits.

Here is find_next_bit() in arch/m68k/include/asm/bitops_mm.h:

static inline int find_next_bit(const unsigned long *vaddr, int size,
                                int offset)
{
        const unsigned long *p = vaddr + (offset >> 5);
        int bit = offset & 31UL, res;

        if (offset >= size)
                return size;

        if (bit) {
                unsigned long num = *p++ & (~0UL << bit);
                offset -= bit;

                /* Look for one in first longword */
                __asm__ __volatile__ ("bfffo %1{#0,#0},%0"
                                      : "=d" (res) : "d" (num & -num));
                if (res < 32)
                        return offset + (res ^ 31);
                offset += 32;
        }
        /* No one yet, search remaining full bytes for a one */
        res = find_first_bit(p, size - ((long)p - (long)vaddr) * 8);
        return offset + res;
}

find_next_zero_bit and ext2_find_next_bit also have same problem.
Actually I found this while testing ext2_find_next_bit in user space.

The easiest and reliable way to fix this is that switching to generic
implementation of find bitops.

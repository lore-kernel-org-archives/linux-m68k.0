From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Atari ROM port ISA
Date: Sun, 15 Apr 2012 11:34:35 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

	Hi Michael,

arch/m68k/include/asm/io_mm.h:

| #define enec_isa_read_base  0xfffa0000
| #define enec_isa_write_base 0xfffb0000
|
| #define ENEC_ISA_IO_B(ioaddr)   (enec_isa_read_base+((((unsigned long)(ioaddr))&0x1F)<<9))
| #define ENEC_ISA_IO_W(ioaddr)   (enec_isa_read_base+((((unsigned long)(ioaddr))&0x1F)<<9))
| #define ENEC_ISA_MEM_B(madr)    (enec_isa_read_base+((((unsigned long)(madr))&0x1F)<<9))
| #define ENEC_ISA_MEM_W(madr)    (enec_isa_read_base+((((unsigned long)(madr))&0x1F)<<9))

So ISA memory space accesses (isa_readX()) are implemented the same as ISA I/O
space accesses? That can't work. Or are they not supported?

If they're not supported, I think it's better to implement dummies instead.

arch/m68k/include/asm/raw_io.h

| /*
|  * Atari ROM port (cartridge port) ISA adapter, used for the EtherNEC NE2000
|  * network card driver.
|  * The ISA adapter connects address lines A9-A13 to ISA address lines A0-A4,

That's handled via isa_[im]t[bwl](), which uses ENEC_ISA_{IO,MEM}_[BW]
internally. OK

|  * and hardwires the rest of the ISA addresses for a base address of 0x300.
|  *
|  * Data lines D8-D15 are connected to ISA data lines D0-D7 for reading.
|  * For writes, address lines A1-A8 are latched to ISA data lines D0-D7
|  * (meaning the bit pattern on A1-A8 can be read back as byte).

So writes are done using reads.

|  *
|  * Reads and writes are byte only.
|  */

Hence 8-bit access only, ...

|
| #if defined(CONFIG_ATARI_ROM_ISA)
| #define rom_in_8(addr) \
|         ({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
| #define rom_in_be16(addr) \
|         ({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
| #define rom_in_be32(addr) \
|         ({ u32 __v = (*(__force volatile u32 *) (addr)); __v >>= 8; __v; })
| #define rom_in_le16(addr) \
|         ({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
| #define rom_in_le32(addr) \
|         ({ u32 __v = le32_to_cpu(*(__force volatile u32 *) (addr)); __v >>= 8; __v; })

So the above four can't work? Remove them?

| #define rom_out_8(addr, b)      ({u8 __w, __v = (b); __w = ((*(__force volatile u8 *)  ((addr) + 0x10000 + (__v<<1)))); })

The 0x10000 is due to the different bases for reading and writing
(i.e. enec_isa_write_base - enec_isa_read_base), right?

| #define rom_out_be16(addr, w)   ({u16 __w, __v = (w); __w = ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
| #define rom_out_be32(addr, l)   ({u32 __w, __v = (l); __w = ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
| #define rom_out_le16(addr, w)   ({u16 __w, __v = cpu_to_le16(w); __w = ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
| #define rom_out_le32(addr, l)   ({u32 __w, __v = cpu_to_le32(l); __w = ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })

The above four also can't work. Remove them?

| #define raw_rom_inb rom_in_8
| #define raw_rom_inw rom_in_be16
| #define raw_rom_inl rom_in_be32

The above two also can't work. Remove them?

| #define raw_rom_outb(val, port) rom_out_8((port), (val))
| #define raw_rom_outw(val, port) rom_out_be16((port), (val))
| #define raw_rom_outl(val, port) rom_out_be32((port), (val))

The above two also can't work. Remove them?

| #endif /* CONFIG_ATARI_ROM_ISA */

If all of these are removed, the CONFIG_ATARI_ROM_ISA sections in
arch/m68k/include/asm/io_mm.h can be simplified a lot, too.

Does all of this make sense?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

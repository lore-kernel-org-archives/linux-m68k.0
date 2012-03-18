From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: NULL pointer dereference in 3.3-rc6
Date: Sun, 18 Mar 2012 12:35:06 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1203181231530.5031@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>

I got the following while booting 3.3-rc6 on my Amiga A4000/040 (i.e. a
real 68040):

Unable to handle kernel NULL pointer dereference at virtual address   (null)
Oops: 00000000
Modules linked in: autofs4 ipv6 affs dm_snapshot dm_mirror dm_region_hash dm_log dm_mod rtc_rp5c01
PC: [<00005da8>] berr_040cleanup+0x144/0x1be
SR: 2004  SP: 0038bf20  a2: 0066c810
d0: 00000000    d1: 00000040    d2: 00000000    d3: 00000001
d4: 00007008    d5: 0038be48    a0: 0038bf98    a1: 00000000
Process ntpd (pid: 1217, task=0066c810)
Frame format=7 eff addr=0038bf7c ssw=0090 faddr=00000000
wb 1 stat/addr/data: 0090 00000000 00000000
wb 2 stat/addr/data: 0010 00000000 00000000
wb 3 stat/addr/data: 0045 0038bfd2 00000000
push data: 00000000 0000000e 800ab2e8 00000207
Stack from 0038bf88:
        0000ffff 00000007 000026ec 0038bf98 00000003 00000040 00000006 ffffffff
        00000000 00000246 8004f548 80053e9a 00000207 ffffffff 00000000 00098001
        703a7008 fffffffc 800ab2e8 00802c90 002f7f48 effc1d68 0066c810 00000000
        00000000 0066c810 0038be34 0038be34 0066c810 00000000
Call Trace: [<0000ffff>] sto_res+0x4cf/0x4f0
 [<000026ec>] ret_from_signal+0x28/0x2c
 [<00098001>] sys_ustat+0x17/0x76

Code: 6770 123c 0040 b280 6744 4a80 676e 4282 <4e7b> 3000 4e7b 3001 4a82 6746 2028 004c 3228 003c 2140 0040 0241 00ff 3141 0038

00005c64 <berr_040cleanup>:
    5c64:       2f03            movel %d3,%sp@-
    5c66:       2f02            movel %d2,%sp@-
    5c68:       206f 000c       moveal %sp@(12),%a0
    5c6c:       0268 fffb 003c  andiw #-5,%a0@(60)
    5c72:       0268 fffb 003a  andiw #-5,%a0@(58)
    5c78:       4281            clrl %d1
    5c7a:       3228 003c       movew %a0@(60),%d1
    5c7e:       7067            moveq #103,%d0
    5c80:       4600            notb %d0
    5c82:       c081            andl %d1,%d0
    5c84:       0c80 0000 0080  cmpil #128,%d0
    5c8a:       6700 00ec       beqw 5d78 <berr_040cleanup+0x114>
    5c8e:       4282            clrl %d2
    5c90:       4280            clrl %d0
    5c92:       3028 003a       movew %a0@(58),%d0
    5c96:       4a00            tstb %d0
    5c98:       6c00 0092       bgew 5d2c <berr_040cleanup+0xc8>
    5c9c:       4a82            tstl %d2
    5c9e:       6600 0094       bnew 5d34 <berr_040cleanup+0xd0>
    5ca2:       2228 0048       movel %a0@(72),%d1
    5ca6:       2268 0044       moveal %a0@(68),%a1
    5caa:       4e7a 2001       movec %dfc,%d2
    5cae:       4e7b 0000       movec %d0,%sfc
    5cb2:       4e7b 0001       movec %d0,%dfc
    5cb6:       7660            moveq #96,%d3
    5cb8:       c083            andl %d3,%d0
    5cba:       163c 0020       moveb #32,%d3
    5cbe:       b680            cmpl %d0,%d3
    5cc0:       6700 009a       beqw 5d5c <berr_040cleanup+0xf8>
    5cc4:       163c 0040       moveb #64,%d3
    5cc8:       b680            cmpl %d0,%d3
    5cca:       6700 0110       beqw 5ddc <berr_040cleanup+0x178>
    5cce:       4a80            tstl %d0
    5cd0:       6700 0130       beqw 5e02 <berr_040cleanup+0x19e>
    5cd4:       4280            clrl %d0
    5cd6:       4e7b 2000       movec %d2,%sfc
    5cda:       4e7b 2001       movec %d2,%dfc
    5cde:       4a80            tstl %d0
    5ce0:       6700 008e       beqw 5d70 <berr_040cleanup+0x10c>
    5ce4:       2028 0044       movel %a0@(68),%d0
    5ce8:       3228 003a       movew %a0@(58),%d1
    5cec:       2140 0040       movel %d0,%a0@(64)
    5cf0:       0241 00ff       andiw #255,%d1
    5cf4:       3141 0038       movew %d1,%a0@(56)
    5cf8:       b0aa 01d2       cmpl %a2@(466),%d0
    5cfc:       6708            beqs 5d06 <berr_040cleanup+0xa2>
    5cfe:       0041 0800       oriw #2048,%d1
    5d02:       3141 0038       movew %d1,%a0@(56)
    5d06:       3168 003a 003c  movew %a0@(58),%a0@(60)
    5d0c:       0268 ff7f 003a  andiw #-129,%a0@(58)
    5d12:       2168 0044 004c  movel %a0@(68),%a0@(76)
    5d18:       2168 0048 0050  movel %a0@(72),%a0@(80)
    5d1e:       2f08            movel %a0,%sp@-
    5d20:       61ff 0000 0e86  bsrl 6ba8 <send_fault_sig>
    5d26:       588f            addql #4,%sp
    5d28:       6000 00f2       braw 5e1c <berr_040cleanup+0x1b8>
    5d2c:       4a82            tstl %d2
    5d2e:       66ee            bnes 5d1e <berr_040cleanup+0xba>
    5d30:       6000 00ea       braw 5e1c <berr_040cleanup+0x1b8>
    5d34:       0800 0002       btst #2,%d0
    5d38:       67e4            beqs 5d1e <berr_040cleanup+0xba>
    5d3a:       2228 0048       movel %a0@(72),%d1
    5d3e:       2268 0044       moveal %a0@(68),%a1
    5d42:       4e7a 2001       movec %dfc,%d2
    5d46:       4e7b 0000       movec %d0,%sfc
    5d4a:       4e7b 0001       movec %d0,%dfc
    5d4e:       7660            moveq #96,%d3
    5d50:       c083            andl %d3,%d0
    5d52:       163c 0020       moveb #32,%d3
    5d56:       b680            cmpl %d0,%d3
    5d58:       6600 ff6a       bnew 5cc4 <berr_040cleanup+0x60>
    5d5c:       4280            clrl %d0
    5d5e:       0e11 1800       movesb %d1,%a1@
    5d62:       4e7b 2000       movec %d2,%sfc
    5d66:       4e7b 2001       movec %d2,%dfc
    5d6a:       4a80            tstl %d0
    5d6c:       6600 ff76       bnew 5ce4 <berr_040cleanup+0x80>
    5d70:       4268 003a       clrw %a0@(58)
    5d74:       6000 00a6       braw 5e1c <berr_040cleanup+0x1b8>
    5d78:       2428 0050       movel %a0@(80),%d2
    5d7c:       2268 004c       moveal %a0@(76),%a1
    5d80:       4e7a 3001       movec %dfc,%d3
    5d84:       2001            movel %d1,%d0
    5d86:       4e7b 0000       movec %d0,%sfc
    5d8a:       4e7b 0001       movec %d0,%dfc
    5d8e:       7260            moveq #96,%d1
    5d90:       c081            andl %d1,%d0
    5d92:       123c 0020       moveb #32,%d1
    5d96:       b280            cmpl %d0,%d1
    5d98:       6770            beqs 5e0a <berr_040cleanup+0x1a6>
    5d9a:       123c 0040       moveb #64,%d1
    5d9e:       b280            cmpl %d0,%d1
    5da0:       6744            beqs 5de6 <berr_040cleanup+0x182>
    5da2:       4a80            tstl %d0
    5da4:       676e            beqs 5e14 <berr_040cleanup+0x1b0>
    5da6:       4282            clrl %d2
=== 5da8:       4e7b 3000       movec %d3,%sfc
    5dac:       4e7b 3001       movec %d3,%dfc
    5db0:       4a82            tstl %d2
    5db2:       6746            beqs 5dfa <berr_040cleanup+0x196>
    5db4:       2028 004c       movel %a0@(76),%d0
    5db8:       3228 003c       movew %a0@(60),%d1
    5dbc:       2140 0040       movel %d0,%a0@(64)
    5dc0:       0241 00ff       andiw #255,%d1
    5dc4:       3141 0038       movew %d1,%a0@(56)
    5dc8:       b0aa 01d2       cmpl %a2@(466),%d0
    5dcc:       6700 fec2       beqw 5c90 <berr_040cleanup+0x2c>
    5dd0:       0041 0800       oriw #2048,%d1
    5dd4:       3141 0038       movew %d1,%a0@(56)
    5dd8:       6000 feb6       braw 5c90 <berr_040cleanup+0x2c>
    5ddc:       4280            clrl %d0
    5dde:       0e51 1800       movesw %d1,%a1@
    5de2:       6000 fef2       braw 5cd6 <berr_040cleanup+0x72>
    5de6:       4280            clrl %d0
    5de8:       0e51 2800       movesw %d2,%a1@
    5dec:       2400            movel %d0,%d2
    5dee:       4e7b 3000       movec %d3,%sfc
    5df2:       4e7b 3001       movec %d3,%dfc
    5df6:       4a82            tstl %d2
    5df8:       66ba            bnes 5db4 <berr_040cleanup+0x150>
    5dfa:       4268 003c       clrw %a0@(60)
    5dfe:       6000 fe90       braw 5c90 <berr_040cleanup+0x2c>
    5e02:       0e91 1800       movesl %d1,%a1@
    5e06:       6000 fece       braw 5cd6 <berr_040cleanup+0x72>
    5e0a:       4280            clrl %d0
    5e0c:       0e11 2800       movesb %d2,%a1@
    5e10:       2400            movel %d0,%d2
    5e12:       6094            bras 5da8 <berr_040cleanup+0x144>
    5e14:       0e91 2800       movesl %d2,%a1@
    5e18:       2400            movel %d0,%d2
    5e1a:       608c            bras 5da8 <berr_040cleanup+0x144>
    5e1c:       241f            movel %sp@+,%d2
    5e1e:       261f            movel %sp@+,%d3
    5e20:       4e75            rts

I'm a bit puzzled, as the crash location is not a memory dereference but
the "set_fs(MAKE_MM_SEG(wbs));" in do_040writeback1().

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for
 do_sigreturn
Date: Tue, 2 Feb 2016 09:59:42 +1000
Message-ID: <56AFF16E.2020506@uclinux.org>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
 <8737tcxoka.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out3.external.iinet.net.au ([203.59.1.153]:23395
	"EHLO icp-osb-irony-out3.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751819AbcBAX7Z (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Feb 2016 18:59:25 -0500
In-Reply-To: <8737tcxoka.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Andreas,

On 02/02/16 04:39, Andreas Schwab wrote:
> Greg Ungerer <gerg@uclinux.org> writes:
> 
>> The motivation for this change is a problem with non-MMU targets that
>> have broken signal return paths on newer versions of gcc. It appears as
>> though aliasing of the regs and switch stack pointers, caused by their
>> construction from pointers derived from the dummy long function parameter,
>> is resulting in the gcc optimizer removing what it thinks is useless
>> updates to the regs fields.
> 
> I wonder why gcc is doing that.  The kernel is explicitly built without
> strict aliasing, so this looks like something to investigate.

Agreed. My initial thoughts were this is a problem with gcc.
And I am not entirely sure it still isn't.


>> -asmlinkage int do_sigreturn(unsigned long __unused)
>> +asmlinkage int do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
> 
> Does it work to use this signature:
> 
> asmlinkage int do_sigreturn(struct switch_stack sw, struct pt_regs regs)
> 
> without changing the caller?

No, same problem. (I had to fix the use of regs inside the function,
but that was trivial). The generated code is essentially similar,
and large parts if it end up optimized away.

Original unmodified kernel code generates a do_sigreturn() as:

40021aaa <do_sigreturn>:
40021aaa:       4e56 ffd4       linkw %fp,#-44
40021aae:       2f0a            movel %a2,%sp@-
40021ab0:       4e68            movel %usp,%a0
40021ab2:       2028 0018       movel %a0@(24),%d0
40021ab6:       2d40 ffd4       movel %d0,%fp@(-44)
40021aba:       2448            moveal %a0,%a2
40021abc:       2d68 0014 ffd8  movel %a0@(20),%fp@(-40)
40021ac2:       486e ffd4       pea %fp@(-44)
40021ac6:       4eb9 4002 f0b8  jsr 4002f0b8 <set_current_blocked>
40021acc:       200f            movel %sp,%d0
40021ace:       0280 ffff e000  andil #-8192,%d0
40021ad4:       2240            moveal %d0,%a1
40021ad6:       203c 4002 f086  movel #1073934470,%d0
40021adc:       2051            moveal %a1@,%a0
40021ade:       2140 0154       movel %d0,%a0@(340)
40021ae2:       2d6a 0020 ffe4  movel %a2@(32),%fp@(-28)
40021ae8:       2d6a 001c ffe0  movel %a2@(28),%fp@(-32)
40021aee:       202e ffe4       movel %fp@(-28),%d0
40021af2:       206e ffe0       moveal %fp@(-32),%a0
40021af6:       4e60            movel %a0,%usp
40021af8:       246e ffd0       moveal %fp@(-48),%a2
40021afc:       588f            addql #4,%sp
40021afe:       4e5e            unlk %fp
40021b00:       4e75            rts


With your suggested change above it is generated as:

40021aaa <do_sigreturn>:
40021aaa:       4e56 ffd4       linkw %fp,#-44
40021aae:       2f0a            movel %a2,%sp@-
40021ab0:       4e68            movel %usp,%a0
40021ab2:       2448            moveal %a0,%a2
40021ab4:       202a 0018       movel %a2@(24),%d0
40021ab8:       2d40 ffd4       movel %d0,%fp@(-44)
40021abc:       2d6a 0014 ffd8  movel %a2@(20),%fp@(-40)
40021ac2:       486e ffd4       pea %fp@(-44)
40021ac6:       4eb9 4002 f0b8  jsr 4002f0b8 <set_current_blocked>
40021acc:       200f            movel %sp,%d0
40021ace:       0280 ffff e000  andil #-8192,%d0
40021ad4:       2240            moveal %d0,%a1
40021ad6:       203c 4002 f086  movel #1073934470,%d0
40021adc:       2051            moveal %a1@,%a0
40021ade:       2140 0154       movel %d0,%a0@(340)
40021ae2:       2d6a 001c ffe0  movel %a2@(28),%fp@(-32)
40021ae8:       2d6a 0020 ffe4  movel %a2@(32),%fp@(-28)
40021aee:       206e ffe0       moveal %fp@(-32),%a0
40021af2:       4e60            movel %a0,%usp
40021af4:       202e ffe4       movel %fp@(-28),%d0
40021af8:       588f            addql #4,%sp
40021afa:       246e ffd0       moveal %fp@(-48),%a2
40021afe:       4e5e            unlk %fp
40021b00:       4e75            rts


And finally with the patch I posted it generates:

40021aba <do_sigreturn>:
40021aba:	4e56 ffc0      	linkw %fp,#-64
40021abe:	48d7 0c1c      	moveml %d2-%d4/%a2-%a3,%sp@
40021ac2:	246e 0008      	moveal %fp@(8),%a2
40021ac6:	4e68           	movel %usp,%a0
40021ac8:	2648           	moveal %a0,%a3
40021aca:	202b 0018      	movel %a3@(24),%d0
40021ace:	2d40 ffd4      	movel %d0,%fp@(-44)
40021ad2:	2d6b 0014 ffd8 	movel %a3@(20),%fp@(-40)
40021ad8:	486e ffd4      	pea %fp@(-44)
40021adc:	4eb9 4002 f17c 	jsr 4002f17c <set_current_blocked>
40021ae2:	200f           	movel %sp,%d0
40021ae4:	0280 ffff e000 	andil #-8192,%d0
40021aea:	2240           	moveal %d0,%a1
40021aec:	203c 4002 f14a 	movel #1073934666,%d0
40021af2:	72ff           	moveq #-1,%d1
40021af4:	2051           	moveal %a1@,%a0
40021af6:	2140 0154      	movel %d0,%a0@(340)
40021afa:	2d6b 0020 ffe4 	movel %a3@(32),%fp@(-28)
40021b00:	2d6b 001c ffe0 	movel %a3@(28),%fp@(-32)
40021b06:	2d6b 0024 ffe8 	movel %a3@(36),%fp@(-24)
40021b0c:	2d6b 0028 ffec 	movel %a3@(40),%fp@(-20)
40021b12:	202e ffe4      	movel %fp@(-28),%d0
40021b16:	206e ffe0      	moveal %fp@(-32),%a0
40021b1a:	2d6b 002c fff0 	movel %a3@(44),%fp@(-16)
40021b20:	2d6b 0034 fff8 	movel %a3@(52),%fp@(-8)
40021b26:	2d6b 0038 fffc 	movel %a3@(56),%fp@(-4)
40021b2c:	24ae ffe8      	movel %fp@(-24),%a2@
40021b30:	256e ffec 0014 	movel %fp@(-20),%a2@(20)
40021b36:	256e fff0 0018 	movel %fp@(-16),%a2@(24)
40021b3c:	256e fffa 0030 	movel %fp@(-6),%a2@(48)
40021b42:	156e fff9 002f 	moveb %fp@(-7),%a2@(47)
40021b48:	2540 0020      	movel %d0,%a2@(32)
40021b4c:	2541 0024      	movel %d1,%a2@(36)
40021b50:	4e60           	movel %a0,%usp
40021b52:	780f           	moveq #15,%d4
40021b54:	588f           	addql #4,%sp
40021b56:	322e fffe      	movew %fp@(-2),%d1
40021b5a:	162a 002c      	moveb %a2@(44),%d3
40021b5e:	2401           	movel %d1,%d2
40021b60:	e08a           	lsrl #8,%d2
40021b62:	c684           	andl %d4,%d3
40021b64:	0282 0000 00f0 	andil #240,%d2
40021b6a:	0281 0000 0fff 	andil #4095,%d1
40021b70:	8483           	orl %d3,%d2
40021b72:	1542 002c      	moveb %d2,%a2@(44)
40021b76:	342a 002c      	movew %a2@(44),%d2
40021b7a:	0282 ffff f000 	andil #-4096,%d2
40021b80:	8282           	orl %d2,%d1
40021b82:	3541 002c      	movew %d1,%a2@(44)
40021b86:	4cee 0c1c ffc0 	moveml %fp@(-64),%d2-%d4/%a2-%a3
40021b8c:	4e5e           	unlk %fp
40021b8e:	4e75           	rts

The only generated code that works of these is last one -
with my patch applied.

Regards
Greg

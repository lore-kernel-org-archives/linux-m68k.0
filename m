From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [RFC PATCH 1/2] arch/m68k/lib/mulsi3.S: Optimize]
Date: Fri, 13 May 2016 16:45:29 +1000
Message-ID: <57357809.1000308@linux-m68k.org>
References: <20160513023631.15160.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160513023631.15160.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Hi George,

On 13/05/16 12:36, George Spelvin wrote:
>> I have many test setups for ColdFire (qemu and real hardware) but
>> none of them actually use the mulsi3 code. I don't have anything
>> for testing classic m68000 builds.
>>
>> So other than compiling it I don't have an easy way to currently
>> test it.
> 
> You couldn't write a user-level test program which calls __mulsi3(x,y)
> explicitly and compares the result to x*y?

I was hoping you would write the code :-)


> I'll write it for you if you like.
> 
> Even if we can only test the ColdFire branch, that reduces the number
> of untested lines considerably.

So is something like this what you had in mind?


    #include <unistd.h>
    #include <limits.h>

    #define STEP1   (99991)
    #define MIN1    (INT_MIN + STEP1)
    #define MAX1    (INT_MAX - STEP1)

    #define STEP2   (12345)
    #define MIN2    (INT_MIN + STEP2)
    #define MAX2    (INT_MAX - STEP2)

    int __mulsi3(int x, int y);

    int main(int argc, char *argv[])
    {
        int i, j;
        for (i = MIN1; i < MAX1; i += STEP1) {
                for (j = MIN2; j < MAX2; j += STEP2) {
                        if ((i * j) != __mulsi3(i, j)) {
                                write(1, "FAIL\n", 5);
                                return 1;
                        }
                }
        }
        return 0;
    }


I minimized the loop counts to make the run time reasonable.
Maybe a rand() version wouldn't hurt either.

Anyway, compiled as flat binary for execution that gives:

00000000 <main>:
   0:	518f           	subql #8,%sp
   2:	2f0d           	movel %a5,%sp@-
   4:	2f02           	movel %d2,%sp@-
   6:	203c 8001 8697 	movel #-2147383657,%d0
   c:	2f40 000c      	movel %d0,%sp@(12)
  10:	606c           	bras 7e <main+0x7e>
  12:	207c 8000 3039 	moveal #-2147471303,%a0
  18:	2f48 0008      	movel %a0,%sp@(8)
  1c:	604a           	bras 68 <main+0x68>
  1e:	242f 000c      	movel %sp@(12),%d2
  22:	41ef 0008      	lea %sp@(8),%a0
  26:	4c10 2800      	mulsl %a0@,%d2
  2a:	2f2f 0008      	movel %sp@(8),%sp@-
  2e:	2f2f 0010      	movel %sp@(16),%sp@-
  32:	202d 0000      	movel %a5@(0),%d0
  36:	2040           	moveal %d0,%a0
  38:	4e90           	jsr %a0@
  3a:	508f           	addql #8,%sp
  3c:	b082           	cmpl %d2,%d0
  3e:	671e           	beqs 5e <main+0x5e>
  40:	4878 0005      	pea 5 <main+0x5>
  44:	202d 0000      	movel %a5@(0),%d0
  48:	2f00           	movel %d0,%sp@-
  4a:	4878 0001      	pea 1 <main+0x1>
  4e:	202d 0000      	movel %a5@(0),%d0
  52:	2040           	moveal %d0,%a0
  54:	4e90           	jsr %a0@
  56:	4fef 000c      	lea %sp@(12),%sp
  5a:	7001           	moveq #1,%d0
  5c:	602e           	bras 8c <main+0x8c>
  5e:	203c 0000 3039 	movel #12345,%d0
  64:	d1af 0008      	addl %d0,%sp@(8)
  68:	207c 7fff cfc5 	moveal #2147471301,%a0
  6e:	b1ef 0008      	cmpal %sp@(8),%a0
  72:	6caa           	bges 1e <main+0x1e>
  74:	203c 0001 8697 	movel #99991,%d0
  7a:	d1af 000c      	addl %d0,%sp@(12)
  7e:	207c 7ffe 7967 	moveal #2147383655,%a0
  84:	b1ef 000c      	cmpal %sp@(12),%a0
  88:	6c88           	bges 12 <main+0x12>
  8a:	4280           	clrl %d0
  8c:	241f           	movel %sp@+,%d2
  8e:	2a5f           	moveal %sp@+,%a5
  90:	508f           	addql #8,%sp
  92:	4e75           	rts

And the mulsi.S gives:

00000000 <___mulsi3>:
   0:	41ef 0004      	lea %sp@(4),%a0
   4:	3018           	movew %a0@+,%d0
   6:	3218           	movew %a0@+,%d1
   8:	3241           	moveaw %d1,%a1
   a:	c2d8           	muluw %a0@+,%d1
   c:	c0d0           	muluw %a0@,%d0
   e:	d280           	addl %d0,%d1
  10:	3009           	movew %a1,%d0
  12:	c0d0           	muluw %a0@,%d0
  14:	4841           	swap %d1
  16:	4241           	clrw %d1
  18:	d081           	addl %d1,%d0
  1a:	4e75           	rts

That runs with no fails in qemu and on real ColdFire hardware.
I guess it wouldn't hurt to specifically check the corner cases
either (at MAX_INT, MIN_INT and 0 for example).

Regards
Greg

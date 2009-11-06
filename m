From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Fri, 06 Nov 2009 11:59:09 +0300
Message-ID: <4AF3E55D.8060603@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>  <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>  <4A8A6CA2.4040806@codesourcery.com> <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com> <4A91A4C8.5040803@codesourcery.com> <4A943ECC.80607@codesourcery.com> <4A97B69F.4000306@codesourcery.com> <4AC5CF12.8000200@codesourcery.com> <4AE5B9B7.7000106@codesourcery.com> <alpine.OSX.2.00.0910281209160.394@silk.local> <4AE7EAC2.8050409@codesourcery.com> <alpine.OSX.2.00.0911052033380.497@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:39158 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755194AbZKFI7N (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Nov 2009 03:59:13 -0500
In-Reply-To: <alpine.OSX.2.00.0911052033380.497@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Finn Thain wrote:
> On Wed, 28 Oct 2009, Maxim Kuvyrkov wrote:
> 
>> ...
>>
>> We [CodeSourcery] have just updated all of our toolchains, and the 
>> GNU/Linux toolchain is based on EGLIBC 2.10 and has well tested TLS/NPTL 
>> support.  If you are targeting ColdFire you can simply download the 
>> toolchain at <http://www.codesourcery.com/sgpp/lite/coldfire>.
...
> I did run into a problem with this second patch. It doesn't apply to the 
> eglibc_2.10 branch in svn as of yesterday. The following hunk is the 
> problem:

The patches posted are all against FSF GLIBC, not EGLIBC, so some 
conflicts are expected.
...
> Using the above patches, I am almost able to compile eglibc_2.10. But 
> there is an old build failure (since glibc-2.4 I think) when linking 
> libc.so:
> 
> /tmp/build/glibc-m68k-linux-gnu-3/libc_pic.os: In function `fchownat': (.text+0x911c2): undefined reference to `__atfct_seterrno'
> /tmp/gcc-4.4.1/lib/gcc/m68k-linux-gnu/4.4.1/../../../../m68k-linux-gnu/bin/ld: /tmp/build/glibc-m68k-linux-gnu-3/libc.so: hidden symbol `__atfct_seterrno' isn't defined
> /tmp/gcc-4.4.1/lib/gcc/m68k-linux-gnu/4.4.1/../../../../m68k-linux-gnu/bin/ld: final link failed: Nonrepresentable section on output
> collect2: ld returned 1 exit status
> make[1]: *** [/tmp/build/glibc-m68k-linux-gnu-3/libc.so] Error 1
> make[1]: Leaving directory `/tmp/build/glibc-2.10.1'
> make: *** [all] Error 2
> 
> To try to fix this issue, I've basically copied this patch:
>   http://sources.redhat.com/ml/libc-hacker/2006-08/msg00004.html
> An m68k version is attached. Can someone have a look at it and tell 
> whether this is the correct fix or not?

I don't really know, this is the first time I see this failure.

> The end result is that I now have a NPTL/TLS m68k toolchain 
> (binutils-2.19.51 and patched gcc-4.4.1). Thank you for making that 
> possible. I've not run the test suites yet, but so far it seems to work.
> 
> Only, I did find that a statically linked binary (pccardctl) built with 
> this toolchain segfaults ("unknown errorSegmentation fault") when run 
> under a linux-2.6.31 kernel that lacks your patches. Is this expected?

The binary will certainly not work, but I remember run-time linker 
gracefully exiting with a proper error message when invoked on a system 
with unpatched kernel.  I don't think I tested statically linked 
binaries on such system.

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724

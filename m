From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: toolchain, was Re: bogl: don't know screen type 1
Date: Sun, 13 Sep 2009 09:01:42 +0400
Message-ID: <4AAC7CB6.2060400@codesourcery.com>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com> <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com> <20090901151747.GB27514@marenka.net> <alpine.OSX.2.00.0909050045330.383@silk.local> <4AA2684E.1080009@codesourcery.com> <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:34242 "EHLO
	mail.codesourcery.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750874AbZIMFBt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Sep 2009 01:01:49 -0400
In-Reply-To: <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: fthain@telegraphics.com.au
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

fthain@telegraphics.com.au wrote:
> On Sat, 5 Sep 2009, Maxim Kuvyrkov wrote:
> 
>> Finn Thain wrote:
>> ...
>>
>>> I understand that the current GCC (4.4) lacks the necessary patches, 
>>> and 4.5 is still uncooked (and that's a scary prospect). Can someone 
>>> confirm that this is the necessary patch for 4.4: 
>>> http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
>> I think GCC 4.4 should be good enough.
> 
> I tried patching 4.4.1 and the patch was rejected. It expects 
> m68k_legitimize_address() to have been declared and defined, but that 
> routine isn't in gcc-4.4.

m68k.c:m68k_legitimize_address() was macro m68k.h:LEGITIMIZE_ADDRESS(), 
you need to move the hunk to m68k.h.

> 
> So, I edited the patch (see diff below). What bothers me is that this 
> removes the call to the new m68k_tls_symbol_p() routine:
> 
> ../../gcc-4.4.1/gcc/config/m68k/m68k.c: At top level:
> ../../gcc-4.4.1/gcc/config/m68k/m68k.c:2553: warning: 'm68k_tls_symbol_p' defined but not used
> 
> The compiler appears to work, but I haven't run any executable it produced 
> as yet. When we get eglibc-2.10 I plan to run the testsuites on '040 
> hardware, which is going to take a long time to complete. It would be nice 
> to know in advance whether this naive attempt at a backport is likely to 
> work or not (?)

It will fail to process __thread variables.

--
Maxim

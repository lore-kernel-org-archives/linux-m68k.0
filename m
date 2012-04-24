From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [RFC/PATCH] m68k: fix compiler warning by properly inlining flat_set_persistent()
Date: Tue, 24 Apr 2012 12:13:44 +1000
Message-ID: <4F960C58.3040006@snapgear.com>
References: <1335189010-8875-1-git-send-email-elezegarcia@gmail.com>	<CAMuHMdVtaDB_NpwxMFmosp7r=y-f=_PF1m0xC2-Rg50CLsTm3Q@mail.gmail.com> <CALF0-+UhCZZ+cpA88Mi1rz5QzecCxvwi6oZNNW7jmHJu7T6jsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CALF0-+UhCZZ+cpA88Mi1rz5QzecCxvwi6oZNNW7jmHJu7T6jsg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?windows-1252?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, uClinux development list <uclinux-dev@uclinux.org>

Hi Ezequiel,

On 24/04/12 08:43, Ezequiel Garc=EDa wrote:
> On Mon, Apr 23, 2012 at 6:07 PM, Geert Uytterhoeven
> <geert@linux-m68k.org>  wrote:
>> On Mon, Apr 23, 2012 at 15:50, Ezequiel Garcia<elezegarcia@gmail.com=
>  wrote:
>>> Signed-off-by: Ezequiel Garcia<elezegarcia@gmail.com>

Normally this signed-off-by goes after your patch description
(Documentation/SubmittingPatches section 12).


>>> ---
>>> To define or to inline that is the question:
>>> The current definition of flat_set_persistent produces a compiler
>>> warning; arch/sh/ does it in a different way defining it to
>>> a macro that uses persistent var. IMHO, an inline is easier to read=
=2E
>>
>> What's the compiler warning?
>> It seems several other nommu arches use the same definition for
>> flat_set_persistent()?
>>
>
> Here's the warning:
>    fs/binfmt_flat.c: In function =C3=A6load_flat_file=C3=86:
>    fs/binfmt_flat.c:752: warning: unused variable =C3=A6persistent=C3=
=86

I like to see the actual compiler messages in the git message
description as well.


> Yes, every arch except sh is using the same definition.
> My first thought was to extend the arch/sh definition:
>
>    #define flat_set_persistent(relval, p)          ({ (void)p; 0; })
>
> but in a conversation in the janitors list I was told that inlining
> to a return-only function is a common pattern.
> Plus, if you compare fs/built-in.o there is no extra code generated:
>
> $ size fs-built-in-flat-inline
>     text	   data	    bss	    dec	    hex	filename
>   233332	   1908	   1640	 236880	  39d50	built-in-flat-inline
> $ size fs/built-in.o
>     text	   data	    bss	    dec	    hex	filename
>   233332	   1908	   1640	 236880	  39d50	fs/built-in.o
>
> FWIW, this is my compiler, I built it using gentoo's crossdev tool.
>    gcc version 4.4.5 (Gentoo 4.4.5 p1.3, pie-0.4.5)
>
> So, what's your opinion?

I see the same warning on my gcc-4.5.1 based toolchain as well.
No surprise really given none of the m68k macros use the persistent arg=
=2E

If you want to move that signed-off-by and put the warning text in
the message description I will carry this in the m68knommu git tree.

Thanks
Greg


-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m

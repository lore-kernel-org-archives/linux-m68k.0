From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Subject: Re: [RFC/PATCH] m68k: fix compiler warning by properly inlining flat_set_persistent()
Date: Mon, 23 Apr 2012 19:43:48 -0300
Message-ID: <CALF0-+UhCZZ+cpA88Mi1rz5QzecCxvwi6oZNNW7jmHJu7T6jsg@mail.gmail.com>
References: <1335189010-8875-1-git-send-email-elezegarcia@gmail.com>
	<CAMuHMdVtaDB_NpwxMFmosp7r=y-f=_PF1m0xC2-Rg50CLsTm3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVtaDB_NpwxMFmosp7r=y-f=_PF1m0xC2-Rg50CLsTm3Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, uClinux development list <uclinux-dev@uclinux.org>

Hi Geert,

On Mon, Apr 23, 2012 at 6:07 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Apr 23, 2012 at 15:50, Ezequiel Garcia <elezegarcia@gmail.com=
> wrote:
>> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
>> ---
>> To define or to inline that is the question:
>> The current definition of flat_set_persistent produces a compiler
>> warning; arch/sh/ does it in a different way defining it to
>> a macro that uses persistent var. IMHO, an inline is easier to read.
>
> What's the compiler warning?
> It seems several other nommu arches use the same definition for
> flat_set_persistent()?
>

Here's the warning:
  fs/binfmt_flat.c: In function =91load_flat_file=92:
  fs/binfmt_flat.c:752: warning: unused variable =91persistent=92

Yes, every arch except sh is using the same definition.
My first thought was to extend the arch/sh definition:

  #define flat_set_persistent(relval, p)          ({ (void)p; 0; })

but in a conversation in the janitors list I was told that inlining
to a return-only function is a common pattern.
Plus, if you compare fs/built-in.o there is no extra code generated:

$ size fs-built-in-flat-inline
   text	   data	    bss	    dec	    hex	filename
 233332	   1908	   1640	 236880	  39d50	built-in-flat-inline
$ size fs/built-in.o
   text	   data	    bss	    dec	    hex	filename
 233332	   1908	   1640	 236880	  39d50	fs/built-in.o

=46WIW, this is my compiler, I built it using gentoo's crossdev tool.
  gcc version 4.4.5 (Gentoo 4.4.5 p1.3, pie-0.4.5)

So, what's your opinion?
Thanks,
Ezequiel.
